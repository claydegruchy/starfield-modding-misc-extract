ScriptName City_Akila_Ashta02_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Function Wait24()
  Self.StartTimerGameTime(24.0, 1) ; #DEBUG_LINE_NO:8
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:13
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent
