ScriptName Fragments:Quests:QF_COM_Companion_SamCoe_0026C5ED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_SamCoe_Q01 Auto Const mandatory
Quest Property COM_Quest_SamCoe_Commitment Auto Const mandatory
Perk Property Crew_Geology Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
Perk Property CREW_Ship_Piloting Auto Const mandatory
Perk Property Crew_RifleCertification Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0105_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0205_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0215_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0305_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0310_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0315_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0320_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0505_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0515_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0605_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_0650_Item_00()
  If Self.IsObjectiveDisplayed(798) == True ; #DEBUG_LINE_NO:151
    Self.SetObjectiveCompleted(798, True) ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
  COM_Quest_SamCoe_Q01.SetStage(100) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0750_Item_00()
  COM_Quest_SamCoe_Q01.SetStage(1600) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0798_Item_00()
  Self.SetObjectiveDisplayed(798, True, False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0799_Item_00()
  Self.SetObjectiveCompleted(798, True) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0801_Item_00()
  Self.SetObjectiveDisplayed(801, True, False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0802_Item_00()
  Self.SetObjectiveCompleted(801, True) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(802, True, False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0820_Item_00()
  Self.SetObjectiveCompleted(802, True) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0825_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:212
  com_companionquestscript kmyQuest = __temp as com_companionquestscript ; #DEBUG_LINE_NO:213
  Self.SetStage(820) ; #DEBUG_LINE_NO:216
  Self.SetObjectiveCompleted(802, True) ; #DEBUG_LINE_NO:219
  kmyQuest.StartCommitmentQuest() ; #DEBUG_LINE_NO:220
EndFunction
