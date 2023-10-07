ScriptName TestCryoTankExplode Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ExplosionFireHazardSpell Auto Const
Explosion Property fragGrenadeExplosion Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:7
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:13
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:19
  Self.FreezeIce() ; #DEBUG_LINE_NO:20
EndEvent

Function FreezeIce()
  ObjectReference IceLinked = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:26
  Float MaxScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:29
  IceLinked.SetScale(0.01) ; #DEBUG_LINE_NO:30
  Float currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:31
  While currentScale <= MaxScale - 0.200000003 ; #DEBUG_LINE_NO:32
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:33
    IceLinked.SetScale(currentScale * 1.200000048) ; #DEBUG_LINE_NO:34
    currentScale = IceLinked.GetScale() ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
  IceLinked.SetScale(MaxScale) ; #DEBUG_LINE_NO:37
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:38
EndFunction
