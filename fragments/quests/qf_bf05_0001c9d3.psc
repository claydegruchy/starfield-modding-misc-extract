ScriptName Fragments:Quests:QF_BF05_0001C9D3 Extends Quest Const hidden

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
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:44
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:45
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:54
  If Self.IsObjectiveDisplayed(40) == True ; #DEBUG_LINE_NO:55
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:58
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveDisplayed(65, True, False) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:86
  If Self.IsObjectiveDisplayed(50) == True ; #DEBUG_LINE_NO:87
    Self.SetObjectiveDisplayed(50, False, False) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) == True ; #DEBUG_LINE_NO:90
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(80) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:101
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:137
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:146
  Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:155
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:164
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:165
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:166
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:175
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:191
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:200
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:201
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(190, True) ; #DEBUG_LINE_NO:209
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:210
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:218
  Self.SetObjectiveDisplayed(210, True, False) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.SetObjectiveCompleted(210, True) ; #DEBUG_LINE_NO:227
  Self.SetObjectiveDisplayed(220, True, False) ; #DEBUG_LINE_NO:228
  Self.Stop() ; #DEBUG_LINE_NO:229
EndFunction
