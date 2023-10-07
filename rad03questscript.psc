ScriptName RAD03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndQuestStage = 1000 Auto Const
missionparentscript Property MissionParent Auto Const mandatory
missionquestscript[] Property CargoMissions Auto Const
missionparentscript Property MB_Parent Auto Const mandatory
LocationAlias Property Alias_MissionBoardLoc Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:14
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted") ; #DEBUG_LINE_NO:15
EndEvent

Event OnQuestStarted()
  If Self.CheckForActiveCargoMissions() ; #DEBUG_LINE_NO:19
    Self.SetStage(EndQuestStage) ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    Location missionLoc = Alias_MissionBoardLoc.GetLocation() ; #DEBUG_LINE_NO:23
    MB_Parent.ResetMissions(True, False, missionLoc, True) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function CheckForActiveCargoMissions()
  Bool foundActiveMission = False ; #DEBUG_LINE_NO:30
  Int I = 0 ; #DEBUG_LINE_NO:31
  While I < CargoMissions.Length && foundActiveMission == False ; #DEBUG_LINE_NO:32
    missionquestscript theMission = CargoMissions[I] ; #DEBUG_LINE_NO:33
    If theMission.PlayerAcceptedQuest && theMission.PlayerCompletedQuest == False && theMission.PlayerFailedQuest == False ; #DEBUG_LINE_NO:35
      foundActiveMission = True ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:38
  EndWhile ; #DEBUG_LINE_NO:
  Return foundActiveMission ; #DEBUG_LINE_NO:40
EndFunction

Event MissionParentScript.MissionAccepted(missionparentscript akSender, Var[] akArgs)
  missionquestscript acceptedQuest = akArgs[0] as missionquestscript ; #DEBUG_LINE_NO:46
  If acceptedQuest as Bool && acceptedQuest.MissionType == 1 ; #DEBUG_LINE_NO:48
    Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted") ; #DEBUG_LINE_NO:49
    Self.SetStage(EndQuestStage) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndEvent
