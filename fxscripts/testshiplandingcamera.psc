ScriptName FXScripts:TestShipLandingCamera Extends ObjectReference
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
ObjectReference ObjRef
String sLandingEvent = "Land"
String sTakeoffEvent = "TakeOff"

;-- Properties --------------------------------------
ObjectReference Property GroundCameraMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self as ObjectReference ; #DEBUG_LINE_NO:11
EndEvent

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:15
    Self.RegisterForAnimationEvent(ObjRef, sLandingEvent) ; #DEBUG_LINE_NO:16
    Self.RegisterForAnimationEvent(ObjRef, sTakeoffEvent) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  Self.UnRegisterForAnimationEvent(ObjRef, sLandingEvent) ; #DEBUG_LINE_NO:22
  Self.UnRegisterForAnimationEvent(ObjRef, sTakeoffEvent) ; #DEBUG_LINE_NO:23
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == sLandingEvent ; #DEBUG_LINE_NO:28
    GroundCameraMarker.PlayAnimation(sLandingEvent) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == sTakeoffEvent ; #DEBUG_LINE_NO:33
    GroundCameraMarker.PlayAnimation(sTakeoffEvent) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent
