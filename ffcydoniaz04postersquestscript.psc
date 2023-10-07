ScriptName FFCydoniaZ04PostersQuestScript Extends Quest

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
  Int TurnOffStageDone = -1
  { OPTIONAL - If stage TurnOffStageDone is set, this script's functionality is ignored }
  Bool CheckPlayerShip = True
  { if true (default), also check when player's ship changes location }
  Bool RequireExactLocation = True
  { if true (default), set stage when player enters/exits the exact target location
	  if false, set stage when player enters/exits target location or a child of the target location }
  GlobalVariable Visit02Time
  { The Global to set and check against the global time in the game for the purpose of enabling more posters }
  RefCollectionAlias RefCollectionAliasToEnable
  { If set, Enable this RefCollectionAlias }
EndStruct


;-- Variables ---------------------------------------
Int iStageDoneTotal = 0

;-- Properties --------------------------------------
GlobalVariable Property GameDaysPassed Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_Visit01_Time Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_TimeToPass Auto Const mandatory
Int Property EndQuestStage = 1000 Auto Const
ffcydoniaz04postersquestscript:changelocationstage[] Property ChangeLocationStages Auto Const
{ array of stage/location data }
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:54
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:55
  FFCydoniaZ04_Visit01_Time.SetValue(Utility.GetCurrentGameTime() + FFCydoniaZ04_TimeToPass.GetValue()) ; #DEBUG_LINE_NO:58
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:64
    Self.CheckLocationStages(akOldLoc, akNewLoc, False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == SQ_PlayerShip.PlayerShip ; #DEBUG_LINE_NO:72
    Self.CheckLocationStages(akOldLoc, akNewLoc, True) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckLocationStages(Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Int I = 0 ; #DEBUG_LINE_NO:79
  While I < ChangeLocationStages.Length ; #DEBUG_LINE_NO:80
    ffcydoniaz04postersquestscript:changelocationstage changeLocData = ChangeLocationStages[I] ; #DEBUG_LINE_NO:81
    If changeLocData.TargetLocation ; #DEBUG_LINE_NO:82
      If changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue() ; #DEBUG_LINE_NO:83
        Self.CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip) ; #DEBUG_LINE_NO:84
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If changeLocData.TargetLocationAlias ; #DEBUG_LINE_NO:88
      If changeLocData.Visit02Time == None || GameDaysPassed.GetValue() >= changeLocData.Visit02Time.GetValue() ; #DEBUG_LINE_NO:89
        Location TargetLocation = changeLocData.TargetLocationAlias.GetLocation() ; #DEBUG_LINE_NO:90
        Self.CheckLocation(TargetLocation, changeLocData, akOldLoc, akNewLoc, isPlayerShip) ; #DEBUG_LINE_NO:91
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:94
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function CheckLocation(Location TargetLocation, ffcydoniaz04postersquestscript:changelocationstage changeLocData, Location akOldLoc, Location akNewLoc, Bool isPlayerShip)
  Location locationToCheck = None ; #DEBUG_LINE_NO:100
  Location otherLocation = None ; #DEBUG_LINE_NO:101
  If changeLocData.SetStageOnEnterLocation ; #DEBUG_LINE_NO:103
    locationToCheck = akNewLoc ; #DEBUG_LINE_NO:104
    otherLocation = akOldLoc ; #DEBUG_LINE_NO:105
  Else ; #DEBUG_LINE_NO:
    locationToCheck = akOldLoc ; #DEBUG_LINE_NO:107
    otherLocation = akNewLoc ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  If TargetLocation == locationToCheck || changeLocData.RequireExactLocation == False && TargetLocation.IsChild(locationToCheck) && TargetLocation.IsChild(otherLocation) == False ; #DEBUG_LINE_NO:113
    If isPlayerShip == False || changeLocData.CheckPlayerShip ; #DEBUG_LINE_NO:116
      If Self.GetStageDone(changeLocData.StageToSet) == False && (changeLocData.PrereqStage == -1 || Self.GetStageDone(changeLocData.PrereqStage)) && (changeLocData.TurnOffStageDone == -1 || !Self.GetStageDone(changeLocData.TurnOffStageDone)) ; #DEBUG_LINE_NO:118
        Self.SetStage(changeLocData.StageToSet) ; #DEBUG_LINE_NO:120
        If changeLocData.RefCollectionAliasToEnable != None ; #DEBUG_LINE_NO:122
          changeLocData.RefCollectionAliasToEnable.EnableAll(False) ; #DEBUG_LINE_NO:123
        EndIf ; #DEBUG_LINE_NO:
        iStageDoneTotal += 1 ; #DEBUG_LINE_NO:126
        If changeLocData.Visit02Time != None ; #DEBUG_LINE_NO:128
          changeLocData.Visit02Time.SetValue(Utility.GetCurrentGameTime() + FFCydoniaZ04_TimeToPass.GetValue()) ; #DEBUG_LINE_NO:129
        EndIf ; #DEBUG_LINE_NO:
        If iStageDoneTotal == ChangeLocationStages.Length ; #DEBUG_LINE_NO:132
          Self.SetStage(EndQuestStage) ; #DEBUG_LINE_NO:133
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
