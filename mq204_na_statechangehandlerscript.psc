ScriptName MQ204_NA_StateChangeHandlerScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const
Int Property LeftNAStageToSet = 100 Auto Const
Int Property LeftNAPrereqStage = 10 Auto Const
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:9
  Self.RegisterForRemoteEvent(SQ_PlayerShip.PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:10
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:14
    If Self.GetStageDone(LeftNAPrereqStage) ; #DEBUG_LINE_NO:15
      If akOldLoc == CityNewAtlantisLocation || akOldLoc.IsChild(CityNewAtlantisLocation) ; #DEBUG_LINE_NO:16
        If akSender.IsInLocation(CityNewAtlantisLocation) == False ; #DEBUG_LINE_NO:17
          Self.SetStage(LeftNAStageToSet) ; #DEBUG_LINE_NO:18
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  If akSender == SQ_PlayerShip.PlayerShip ; #DEBUG_LINE_NO:26
    If Self.GetStageDone(LeftNAPrereqStage) ; #DEBUG_LINE_NO:27
      If akOldLoc == CityNewAtlantisLocation || akOldLoc.IsChild(CityNewAtlantisLocation) ; #DEBUG_LINE_NO:28
        If akSender.GetRef().IsInLocation(CityNewAtlantisLocation) == False ; #DEBUG_LINE_NO:29
          Self.SetStage(LeftNAStageToSet) ; #DEBUG_LINE_NO:30
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
