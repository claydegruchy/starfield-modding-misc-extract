ScriptName CF03QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function WaitQT()
  Self.StartTimer(120.0, 1) ; #DEBUG_LINE_NO:6
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:10
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
