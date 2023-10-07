ScriptName Fragments:Quests:QF_FFCydoniaR03_0023E9B7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR03_BookNumber Auto Const mandatory
ReferenceAlias Property Alias_BookAlias Auto Const mandatory
Quest Property FFCydoniaR03Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Alias_BookAlias.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:15
  FFCydoniaR03Misc.SetStage(1000) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(1000) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0301_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:41
  ffcydoniar03questscript kmyQuest = __temp as ffcydoniar03questscript ; #DEBUG_LINE_NO:42
  kmyQuest.RemoveBook() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:53
  ffcydoniar03questscript kmyQuest = __temp as ffcydoniar03questscript ; #DEBUG_LINE_NO:54
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:57
  kmyQuest.BookReward() ; #DEBUG_LINE_NO:60
  FFCydoniaR03_BookNumber.Mod(1.0) ; #DEBUG_LINE_NO:63
  Self.Stop() ; #DEBUG_LINE_NO:64
EndFunction
