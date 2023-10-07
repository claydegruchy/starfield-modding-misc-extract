ScriptName City_NA_Well01_LightScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Myself Auto
Quest Property City_NA_Well01 Auto Const mandatory
GlobalVariable Property MyGlobal Auto

;-- Functions ---------------------------------------

Function SwapState()
  Myself = Self.GetReference() ; #DEBUG_LINE_NO:7
  If MyGlobal.GetValueInt() == 0 ; #DEBUG_LINE_NO:9
    MyGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:10
    Myself.PlayAnimation("Play01") ; #DEBUG_LINE_NO:12
  Else ; #DEBUG_LINE_NO:
    MyGlobal.SetValue(0.0) ; #DEBUG_LINE_NO:14
    Myself.PlayAnimation("Play02") ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndFunction
