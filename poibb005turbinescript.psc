ScriptName POIBB005TurbineScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Blades Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:6
  Blades.SetAnimationVariableFloat("Speed", 0.25) ; #DEBUG_LINE_NO:7
  Blades.PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:8
EndEvent
