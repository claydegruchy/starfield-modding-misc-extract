ScriptName Botany03_WaitScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(12.0, 1) ; #DEBUG_LINE_NO:6
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:10
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
