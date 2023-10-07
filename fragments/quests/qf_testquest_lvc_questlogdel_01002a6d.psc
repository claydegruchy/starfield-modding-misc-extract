ScriptName Fragments:Quests:QF_TestQuest_LVC_QuestLogDel_01002A6D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property AddictionAlcohol Auto Const mandatory
ActorValue Property AddictionDaddyO Auto Const mandatory
LeveledItem Property LL_Loot_Credits_Container_Safe_Rare Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:79
EndFunction
