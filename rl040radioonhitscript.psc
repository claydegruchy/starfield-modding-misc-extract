ScriptName RL040RadioOnHitScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property myEnableMarker Auto Const mandatory
ObjectReference Property PirateSceneTrigger Auto Const mandatory
wwiseevent Property sSparkEvent Auto Const mandatory
Explosion Property ElectricalExplosionSmall Auto Const mandatory
Quest Property RL040Quest Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:13
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:14
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(Self as ScriptObject) ; #DEBUG_LINE_NO:18
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  sSparkEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:23
  PirateSceneTrigger.DisableNoWait(False) ; #DEBUG_LINE_NO:24
  myEnableMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:25
  RL040Quest.SetStage(30) ; #DEBUG_LINE_NO:26
EndEvent
