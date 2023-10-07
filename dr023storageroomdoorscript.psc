ScriptName DR023StorageRoomDoorScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property DR023_DoorLeftRotationHelper Auto Const mandatory
ObjectReference Property DR023_DoorRightRotationHelper Auto Const mandatory

;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Done") ; #DEBUG_LINE_NO:10
    DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Position", 0.25) ; #DEBUG_LINE_NO:11
    DR023_DoorLeftRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:12
    DR023_DoorLeftRotationHelper.PlayAnimation("Rotate_Short") ; #DEBUG_LINE_NO:13
    DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Position", 0.25) ; #DEBUG_LINE_NO:15
    DR023_DoorRightRotationHelper.SetAnimationVariableFloat("Speed", 0.100000001) ; #DEBUG_LINE_NO:16
    DR023_DoorRightRotationHelper.PlayAnimation("Rotate_Short") ; #DEBUG_LINE_NO:17
  EndEvent
EndState
