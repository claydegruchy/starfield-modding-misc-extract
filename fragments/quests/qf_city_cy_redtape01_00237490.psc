ScriptName Fragments:Quests:QF_City_CY_RedTape01_00237490 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueCydonia Auto Const mandatory
Quest Property City_CY_RedTape02 Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory
Key Property City_CY_RedTape01_HRKey Auto Const mandatory
RefCollectionAlias Property Alias_IronDeposits Auto Const mandatory
ActorValue Property City_CY_RedTape01_ForeknowledgeAV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(InorgCommonIron as Form, City_CY_RedTape01Resource01Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  If DialogueCydonia.GetStageDone(1105) ; #DEBUG_LINE_NO:15
    Self.SetStage(200) ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0352_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:54
  myPlayer.AddItem(City_CY_RedTape01_HRKey as Form, 1, False) ; #DEBUG_LINE_NO:55
  myPlayer.SetValue(City_CY_RedTape01_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0410_Item_00()
  If Self.GetStageDone(420) && Self.GetStageDone(430) && Self.GetStageDone(440) ; #DEBUG_LINE_NO:73
    Self.SetStage(500) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(430) && Self.GetStageDone(440) ; #DEBUG_LINE_NO:83
    Self.SetStage(500) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0430_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(420) && Self.GetStageDone(440) ; #DEBUG_LINE_NO:93
    Self.SetStage(500) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0440_Item_00()
  If Self.GetStageDone(410) && Self.GetStageDone(420) && Self.GetStageDone(430) ; #DEBUG_LINE_NO:103
    Self.SetStage(500) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:113
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_10000_Item_00()
  City_CY_RedTape02.Start() ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:130
  Self.Stop() ; #DEBUG_LINE_NO:131
EndFunction
