ScriptName Fragments:Quests:QF_City_AkilaLife04_000F24FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_AkilaLife04_400_StonerootInn Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(100) ; #DEBUG_LINE_NO:7
    Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:26
  city_akilalife04_script kmyQuest = __temp as city_akilalife04_script ; #DEBUG_LINE_NO:27
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:30
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:31
  kmyQuest.Wait24() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0350_Item_00()
  City_AkilaLife04_400_StonerootInn.Start() ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(9000) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(9000) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(9000) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:116
EndFunction
