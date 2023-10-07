ScriptName Fragments:Quests:QF_LC115_0022F263 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ArmoryDoor Auto Const mandatory
Faction Property LC115SeokguhCrimeFaction Auto Const
Faction Property LC115SeokguhNeutralFaction Auto Const
Faction Property LC115SeokguhTrespassFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
RefCollectionAlias Property Alias_SeokguhActorsTrespassAll Auto Const mandatory
RefCollectionAlias Property Alias_SeokguhActorsTrespass3rdFloor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Alias_SeokguhActorsTrespass3rdFloor.AddRefCollection(Alias_SeokguhActorsTrespassAll) ; #DEBUG_LINE_NO:7
  Alias_SeokguhActorsTrespassAll.RemoveAll() ; #DEBUG_LINE_NO:8
  Alias_SeokguhActorsTrespass3rdFloor.EvaluateAll() ; #DEBUG_LINE_NO:9
  Alias_ArmoryDoor.getref().unlock(False) ; #DEBUG_LINE_NO:10
  Alias_ArmoryDoor.getref().setopen(True) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:20
EndFunction
