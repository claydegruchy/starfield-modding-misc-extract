ScriptName SE_RandomLootSpawnerScript Extends Quest
{ Spawns a random number of a particular item based off of a formlist }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Markers Auto Const mandatory
{ Refcollection of the markers that this script can place items at }
RefCollectionAlias Property Alias_SpawnedObjects Auto Const mandatory
{ Refcollection that the containers will go into }
FormList Property Crateslist Auto Const mandatory
{ Formlist of different types of items that can be spawned }
Int Property maxLoot Auto Const mandatory
{ maximum number of items that can be spawned }
Int Property hazardChance Auto Const mandatory
{ percent chance (1-100) that a hazard will appear at the same point as the loot }
Form Property PI_SpaceHazard Auto Const
{ Packin containing the hazard and effect }
Bool Property itemsAreRandom Auto Const mandatory
{ Do you want to spawn all of the same item or not }

;-- Functions ---------------------------------------

Event OnQuestinit()
  Int crateType = Utility.RandomInt(0, Crateslist.GetSize() - 1) ; #DEBUG_LINE_NO:27
  Int numCrates = Utility.RandomInt(1, maxLoot) ; #DEBUG_LINE_NO:28
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < numCrates ; #DEBUG_LINE_NO:31
    ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0, Alias_Markers.GetCount() - 1)) ; #DEBUG_LINE_NO:32
    ObjectReference newCrate = None ; #DEBUG_LINE_NO:34
    If itemsAreRandom == False ; #DEBUG_LINE_NO:36
      newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(crateType), 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:37
    Else ; #DEBUG_LINE_NO:
      newCrate = Spawnpoint.PlaceAtMe(Crateslist.GetAt(Utility.RandomInt(0, Crateslist.GetSize() - 1)), 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
    If Utility.RandomInt(0, 99) < hazardChance ; #DEBUG_LINE_NO:42
      Spawnpoint.PlaceAtMe(PI_SpaceHazard, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:44
    EndIf ; #DEBUG_LINE_NO:
    Alias_Markers.RemoveRef(Spawnpoint) ; #DEBUG_LINE_NO:49
    Alias_SpawnedObjects.addRef(newCrate) ; #DEBUG_LINE_NO:50
    If Alias_Markers.GetCount() == 0 ; #DEBUG_LINE_NO:52
      I = numCrates ; #DEBUG_LINE_NO:53
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:56
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
