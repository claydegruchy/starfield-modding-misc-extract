ScriptName Fragments:Quests:QF_BF06_0001EDE1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BF06Suggest Auto Const mandatory
Message Property BF06_Stage30Temp_Message Auto Const mandatory
Message Property BF06_Stage50Temp_Message Auto Const mandatory
Message Property BF06_Stage160Temp_Message Auto Const mandatory
Message Property BF06_Stage200Temp_Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:34
  BF06_Stage30Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:55
  BF06_Stage50Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:72
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:73
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:82
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:92
  Self.SetStage(150) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:101
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:111
  BF06_Stage160Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:120
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:129
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:130
  BF06_Stage200Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:139
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:148
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:157
  Self.Stop() ; #DEBUG_LINE_NO:158
EndFunction
