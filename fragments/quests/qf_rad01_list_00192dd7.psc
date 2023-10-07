ScriptName Fragments:Quests:QF_Rad01_LIST_00192DD7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Papers Auto Const mandatory
GlobalVariable Property Rad01_RecruitTutorialComplete Auto Const mandatory
Book Property Rad01_Book Auto Const mandatory
Book Property Rad01_Book01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0900_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Papers.TryToEnable() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().additem(Rad01_Book as Form, 1, False) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().additem(Rad01_Book01 as Form, 1, False) ; #DEBUG_LINE_NO:16
  Self.SetStage(100) ; #DEBUG_LINE_NO:17
  Self.SetStage(200) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0199_Item_00()
  If Self.IsObjectiveDisplayed(190) == False ; #DEBUG_LINE_NO:43
    Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:44
    Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(190) == True ; #DEBUG_LINE_NO:48
    Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(100) == False ; #DEBUG_LINE_NO:52
    Self.SetObjectiveSkipped(100) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(299) || Self.GetStageDone(500) ; #DEBUG_LINE_NO:56
    Self.SetStage(900) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0299_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:83
  Rad01_RecruitTutorialComplete.SetValue(1.0) ; #DEBUG_LINE_NO:84
  If Self.GetStageDone(199) ; #DEBUG_LINE_NO:85
    Self.SetStage(900) ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveFailed(250, True) ; #DEBUG_LINE_NO:95
  Rad01_RecruitTutorialComplete.SetValue(1.0) ; #DEBUG_LINE_NO:96
  If Self.GetStageDone(199) ; #DEBUG_LINE_NO:97
    Self.SetStage(900) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction
