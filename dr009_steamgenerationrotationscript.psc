ScriptName DR009_SteamGenerationRotationScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property level0Speed Auto Const
Float Property level1Speed Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  ObjectReference[] rotationHelpers = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:7
  Self.PlayRotationAnimation(rotationHelpers[0], level0Speed) ; #DEBUG_LINE_NO:9
  Self.PlayRotationAnimation(rotationHelpers[1], level1Speed) ; #DEBUG_LINE_NO:10
EndEvent

Function PlayRotationAnimation(ObjectReference roationHelper, Float speed)
  roationHelper.SetAnimationVariableFloat("speed", speed) ; #DEBUG_LINE_NO:15
  roationHelper.PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:16
EndFunction
