ScriptName Fragments:Quests:QF_City_NA_Viewport02_00270719 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ105 Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property CF06 Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property City_ER_Peace Auto Const mandatory
Quest Property City_Neon_Drug03 Auto Const mandatory
Quest Property City_NA_Viewport03 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property City_NA_Viewport01 Auto Const mandatory
GlobalVariable Property City_NA_Viewport02_InvestAmount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ105.SetStage(2000) ; #DEBUG_LINE_NO:10
  City_NA_Viewport01.Stop() ; #DEBUG_LINE_NO:11
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Game.GetPlayer().AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(30) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0022_Item_00()
  If Self.GetStageDone(190) == False ; #DEBUG_LINE_NO:29
    Self.SetObjectiveDisplayed(22, True, False) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0023_Item_00()
  If Self.GetStageDone(190) == False ; #DEBUG_LINE_NO:39
    Self.SetObjectiveDisplayed(23, True, False) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:78
  If City_ER_Peace.GetStageDone(1000) ; #DEBUG_LINE_NO:81
    Self.SetObjectiveDisplayed(130, True, False) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  If City_Neon_Drug03.GetStageDone(9000) ; #DEBUG_LINE_NO:86
    Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:96
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript ; #DEBUG_LINE_NO:97
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:100
  Game.GetPlayer().RemoveItem(Credits as Form, City_NA_Viewport02_InvestAmount.GetValueInt(), False, None) ; #DEBUG_LINE_NO:102
  If Self.IsObjectiveDisplayed(130) == True ; #DEBUG_LINE_NO:104
    Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(140) ; #DEBUG_LINE_NO:107
    Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(200) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0140_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:119
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript ; #DEBUG_LINE_NO:120
  Self.SetObjectiveCompleted(130, True) ; #DEBUG_LINE_NO:123
  If Self.IsObjectiveDisplayed(120) ; #DEBUG_LINE_NO:124
    Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:125
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(140) ; #DEBUG_LINE_NO:127
    Self.SetObjectiveDisplayed(140, False, False) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(190) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:138
  city_na_viewport02questscript kmyQuest = __temp as city_na_viewport02questscript ; #DEBUG_LINE_NO:139
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:142
  If Self.IsObjectiveDisplayed(120) ; #DEBUG_LINE_NO:143
    Self.SetObjectiveDisplayed(120, False, False) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(130) ; #DEBUG_LINE_NO:146
    Self.SetObjectiveDisplayed(130, False, False) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(190) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_NA_Viewport03.Start() ; #DEBUG_LINE_NO:173
  Self.Stop() ; #DEBUG_LINE_NO:174
EndFunction
