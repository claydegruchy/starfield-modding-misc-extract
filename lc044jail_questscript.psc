ScriptName LC044Jail_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Function StartJailTimer()
  Self.StartTimer(60.0, 1) ; #DEBUG_LINE_NO:7
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 && !Self.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:11
    Self.SetStage(iStageToSet) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
