ScriptName SQ_ShipRespawnCollectionScript Extends RefCollectionAlias Const

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSource, ObjectReference akKiller)
  spaceshipreference myShipRef = akSource as spaceshipreference ; #DEBUG_LINE_NO:4
  (Self.GetOwningQuest() as sq_shiprespawnscript).HandleShipDeathCollection(myShipRef) ; #DEBUG_LINE_NO:7
EndEvent
