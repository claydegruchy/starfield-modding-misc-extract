ScriptName SpaceProjectileSpellEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Int CONST_RandomSeedMax = 100000 Const
Int CONST_RandomSeedMin = -100000 Const
ObjectReference hazardTarget
ObjectReference[] hitProjectileSources

;-- Properties --------------------------------------
Group HitProjectile
  Float Property CONST_HitProjectile_SpawnDelayMin = 1.0 Auto Const
  Float Property CONST_HitProjectile_SpawnDelayMax = 1.0 Auto Const
  Int Property CONST_HitProjectile_SpawnDistanceMin = 200 Auto Const
  Int Property CONST_HitProjectile_SpawnDistanceMax = 500 Auto Const
  Float Property CONST_HitProjectile_ForwardArcChanceForPlayer = 1.0 Auto Const
  Int Property CONST_HitProjectile_ForwardArcDegrees = 20 Auto Const
  Int Property CONST_HitProjectileSourcesCount = 10 Auto Const
EndGroup

Spell Property LC088_DefensiveBatteryFireProjectileSpell Auto Const mandatory
Spell Property Debug_SpaceProjectileSpell Auto Const mandatory
Activator Property ProjectileSourceMarker01 Auto Const mandatory
Static Property XMarkerHeading Auto Const mandatory
ActorValue Property DebugHazardValue Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  hazardTarget = akTarget ; #DEBUG_LINE_NO:31
  hitProjectileSources = new ObjectReference[CONST_HitProjectileSourcesCount] ; #DEBUG_LINE_NO:32
  Self.RegisterForRemoteEvent((akTarget as spaceshipreference) as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:33
  Self.StartTimer(0.0, 0) ; #DEBUG_LINE_NO:34
EndEvent

Event SpaceshipReference.OnLocationChange(spaceshipreference akSource, Location akOldLoc, Location akNewLoc)
  hazardTarget.RestoreValue(DebugHazardValue, 10000.0) ; #DEBUG_LINE_NO:39
  hazardTarget.DispelSpell(Debug_SpaceProjectileSpell) ; #DEBUG_LINE_NO:40
EndEvent

Event OnTimer(Int timerID)
  Float currentHazardValue = hazardTarget.GetValue(DebugHazardValue) ; #DEBUG_LINE_NO:44
  If currentHazardValue < 0.0 ; #DEBUG_LINE_NO:46
    hazardTarget.RestoreValue(DebugHazardValue, 10000.0) ; #DEBUG_LINE_NO:47
    ObjectReference sourceToDelete = hitProjectileSources[0] ; #DEBUG_LINE_NO:48
    If sourceToDelete != None ; #DEBUG_LINE_NO:49
      sourceToDelete.Delete() ; #DEBUG_LINE_NO:50
    EndIf ; #DEBUG_LINE_NO:
    hitProjectileSources.remove(0, 1) ; #DEBUG_LINE_NO:52
    Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:54
    offsets[0] = 0.0 ; #DEBUG_LINE_NO:55
    offsets[1] = Utility.RandomFloat(CONST_HitProjectile_SpawnDistanceMin as Float, CONST_HitProjectile_SpawnDistanceMax as Float) ; #DEBUG_LINE_NO:56
    offsets[2] = 0.0 ; #DEBUG_LINE_NO:57
    ObjectReference projectileSource = hazardTarget.PlaceAtMe(ProjectileSourceMarker01 as Form, 1, False, False, True, offsets, None, True) ; #DEBUG_LINE_NO:58
    LC088_DefensiveBatteryFireProjectileSpell.Cast(projectileSource, hazardTarget) ; #DEBUG_LINE_NO:60
    hitProjectileSources.add(projectileSource, 1) ; #DEBUG_LINE_NO:61
    Self.StartTimer(Utility.RandomFloat(CONST_HitProjectile_SpawnDelayMin, CONST_HitProjectile_SpawnDelayMax), 0) ; #DEBUG_LINE_NO:63
  Else ; #DEBUG_LINE_NO:
    hazardTarget.DispelSpell(Debug_SpaceProjectileSpell) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent
