ScriptName FXScripts:JumpBoostRaycastFX Extends ActiveMagicEffect
{ Test script for ship landing effects. }

;-- Variables ---------------------------------------
Int ImpactTimer = 10
Int SafetyTimer = 20
Float SafetyTimerDuration = 10.0
Bool bPlayImpactEffects = False

;-- Properties --------------------------------------
ImpactDataSet Property BoosterImpactEffect Auto Const mandatory
{ The impact set that will be spawned from the ship thrusters. }
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 6.0 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:19
  Self.RegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:20
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  bPlayImpactEffects = False ; #DEBUG_LINE_NO:24
  Self.UnRegisterForAnimationEvent(akTarget, "StartImpactFX") ; #DEBUG_LINE_NO:25
  Self.UnRegisterForAnimationEvent(akTarget, "StopImpactFX") ; #DEBUG_LINE_NO:26
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  If asEventName == "StartImpactFX" ; #DEBUG_LINE_NO:31
    bPlayImpactEffects = True ; #DEBUG_LINE_NO:32
    akSource.PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:34
    Self.CancelTimer(SafetyTimer) ; #DEBUG_LINE_NO:35
    Self.StartTimer(SafetyTimerDuration, SafetyTimer) ; #DEBUG_LINE_NO:36
    Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "StopImpactFX" ; #DEBUG_LINE_NO:40
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:42
    Self.CancelTimer(ImpactTimer) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == ImpactTimer ; #DEBUG_LINE_NO:48
    If bPlayImpactEffects == True ; #DEBUG_LINE_NO:49
      Self.GetTargetActor().PlayImpactEffect(BoosterImpactEffect, "C_BackPack", 0.0, 0.0, -1.0, ImpactRange, True, False) ; #DEBUG_LINE_NO:50
      Self.StartTimer(ImpactRecastDelay, ImpactTimer) ; #DEBUG_LINE_NO:51
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == SafetyTimer ; #DEBUG_LINE_NO:54
    bPlayImpactEffects = False ; #DEBUG_LINE_NO:55
    Self.CancelTimer(ImpactTimer) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndEvent
