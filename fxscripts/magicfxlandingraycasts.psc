ScriptName FXScripts:MagicFXLandingRaycasts Extends ActiveMagicEffect
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
ObjectReference ObjRef
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property ThrusterDustKickupImpacts Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
ImpactDataSet Property ThrusterFireKickupImpacts Auto Const mandatory
{ The impact set that will be spawned very close from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 50.0 Auto Const
Float Property ImpactCloseRange = 15.0 Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self.GetTargetActor() as ObjectReference ; #DEBUG_LINE_NO:18
  If ObjRef ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ObjRef = (akTarget as Actor) as ObjectReference ; #DEBUG_LINE_NO:26
  If ObjRef ; #DEBUG_LINE_NO:27
    Self.RegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:28
    Self.RegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If ObjRef ; #DEBUG_LINE_NO:35
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:36
    Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:37
    Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX" ; #DEBUG_LINE_NO:44
    bPlayImpactEffects = True ; #DEBUG_LINE_NO:45
    Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "StopImpactFX" ; #DEBUG_LINE_NO:50
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == ImpactTimer ; #DEBUG_LINE_NO:57
    If bPlayImpactEffects == True ; #DEBUG_LINE_NO:58
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:59
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster02", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:60
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster03", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:61
      ObjRef.PlayImpactEffect(ThrusterDustKickupImpacts, "ThrusterRayCaster04", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:62
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster01", 0.0, 0.0, -1.0, ImpactCloseRange, True, False) ; #DEBUG_LINE_NO:64
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster02", 0.0, 0.0, -1.0, ImpactCloseRange, True, False) ; #DEBUG_LINE_NO:65
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster03", 0.0, 0.0, -1.0, ImpactCloseRange, True, False) ; #DEBUG_LINE_NO:66
      ObjRef.PlayImpactEffect(ThrusterFireKickupImpacts, "ThrusterRayCaster04", 0.0, 0.0, -1.0, ImpactCloseRange, True, False) ; #DEBUG_LINE_NO:67
      Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:68
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
