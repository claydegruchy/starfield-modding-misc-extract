ScriptName UC01_ShipSim_TargetDeathScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  (Self.GetOwningQuest() as uc01_shipsimulationquestscript).EnemyDefeated() ; #DEBUG_LINE_NO:4
EndEvent
