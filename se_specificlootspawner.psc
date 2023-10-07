ScriptName SE_SpecificLootSpawner Extends Quest
{ Spawns a specific object at a number of generic markers. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Markers Auto Const mandatory
{ Possible locations at which loot items can be placed. }
Form Property LootItem Auto Const mandatory
{ The specific loot item type that will be placed. }
Int Property AmountOfLoot Auto Const mandatory
{ The maximum number of loot items that will be placed, if less than number of references in Alias_Markers. }

;-- Functions ---------------------------------------

Event OnQuestinit()
  Int I = AmountOfLoot ; #DEBUG_LINE_NO:15
  If I > Alias_Markers.GetCount() ; #DEBUG_LINE_NO:18
    I = Alias_Markers.GetCount() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  While I >= 0 ; #DEBUG_LINE_NO:25
    ObjectReference Spawnpoint = Alias_Markers.GetAt(Utility.RandomInt(0, Alias_Markers.GetCount() - 1)) ; #DEBUG_LINE_NO:26
    ObjectReference NewObject = Spawnpoint.PlaceAtMe(LootItem, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:27
    Alias_Markers.RemoveRef(Alias_Markers.GetAt(I)) ; #DEBUG_LINE_NO:29
    I -= 1 ; #DEBUG_LINE_NO:30
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
