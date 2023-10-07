ScriptName Fragments:Quests:QF_OE_MP_Creatures03_00067FA3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property OE_PlayerInRange_Keyword Auto Const mandatory
ReferenceAlias Property Alias_Nest Auto Const mandatory
ReferenceAlias Property Alias_Ambusher Auto Const mandatory
LeveledItem Property CommonLoot Auto Const mandatory
LeveledItem Property UncommonLoot Auto Const mandatory
LeveledItem Property RareLoot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  Actor Ambusher = Alias_Ambusher.GetActorRef() ; #DEBUG_LINE_NO:7
  Ambusher.Enable(False) ; #DEBUG_LINE_NO:9
  Ambusher.EvaluatePackage(False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(150) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(150) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:34
EndFunction
