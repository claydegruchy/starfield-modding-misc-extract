ScriptName RAD02Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory

;-- Functions ---------------------------------------

Function StoryCheck()
  RAD02_InterviewCount.Mod(1.0) ; #DEBUG_LINE_NO:7
  If RAD02_InterviewCount.GetValue() >= 6.0 ; #DEBUG_LINE_NO:10
    Self.SetStage(8000) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndFunction
