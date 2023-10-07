ScriptName TestKurtCreatureBehaviorScript Extends Quest
{ used to create creatures for testing CCT behaviors }

;-- Structs -----------------------------------------
Struct CreatureData
  RefCollectionAlias collectionAlias
  ActorBase creature
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
testkurtcreaturebehaviorscript:creaturedata[] Property CreatureArray Auto Const
{ index should match message box index }
RefCollectionAlias Property Creatures Auto Const mandatory
{ holds all created creatures }
ReferenceAlias Property SpawnMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function CreateCreature(Int creatureIndex)
  testkurtcreaturebehaviorscript:creaturedata theData = CreatureArray[creatureIndex] ; #DEBUG_LINE_NO:23
  If theData ; #DEBUG_LINE_NO:24
    Actor theCreature = SpawnMarker.GetRef().PlaceActorAtMe(theData.creature, 4, None, False, False, True, None, True) ; #DEBUG_LINE_NO:25
    theData.collectionAlias.AddRef(theCreature as ObjectReference) ; #DEBUG_LINE_NO:26
    Creatures.AddRef(theCreature as ObjectReference) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetCreatures()
  Int I = 0 ; #DEBUG_LINE_NO:34
  While I < CreatureArray.Length ; #DEBUG_LINE_NO:35
    CreatureArray[I].collectionAlias.RemoveAll() ; #DEBUG_LINE_NO:36
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
  Creatures.DisableAll(False) ; #DEBUG_LINE_NO:40
  Creatures.RemoveAll() ; #DEBUG_LINE_NO:41
EndFunction
