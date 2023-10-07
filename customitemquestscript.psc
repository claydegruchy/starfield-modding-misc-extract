ScriptName CustomItemQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct ItemDatum
  String ID
  { Indentifier - used to help identify items in array. Not otherwise used. }
  Int QuestStage
  { Spawn item at this quest stage }
  LeveledItem LeveledListToSpawnFrom
  { List to spawn from }
  FormList ModsFormlist
  { List of mods to install on item
****IMPORTANT NOTE***
THIS BYPASSES ALL NORMAL ITEM INSTANTIATION RULES }
  ObjectReference ReferenceToSpawnIn
  { Where to spawn item }
  ReferenceAlias AliasToSpawnIn
  { Where to spawn in, overrides ReferenceToSpawnIn }
  Bool PlaceAtMeInstead
  { Place AT instead of IN ReferenceToSpawnIn }
  ReferenceAlias AliasToForceItemInto
  { if set, item will be forced into this alias }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
customitemquestscript:itemdatum[] Property ItemData Auto Const

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  Int foundIndex = ItemData.findstruct("QuestStage", auiStageID, 0) ; #DEBUG_LINE_NO:36
  customitemquestscript:itemdatum FoundDatum = None ; #DEBUG_LINE_NO:37
  If foundIndex >= 0 ; #DEBUG_LINE_NO:39
    FoundDatum = ItemData[foundIndex] ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  If FoundDatum as Bool && auiItemID == 0 ; #DEBUG_LINE_NO:43
    ObjectReference spawnInRef = None ; #DEBUG_LINE_NO:45
    If FoundDatum.AliasToSpawnIn ; #DEBUG_LINE_NO:46
      spawnInRef = FoundDatum.AliasToSpawnIn.GetReference() ; #DEBUG_LINE_NO:47
    ElseIf FoundDatum.ReferenceToSpawnIn ; #DEBUG_LINE_NO:48
      spawnInRef = FoundDatum.ReferenceToSpawnIn ; #DEBUG_LINE_NO:49
    Else ; #DEBUG_LINE_NO:
      spawnInRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
    CustomItemQuestScript.SpawnCustomItem(FoundDatum.LeveledListToSpawnFrom, FoundDatum.ModsFormlist, spawnInRef, FoundDatum.PlaceAtMeInstead, FoundDatum.AliasToForceItemInto) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Form Function SpawnCustomItem(LeveledItem LeveledListToSpawnFrom, FormList ModsFormlist, ObjectReference ReferenceToSpawnIn, Bool PlaceAtMeInstead, ReferenceAlias AliasToForceItemInto) Global
  ObjectReference item = ReferenceToSpawnIn.PlaceAtMe(LeveledListToSpawnFrom as Form, 1, False, True, False, None, None, True) ; #DEBUG_LINE_NO:62
  Int I = 0 ; #DEBUG_LINE_NO:66
  While I < ModsFormlist.GetSize() ; #DEBUG_LINE_NO:67
    objectmod omod = ModsFormlist.GetAt(I) as objectmod ; #DEBUG_LINE_NO:69
    Bool success = item.AttachMod(omod, 0) ; #DEBUG_LINE_NO:70
    If success == False ; #DEBUG_LINE_NO:72
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:78
  EndWhile ; #DEBUG_LINE_NO:
  item.enable(False) ; #DEBUG_LINE_NO:81
  If AliasToForceItemInto ; #DEBUG_LINE_NO:83
    AliasToForceItemInto.ForceRefTo(item) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
  If PlaceAtMeInstead ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    ReferenceToSpawnIn.additem(item as Form, 1, False) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Return item as Form ; #DEBUG_LINE_NO:98
EndFunction
