ScriptName Fragments:Quests:QF_City_AkilaLife05_0003DC10 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weapon Property Cutter Auto Const mandatory
Scene Property City_AkilaLife05_100_TateGivesQuest Auto Const mandatory
RefCollectionAlias Property Alias_Rocks Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  city_akilalife05script kmyQuest = __temp as city_akilalife05script ; #DEBUG_LINE_NO:8
  kmyQuest.RegisterRocks() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:19
    Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:40
  Game.GetPlayer().AddItem(Cutter as Form, 1, False) ; #DEBUG_LINE_NO:43
  Alias_Rocks.EnableAll(False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:63
  Self.SetStage(9000) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:73
EndFunction
