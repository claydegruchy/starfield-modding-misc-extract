ScriptName TestNPCNonCombatSpawn Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const mandatory
Bool Property SpawnOnLoad = False Auto Const
Int Property GroupSize = 1 Auto Const
{ Number of NPCs to spawn per group }
ObjectReference Property LinkRefHub Auto Const mandatory
{ Contains the linked references chain to the spawners, which in turn has the references to the patrols }

;-- Functions ---------------------------------------

Event OnLoad()
  If SpawnOnLoad ; #DEBUG_LINE_NO:14
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:15
    (SpawnController as testnpcarenascript).SpawnNonCombatActors(GroupSize, LinkRefHub) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  (SpawnController as testnpcarenascript).SpawnNonCombatActors(GroupSize, LinkRefHub) ; #DEBUG_LINE_NO:21
EndEvent
