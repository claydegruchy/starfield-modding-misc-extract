ScriptName DialogueCydoniaConvoCommunityScript Extends Quest
{ Shared script for the Cydonia Community Center Conversation quests }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property MeetingDuration Auto Const mandatory
Int Property StageToCheckGetDone Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.StartTimerGameTime(MeetingDuration, 0) ; #DEBUG_LINE_NO:9
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  If !Self.GetStageDone(StageToCheckGetDone) ; #DEBUG_LINE_NO:14
    Self.Stop() ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
