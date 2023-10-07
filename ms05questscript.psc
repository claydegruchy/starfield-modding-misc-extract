ScriptName MS05QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CompleteBountyStage = 510 Auto Const
Int Property CompletePassengerStage = 520 Auto Const
missionparentscript Property MissionParent Auto Const mandatory

;-- Functions ---------------------------------------

Function StartMissions()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionCompleted") ; #DEBUG_LINE_NO:10
EndFunction

Function MissionsCompleted()
  Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionCompleted") ; #DEBUG_LINE_NO:15
EndFunction

Event MissionParentScript.MissionCompleted(missionparentscript akSender, Var[] akArgs)
  missionquestscript completedQuest = akArgs[0] as missionquestscript ; #DEBUG_LINE_NO:23
  Bool missionFailed = akArgs[1] as Bool ; #DEBUG_LINE_NO:24
  If missionFailed == False ; #DEBUG_LINE_NO:26
    If completedQuest as Bool && completedQuest.MissionType == 2 ; #DEBUG_LINE_NO:27
      Self.SetStage(CompletePassengerStage) ; #DEBUG_LINE_NO:28
    ElseIf completedQuest as Bool && completedQuest.MissionType == 9 ; #DEBUG_LINE_NO:29
      Self.SetStage(CompleteBountyStage) ; #DEBUG_LINE_NO:30
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
