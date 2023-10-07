ScriptName DefaultQuestChangeLocationScript Extends Quest Const default
{ set a stage when the player enters or exits a location }

;-- Structs -----------------------------------------
Struct ChangeLocationStage
  Int StageToSet = -1
  { Stage to Set }
  Location TargetLocation
  { The location we're interested in. }
  LocationAlias TargetLocationAlias
  { The location alias we're interested in. }
  Bool SetStageOnEnterLocation = True
  { if true (default), set stage when player enters location. If false,  set stage when player exits location }
  Int PrereqStage = -1
  { OPTIONAL - Stage that must be set for this script's functionality to execute }
  Int TurnOffStage = -1
  { OPTIONAL - If stage >= TurnOffStage, this script's functionality is ignored }
  Bool CheckPlayerShip = True
  { if true (default), also check when player's ship changes location }
  Bool RequireExactLocation = True
  { if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when:
	     SetStageOnEnterLocation = true: player enters target location or a child of the target location
	     SetStageOnEnterLocation = false: player exits target location or a child of the target location, and is no longer in the target location or any children }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
defaultquestchangelocationscript:changelocationstage[] Property ChangeLocationStages Auto Const
{ array of stage/location data }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }
Int Property OverridePrereqStage = -1 Auto Const
{ if this is set to a value > -1, ChangeLocationStages will not be checked at all until this stage is set }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:46
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:47
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If OverridePrereqStage < 0 || Self.GetStageDone(OverridePrereqStage) ; #DEBUG_LINE_NO:52
    If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:54
      Self.CheckLocationStages(akOldLoc, akNewLoc, False) ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If OverridePrereqStage < 0 || Self.GetStageDone(OverridePrereqStage) ; #DEBUG_LINE_NO:63
    If akSender == SQ_PlayerShip.PlayerShip ; #DEBUG_LINE_NO:65
      Self.CheckLocationStages(akOldLoc, akNewLoc, True) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Int I = 0 ; #DEBUG_LINE_NO:76
  While I < ChangeLocationStages.Length ; #DEBUG_LINE_NO:77
    defaultquestchangelocationscript:changelocationstage changeLocData = ChangeLocationStages[I] ; #DEBUG_LINE_NO:78
    If changeLocData.TargetLocation ; #DEBUG_LINE_NO:79
      Self.CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip) ; #DEBUG_LINE_NO:80
    EndIf ; #DEBUG_LINE_NO:
    If changeLocData.TargetLocationAlias ; #DEBUG_LINE_NO:83
      Location TargetLocation = changeLocData.TargetLocationAlias.GetLocation() ; #DEBUG_LINE_NO:84
      Self.CheckLocation(TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:87
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CheckLocation(Location TargetLocation, defaultquestchangelocationscript:changelocationstage changeLocData, Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Location locationToCheck = None ; #DEBUG_LINE_NO:94
  Location otherLocation = None ; #DEBUG_LINE_NO:95
  Bool bIsValidLocation = False ; #DEBUG_LINE_NO:97
  If changeLocData.SetStageOnEnterLocation ; #DEBUG_LINE_NO:99
    If TargetLocation == akNewLoc || changeLocData.RequireExactLocation == False && TargetLocation.IsChild(akNewLoc) && TargetLocation.IsChild(akOldLoc) == False ; #DEBUG_LINE_NO:101
      bIsValidLocation = True ; #DEBUG_LINE_NO:103
    EndIf ; #DEBUG_LINE_NO:
  ElseIf changeLocData.RequireExactLocation ; #DEBUG_LINE_NO:108
    bIsValidLocation = TargetLocation == akOldLoc ; #DEBUG_LINE_NO:109
  Else ; #DEBUG_LINE_NO:
    If isPlayerShip == False ; #DEBUG_LINE_NO:111
      If akNewLoc == SQ_PlayerShip.playerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:113
        akNewLoc = SQ_PlayerShip.PlayerShip.GetRef().GetCurrentLocation() ; #DEBUG_LINE_NO:114
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If TargetLocation != akNewLoc && TargetLocation.IsChild(akNewLoc) == False && (TargetLocation == akOldLoc || TargetLocation.IsChild(akOldLoc)) ; #DEBUG_LINE_NO:125
      bIsValidLocation = True ; #DEBUG_LINE_NO:126
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If bIsValidLocation ; #DEBUG_LINE_NO:132
    If isPlayerShip == False || changeLocData.CheckPlayerShip ; #DEBUG_LINE_NO:135
      If Self.GetStageDone(changeLocData.StageToSet) == False && (changeLocData.PrereqStage == -1 || Self.GetStageDone(changeLocData.PrereqStage)) && (changeLocData.TurnOffStage == -1 || Self.GetStage() < changeLocData.TurnOffStage) ; #DEBUG_LINE_NO:137
        Self.SetStage(changeLocData.StageToSet) ; #DEBUG_LINE_NO:140
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
