ScriptName RI03_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI03_SimonIntroCount Auto Const mandatory

;-- Functions ---------------------------------------

Function AddToSimonCount()
  Float fCurrentCount = RI03_SimonIntroCount.GetValue() ; #DEBUG_LINE_NO:7
  RI03_SimonIntroCount.SetValue(fCurrentCount + 1.0) ; #DEBUG_LINE_NO:9
EndFunction
