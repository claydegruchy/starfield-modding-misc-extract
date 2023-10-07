ScriptName AnnihilatorModEffect Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property AnnihilatorSpawnHazardSelf Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  Actor target = Self.GetTargetActor() ; #DEBUG_LINE_NO:6
  AnnihilatorSpawnHazardSelf.Cast(target as ObjectReference, target as ObjectReference) ; #DEBUG_LINE_NO:8
  Self.Dispel() ; #DEBUG_LINE_NO:10
EndEvent
