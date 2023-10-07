ScriptName Fragments:Quests:QF_FFNewHomesteadZ01_0021710B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNewHomesteadZ01_TourTip Auto Const mandatory
Quest Property FFNewHomesteadZ01Misc Auto Const mandatory
ReferenceAlias Property Alias_Bill Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour01 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour02 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour03 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour04 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour05 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour06 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour07 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour08 Auto Const mandatory
Scene Property FFNewHomesteadZ01_Bill_Tour09 Auto Const mandatory
ActorValue Property FFNewHomesteadZ01_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFNewHomesteadZ01Misc.SetStage(1000) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Bill.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:34
  FFNewHomesteadZ01_Bill_Tour02.Start() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:53
  FFNewHomesteadZ01_Bill_Tour03.Start() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:72
  FFNewHomesteadZ01_Bill_Tour04.Start() ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:90
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:91
  FFNewHomesteadZ01_Bill_Tour05.Start() ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:100
  Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:109
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:110
  FFNewHomesteadZ01_Bill_Tour06.Start() ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:129
  FFNewHomesteadZ01_Bill_Tour07.Start() ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:138
  Self.SetObjectiveDisplayed(750, True, False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveCompleted(750, True) ; #DEBUG_LINE_NO:147
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:148
  FFNewHomesteadZ01_Bill_Tour08.Start() ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(800, True) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(850, True, False) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(850, True) ; #DEBUG_LINE_NO:166
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:167
  FFNewHomesteadZ01_Bill_Tour09.Start() ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:176
  Self.SetObjectiveDisplayed(950, True, False) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0999_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNewHomesteadZ01_TourTip.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:185
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().SetValue(FFNewHomesteadZ01_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:193
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:194
  Self.Stop() ; #DEBUG_LINE_NO:195
EndFunction
