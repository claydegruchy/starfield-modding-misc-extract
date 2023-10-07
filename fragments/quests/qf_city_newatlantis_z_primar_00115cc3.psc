ScriptName Fragments:Quests:QF_City_NewAtlantis_Z_Primar_00115CC3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property ReliableCare Auto Const
Quest Property SuspiciousActivities Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:17
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:27
  If Self.GetStageDone(60) == True && Self.GetStageDone(80) == True ; #DEBUG_LINE_NO:29
    Self.SetStage(110) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  SuspiciousActivities.SetStage(0) ; #DEBUG_LINE_NO:41
  Self.SetStage(30) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0045_Item_00()
  SuspiciousActivities.SetStage(1) ; #DEBUG_LINE_NO:51
  Self.SetStage(30) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:61
  If Self.GetStageDone(30) == True && Self.GetStageDone(80) == True ; #DEBUG_LINE_NO:63
    Self.SetStage(110) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0070_Item_00()
  ReliableCare.SetStage(10) ; #DEBUG_LINE_NO:75
  Self.SetStage(60) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0075_Item_00()
  ReliableCare.SetStage(1) ; #DEBUG_LINE_NO:84
  Self.SetStage(60) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:93
  If Self.GetStageDone(30) == True && Self.GetStageDone(60) == True ; #DEBUG_LINE_NO:95
    Self.SetStage(110) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(90) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(80) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:125
  Self.Stop() ; #DEBUG_LINE_NO:126
EndFunction
