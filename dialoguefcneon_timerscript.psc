ScriptName DialogueFCNeon_TimerScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(24.0, 1) ; #DEBUG_LINE_NO:7
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:11
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
