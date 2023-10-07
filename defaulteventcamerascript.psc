ScriptName DefaultEventCameraScript Extends ObjectReference conditional

;-- Variables ---------------------------------------
Float Camera_Angle conditional
Float Camera_Move conditional

;-- Properties --------------------------------------
GlobalVariable Property CameraAngle Auto Const
{ Prefixed with "EC_Angle" }
GlobalVariable Property CameraMove Auto Const
{ Prefixed with "EC_Move" }
camerashot Property CameraShotToPlay Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  Camera_Angle = CameraAngle.GetValue() ; #DEBUG_LINE_NO:15
  Camera_Move = CameraMove.GetValue() ; #DEBUG_LINE_NO:16
EndEvent

Function Play()
  Game.PlayEventCamera(CameraShotToPlay, Self as ObjectReference) ; #DEBUG_LINE_NO:20
EndFunction
