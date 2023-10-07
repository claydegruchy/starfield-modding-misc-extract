ScriptName RAD04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property EndQuestStage = 1000 Auto Const
missionparentscript Property MissionParent Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  Self.RegisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted") ; #DEBUG_LINE_NO:8
EndEvent

Event MissionParentScript.MissionAccepted(missionparentscript akSender, Var[] akArgs)
  missionquestscript acceptedQuest = akArgs[0] as missionquestscript ; #DEBUG_LINE_NO:13
  If acceptedQuest as Bool && (acceptedQuest.MissionType == 0 || acceptedQuest.MissionType == 9) ; #DEBUG_LINE_NO:15
    Self.UnregisterForCustomEvent(MissionParent as ScriptObject, "missionparentscript_MissionAccepted") ; #DEBUG_LINE_NO:16
    Self.SetStage(EndQuestStage) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent
