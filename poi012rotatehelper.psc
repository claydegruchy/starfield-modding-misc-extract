ScriptName POI012RotateHelper Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  Self.SetAnimationVariableFloat("Speed", 0.01) ; #DEBUG_LINE_NO:5
  Self.PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:6
EndEvent
