ScriptName RL064TestScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ExplosionFireHazardSpell Auto Const
ObjectReference Property IceLinked Auto
Explosion Property fragGrenadeExplosion Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:8
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:9
    IceLinked = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:15
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:23
  Self.MeltIce() ; #DEBUG_LINE_NO:24
EndEvent

Function MeltIce()
  Float currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:29
  While currentScale >= 0.100000001 ; #DEBUG_LINE_NO:30
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:31
    IceLinked.SetScale(currentScale * 0.899999976) ; #DEBUG_LINE_NO:32
    currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:33
  EndWhile ; #DEBUG_LINE_NO:
  IceLinked.Disable(False) ; #DEBUG_LINE_NO:35
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:36
EndFunction
