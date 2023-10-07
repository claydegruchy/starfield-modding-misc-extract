ScriptName LC056BossRoomExitDoorScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DoorLeftRotationHelper Auto Const mandatory
ObjectReference Property DoorRightRotationHelper Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25) ; #DEBUG_LINE_NO:7
  DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:8
  DoorLeftRotationHelper.PlayAnimation("Rotate_Short") ; #DEBUG_LINE_NO:9
  DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25) ; #DEBUG_LINE_NO:11
  DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:12
  DoorRightRotationHelper.PlayAnimation("Rotate_Short") ; #DEBUG_LINE_NO:13
EndEvent
