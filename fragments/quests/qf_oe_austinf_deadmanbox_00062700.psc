ScriptName Fragments:Quests:QF_OE_AustinF_DeadManBox_00062700 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Corpse Auto Const mandatory
ReferenceAlias Property Alias_StashContainer Auto Const mandatory
ReferenceAlias Property Alias_KeyObject Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ObjectReference RewardKey = Alias_KeyObject.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference CorpseInventory = Alias_Corpse.GetRef() ; #DEBUG_LINE_NO:8
  CorpseInventory.AddItem(RewardKey as Form, 1, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_StashContainer.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:18
  Alias_StashContainer.GetRef().SetLockLevel(75) ; #DEBUG_LINE_NO:19
  Alias_StashContainer.GetRef().MoveTo(Alias_StashContainer.GetRef(), 0.0, 0.0, -0.200000003, True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:29
EndFunction
