ScriptName SE_PatrolSpawnScript Extends Quest
{ Handles spawning ships for SE_Patrol encounters.  Deadcounts must be defined in SEScript and RECollectionAlias scripts for each group }

;-- Variables ---------------------------------------
sescript SEQuestScript
Float percentMaxSpeed = 1.0

;-- Properties --------------------------------------
FormList Property PatrollerShipList Auto Const mandatory
{ Formlists that contain all of the ships that can spawn for this encounter }
ReferenceAlias Property Alias_PatrolMarker03 Auto Const mandatory
{ Path the ships will patrol at }
ReferenceAlias[] Property PatrolShips Auto Const
{ Array of individual ReferenceAliases that each ship will go into }
RefCollectionAlias Property Alias_AttackersRC Auto Const mandatory
{ RefCol for holding the ships once spawned }
Int Property minShips = 2 Auto Const
{ The min and max number of ships that can spawn in the patrol }
Int Property offsetDistance = 300 Auto Const
{ How far apart the ships spawn from each other within the group }

;-- Functions ---------------------------------------

Event OnQuestInit()
  SEQuestScript = (Self as Quest) as sescript ; #DEBUG_LINE_NO:27
  Self.SpawnShips(PatrollerShipList, Alias_AttackersRC, Alias_PatrolMarker03, 0) ; #DEBUG_LINE_NO:28
EndEvent

Function SpawnShips(FormList akCurrentGroup, RefCollectionAlias akRefColToAddTo, ReferenceAlias akSpawnMarker, Int DeadGroup)
  Int I = 0 ; #DEBUG_LINE_NO:34
  Int maxShips = PatrolShips.Length ; #DEBUG_LINE_NO:35
  Int GroupSize = Utility.RandomInt(minShips, maxShips) ; #DEBUG_LINE_NO:36
  Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:38
  While I < GroupSize ; #DEBUG_LINE_NO:40
    ObjectReference ADMarker = akSpawnMarker.GetRef() ; #DEBUG_LINE_NO:41
    offsets[1] = (I * offsetDistance) as Float ; #DEBUG_LINE_NO:42
    spaceshipreference newShip = ADMarker.PlaceShipAtMe(akCurrentGroup.GetAt(Utility.RandomInt(0, akCurrentGroup.GetSize() - 1)), 4, False, False, False, True, offsets, None, None, True) ; #DEBUG_LINE_NO:43
    newShip.SetForwardVelocity(percentMaxSpeed) ; #DEBUG_LINE_NO:44
    akRefColToAddTo.AddRef(newShip as ObjectReference) ; #DEBUG_LINE_NO:45
    PatrolShips[I].ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:46
    I += 1 ; #DEBUG_LINE_NO:47
  EndWhile ; #DEBUG_LINE_NO:
  If SEQuestScript ; #DEBUG_LINE_NO:50
    SEQuestScript.UpdateDeadCountGroupSize(DeadGroup, akRefColToAddTo.GetCount()) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction
