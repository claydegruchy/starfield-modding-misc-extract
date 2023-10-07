ScriptName City_AkilaLife07_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property AkilaLife06_DocPending Auto Const mandatory

;-- Functions ---------------------------------------

Function GotObject(Int nStage)
  AkilaLife06_DocPending.SetValue(1.0) ; #DEBUG_LINE_NO:8
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:11
    Self.SetObjectiveDisplayed(nStage, True, False) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(nStage) ; #DEBUG_LINE_NO:17
EndFunction
