ScriptName SQ_OutpostAttackCreaturesScript Extends SQ_OutpostAttackScript

;-- Structs -----------------------------------------
Struct AttackCreatureData
  RefCollectionAlias collectionAlias
  Int minSpawnCount = 0
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AttackCreaturesGroup
  sq_outpostattackcreaturesscript:attackcreaturedata[] Property Creatures Auto Const mandatory
  { array of spawned creatures of various types (Biome_PredatorSolitary, Biome_PredatorHerdSmall, etc.)
        Not all of the ref collections will necessarily have anything in them, depending on the types of creatures that exist on this planet }
EndGroup


;-- Functions ---------------------------------------

Function HandleQuestStarted()
  Int[] randomArray = new Int[Creatures.Length] ; #DEBUG_LINE_NO:19
  Int I = 0 ; #DEBUG_LINE_NO:20
  While I < randomArray.Length ; #DEBUG_LINE_NO:21
    randomArray[I] = I ; #DEBUG_LINE_NO:22
    I += 1 ; #DEBUG_LINE_NO:23
  EndWhile ; #DEBUG_LINE_NO:
  Bool found = False ; #DEBUG_LINE_NO:26
  While randomArray.Length > 0 && found == False ; #DEBUG_LINE_NO:27
    Int randomArrayIndex = Utility.RandomInt(0, randomArray.Length - 1) ; #DEBUG_LINE_NO:28
    Int creaturesIndex = randomArray[randomArrayIndex] ; #DEBUG_LINE_NO:29
    sq_outpostattackcreaturesscript:attackcreaturedata theCreatureData = Creatures[creaturesIndex] ; #DEBUG_LINE_NO:30
    If theCreatureData.collectionAlias.GetCount() > 0 ; #DEBUG_LINE_NO:32
      found = True ; #DEBUG_LINE_NO:34
      Int spawnCount = Utility.RandomInt(theCreatureData.minSpawnCount, theCreatureData.collectionAlias.GetCount()) ; #DEBUG_LINE_NO:36
      While theCreatureData.collectionAlias.GetCount() > spawnCount && theCreatureData.collectionAlias.GetCount() > 0 ; #DEBUG_LINE_NO:39
        theCreatureData.collectionAlias.RemoveRef(theCreatureData.collectionAlias.GetAt(0)) ; #DEBUG_LINE_NO:40
      EndWhile ; #DEBUG_LINE_NO:
      Attackers.AddRefCollection(theCreatureData.collectionAlias) ; #DEBUG_LINE_NO:42
    Else ; #DEBUG_LINE_NO:
      randomArray.remove(randomArrayIndex, 1) ; #DEBUG_LINE_NO:44
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
  If found ; #DEBUG_LINE_NO:48
    Attackers.EnableAll(False) ; #DEBUG_LINE_NO:49
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction
