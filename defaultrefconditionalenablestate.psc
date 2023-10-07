ScriptName DefaultRefConditionalEnableState Extends ObjectReference Const
{ Enable/Disable on load if matching conditions. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  conditionform Property EnableConditions Auto Const mandatory
  { Condition form that must be true to enable. THIS reference is the Subject in the conditions. }
  Bool Property DisableIfFalse = True Auto Const
  { if true (default), disable if condition form is false. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If EnableConditions.IsTrue(Self as ObjectReference, None) ; #DEBUG_LINE_NO:19
    Self.Enable(False) ; #DEBUG_LINE_NO:21
  ElseIf DisableIfFalse ; #DEBUG_LINE_NO:
    Self.Disable(False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
