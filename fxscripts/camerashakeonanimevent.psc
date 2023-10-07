ScriptName FXScripts:CameraShakeOnAnimEvent Extends ObjectReference Const
{ Shake the camera on an animation event }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
String[] Property sAnimEventList Auto Const mandatory
Float Property fCameraShake = 1.0 Auto Const
Float Property fCameraShakeDuration = 1.0 Auto Const

;-- Functions ---------------------------------------

Function ShakeAndRumble(Float fShakeAmount, Float fShakeTime)
  Game.ShakeCamera(None, fShakeAmount, fShakeTime) ; #DEBUG_LINE_NO:10
  Game.ShakeController(fShakeAmount, fShakeAmount, fShakeTime) ; #DEBUG_LINE_NO:11
EndFunction

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:15
    Int I = 0 ; #DEBUG_LINE_NO:16
    While I < sAnimEventList.Length ; #DEBUG_LINE_NO:17
      Self.RegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I]) ; #DEBUG_LINE_NO:18
      I += 1 ; #DEBUG_LINE_NO:20
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If sAnimEventList.find(asEventName, 0) < 0 ; #DEBUG_LINE_NO:26
    Return  ; #DEBUG_LINE_NO:27
  Else ; #DEBUG_LINE_NO:
    Self.ShakeAndRumble(fCameraShake, fCameraShakeDuration) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  Int I = 0 ; #DEBUG_LINE_NO:34
  While I < sAnimEventList.Length ; #DEBUG_LINE_NO:35
    Self.UnRegisterForAnimationEvent(Self as ObjectReference, sAnimEventList[I]) ; #DEBUG_LINE_NO:36
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
