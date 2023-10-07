ScriptName TestNPCCombatSpawn Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:4
  If SpawnControllerFromLink ; #DEBUG_LINE_NO:6
    (SpawnControllerFromLink as testnpcarenascript).SpawnTeams(Self as ObjectReference) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
