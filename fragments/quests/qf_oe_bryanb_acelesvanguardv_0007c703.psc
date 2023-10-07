ScriptName Fragments:Quests:QF_OE_BryanB_AcelesVanguardV_0007C703 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Predator_Spawn Auto Const mandatory
RefCollectionAlias Property Alias_PredatorGroup_Spawn Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
RefCollectionAlias Property Alias_HomesteaderSurvivors Auto Const mandatory
ReferenceAlias Property Alias_Container_Reward Auto Const mandatory
ReferenceAlias Property Alias_Marker_Center Auto Const mandatory
ReferenceAlias Property Alias_Homesteader_Leader Auto Const mandatory
ReferenceAlias Property Alias_Object_Key Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Keyword Property OE_PackageCheck_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Alias_Object_Key.GetRef() ; #DEBUG_LINE_NO:15
    Self.SetStage(125) ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    Alias_Container_Reward.GetRef().SetLockLevel(50) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_Homesteader_Leader.GetRef().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(125) ; #DEBUG_LINE_NO:35
    Game.GetPlayer().AddItem(Alias_Object_Key.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:36
  Else ; #DEBUG_LINE_NO:
    Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  Alias_Container_Reward.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_5000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:57
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:58
EndFunction
