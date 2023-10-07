ScriptName SQ_ShipRespawnAliasScript Extends ReferenceAlias Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  spaceshipreference myShipRef = Self.GetShipRef() ; #DEBUG_LINE_NO:4
  (Self.GetOwningQuest() as sq_shiprespawnscript).HandleShipDeath(Self as ReferenceAlias) ; #DEBUG_LINE_NO:7
EndEvent
