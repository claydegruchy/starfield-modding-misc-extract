ScriptName Fragments:Quests:QF_OE_AustinF_Prospectors_0004BD87 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const
RefCollectionAlias Property Alias_Predators_FactionA_Herd Auto Const mandatory
Scene Property OE_AustinF_ProspectorScene01 Auto Const
ReferenceAlias Property Alias_NPCDialogue01 Auto Const mandatory
Weapon Property Cutter Auto Const
Faction Property PlayerEnemyFaction Auto Const mandatory
LeveledItem Property LL_Quest_Reward_GrabBag_Small Auto Const mandatory
ReferenceAlias Property Alias_RockpilePackin Auto Const mandatory
ReferenceAlias Property Alias_RewardMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Alias_NPCDialogue01.GetRef().MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:7
  Alias_NPCDialogue01.GetActorRef().EquipItem(Cutter as Form, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_NPCDialogue01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  If !Self.GetStageDone(275) ; #DEBUG_LINE_NO:18
    Self.SetStage(900) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0275_Item_00()
  Alias_NPCDialogue01.GetActorRef().AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:28
  Alias_NPCDialogue01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(800) ; #DEBUG_LINE_NO:45
    Self.SetStage(920) ; #DEBUG_LINE_NO:46
  ElseIf Self.GetStageDone(275) ; #DEBUG_LINE_NO:47
    Self.SetStage(920) ; #DEBUG_LINE_NO:48
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(910) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0920_Item_00()
  Alias_RockpilePackin.GetRef().AddItem(LL_Quest_Reward_GrabBag_Small as Form, 1, False) ; #DEBUG_LINE_NO:59
  Alias_RewardMarker.GetRef().AddItem(LL_Quest_Reward_GrabBag_Small as Form, 1, False) ; #DEBUG_LINE_NO:60
EndFunction
