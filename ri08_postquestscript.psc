ScriptName RI08_PostQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iTimer Auto Const mandatory
Int Property iQuestStage Auto Const mandatory

;-- Functions ---------------------------------------

Function StartPostQuestTimer()
  Self.StartTimerGameTime(iTimer as Float, 1) ; #DEBUG_LINE_NO:7
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:11
    Self.SetStage(iQuestStage) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
