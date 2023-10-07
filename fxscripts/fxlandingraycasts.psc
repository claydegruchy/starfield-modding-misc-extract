ScriptName FXScripts:FXLandingRaycasts Extends ObjectReference
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ThrusterDustKickupImpacts Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 50.0 Auto Const
Float Property ImpactCloseRange = 15.0 Auto Const
String Property ThrusterRayCaster01 = "FX_LightEngBig" Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference ObjRef = Self as ObjectReference ; #DEBUG_LINE_NO:69
  bPlayImpactEffects = True ; #DEBUG_LINE_NO:71
  Self.RegisterForAnimationEvent(ObjRef, "StartImpactFX") ; #DEBUG_LINE_NO:72
  Self.RegisterForAnimationEvent(ObjRef, "StopImpactFX") ; #DEBUG_LINE_NO:73
EndEvent

Event OnUnLoad()
  ObjectReference ObjRef = Self as ObjectReference ; #DEBUG_LINE_NO:77
  bPlayImpactEffects = False ; #DEBUG_LINE_NO:79
  Self.UnRegisterForAnimationEvent(ObjRef, "StartImpactFX") ; #DEBUG_LINE_NO:80
  Self.UnRegisterForAnimationEvent(ObjRef, "StopImpactFX") ; #DEBUG_LINE_NO:81
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX" ; #DEBUG_LINE_NO:86
    bPlayImpactEffects = True ; #DEBUG_LINE_NO:87
    Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "StopImpactFX" ; #DEBUG_LINE_NO:92
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  ObjectReference ObjRef = Self as ObjectReference ; #DEBUG_LINE_NO:99
  If aiTimerID == ImpactTimer ; #DEBUG_LINE_NO:100
    If bPlayImpactEffects == True ; #DEBUG_LINE_NO:101
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, ThrusterRayCaster01, 0.0, 0.0, -1.0, ImpactRange, False, False) ; #DEBUG_LINE_NO:103
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, ThrusterRayCaster01, 0.0, 0.0, -1.0, ImpactCloseRange, False, False) ; #DEBUG_LINE_NO:108
      Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:112
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
