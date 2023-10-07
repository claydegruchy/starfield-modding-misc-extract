ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Coffee_001136DB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Potion Property TerraCino Auto Const
GlobalVariable Property QuestTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
GlobalVariable Property QuestCompleted Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(TerraCino as Form, 1, False, None) ; #DEBUG_LINE_NO:15
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:16
  QuestTimer.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:19
  QuestCompleted.Mod(1.0) ; #DEBUG_LINE_NO:20
  Self.Stop() ; #DEBUG_LINE_NO:22
EndFunction
