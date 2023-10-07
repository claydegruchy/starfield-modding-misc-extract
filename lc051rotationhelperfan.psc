ScriptName LC051RotationHelperFan Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference DamageTrigger
ObjectReference FanRotationHelper

;-- Properties --------------------------------------
Float Property Speed Auto
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Keyword Property LinkCustom03 Auto Const
Keyword Property LinkCustom04 Auto Const
wwiseevent Property WwiseEvent_OBJ_HugeFanBlades_Off Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  DamageTrigger = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:14
  FanRotationHelper = Self.GetLinkedRef(LinkCustom02) ; #DEBUG_LINE_NO:15
  FanRotationHelper.SetAnimationVariableFloat("Speed", Speed) ; #DEBUG_LINE_NO:16
  FanRotationHelper.PlayAnimation("RotateCW_Loop") ; #DEBUG_LINE_NO:17
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Self.StopFanRotation() ; #DEBUG_LINE_NO:21
EndEvent

Function StopFanRotation()
  FanRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:25
  FanRotationHelper.PlayAnimation("Rotate_long") ; #DEBUG_LINE_NO:26
  DamageTrigger.Disable(False) ; #DEBUG_LINE_NO:27
  WwiseEvent_OBJ_HugeFanBlades_Off.play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:28
  Self.GetLinkedRef(LinkCustom03).Disable(False) ; #DEBUG_LINE_NO:29
  Self.GetLinkedRef(LinkCustom04).Disable(False) ; #DEBUG_LINE_NO:30
EndFunction
