ScriptName Fragments:Quests:QF_COM_Quest_Barrett_Q01_Con_000369AA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Large Auto Const mandatory
ReferenceAlias Property Alias_Wendy Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Wendy_GagarinOffice Auto Const mandatory
Book Property Wendy_DataSlate Auto Const mandatory
Perk Property Perk01 Auto Const mandatory
Perk Property Perk02 Auto Const mandatory
Perk Property Perk00 Auto Const mandatory
Perk Property Perk03 Auto Const mandatory
Perk Property Perk04 Auto Const mandatory
Perk Property Perk05 Auto Const mandatory
Perk Property Perk06 Auto Const mandatory
Perk Property Perk07 Auto Const mandatory
ReferenceAlias Property Alias_XMarker_Wendy_NewAtlantis Auto Const mandatory
GlobalVariable Property NPCDemandMoney_Small Auto Const mandatory
Potion Property MedPack Auto Const mandatory
Perk Property Perk08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:7
  Self.SetStage(2) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:16
  Player.AddPerk(Perk00, False) ; #DEBUG_LINE_NO:18
  Player.AddPerk(Perk01, False) ; #DEBUG_LINE_NO:19
  Player.AddPerk(Perk02, False) ; #DEBUG_LINE_NO:20
  Player.AddPerk(Perk03, False) ; #DEBUG_LINE_NO:21
  Player.AddPerk(Perk04, False) ; #DEBUG_LINE_NO:22
  Player.AddPerk(Perk05, False) ; #DEBUG_LINE_NO:23
  Player.AddPerk(Perk06, False) ; #DEBUG_LINE_NO:24
  Player.AddPerk(Perk07, False) ; #DEBUG_LINE_NO:25
  Player.AddPerk(Perk08, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False) ; #DEBUG_LINE_NO:34
  Game.GetPlayer().AddItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False) ; #DEBUG_LINE_NO:35
  Game.GetPlayer().AddItem(MedPack as Form, 1, False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveDisplayed(125, True, False) ; #DEBUG_LINE_NO:44
  Game.GetPlayer().AddItem(Wendy_DataSlate as Form, 1, False) ; #DEBUG_LINE_NO:46
  Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_NewAtlantis.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0131_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Large.GetValueInt(), False, None) ; #DEBUG_LINE_NO:56
  Self.SetStage(142) ; #DEBUG_LINE_NO:58
  Self.SetStage(130) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0132_Item_00()
  Self.SetStage(142) ; #DEBUG_LINE_NO:67
  Self.SetStage(130) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0133_Item_00()
  Self.SetStage(130) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0134_Item_00()
  Self.SetStage(133) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetStage(142) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0136_Item_00()
  Self.SetStage(141) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0137_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:108
  If Player.GetItemCount(Wendy_DataSlate as Form) >= 1 ; #DEBUG_LINE_NO:110
    Player.RemoveItem(Wendy_DataSlate as Form, 1, False, None) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:120
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:121
  Self.SetStage(130) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0141_Item_00()
  Self.SetStage(140) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0142_Item_00()
  Self.SetStage(140) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0145_Item_00()
  If Self.GetStageDone(141) && Self.GetStageDone(138) ; #DEBUG_LINE_NO:148
    Self.SetStage(148) ; #DEBUG_LINE_NO:149
  ElseIf Self.GetStageDone(141) && !Self.GetStageDone(138) ; #DEBUG_LINE_NO:150
    Self.SetStage(146) ; #DEBUG_LINE_NO:151
  ElseIf Self.GetStageDone(142) && Self.GetStageDone(138) ; #DEBUG_LINE_NO:152
    Self.SetStage(149) ; #DEBUG_LINE_NO:153
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(147) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(150) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0146_Item_00()
  Self.SetStage(145) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0147_Item_00()
  Self.SetStage(145) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(125, True) ; #DEBUG_LINE_NO:182
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:183
  Self.SetStage(144) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0160_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, NPCDemandMoney_Small.GetValueInt(), False, None) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0170_Item_00()
  If Self.GetStageDone(140) ; #DEBUG_LINE_NO:200
    Self.SetStage(175) ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0175_Item_00()
  Alias_Wendy.GetRef().MoveTo(Alias_XMarker_Wendy_GagarinOffice.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:210
  (Alias_Wendy.GetRef() as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:211
EndFunction
