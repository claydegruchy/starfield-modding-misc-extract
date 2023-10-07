ScriptName Fragments:Quests:QF_City_GG_Marines_00188D25 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC_GG_Marines_DropoffsCompleted Auto Const mandatory
GlobalVariable Property UC_GG_Marines_TotalDropoffs Auto Const mandatory
GlobalVariable Property UC_GG_Marines_PlayerHeardZinaidaPitch Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker01 Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker02 Auto Const mandatory
ObjectReference Property UC_GG_Marines_DebugMarker03 Auto Const mandatory
ObjectReference Property GG_Marker_OutdoorBar01 Auto Const mandatory
GlobalVariable Property UC_GG_Marines_ViktorBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property UC_GG_Marines_RecruitmentMaterials Auto Const mandatory
GlobalVariable Property UC_GG_Marines_BonusCount Auto Const mandatory
GlobalVariable Property UC_GG_Marines_LizzyBribe Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundCombatMedic Auto Const mandatory
Perk Property TraitUnitedColoniesNative Auto Const mandatory
Quest Property UC_GG_Marines_Misc Auto Const mandatory
Quest Property DialogueGagarin_UC_GG Auto Const mandatory
RefCollectionAlias Property Alias_RecruitmentMaterials Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, UC_GG_Marines_ViktorBribe.GetValueInt(), False) ; #DEBUG_LINE_NO:23
  Game.GetPlayer().Moveto(GG_Marker_OutdoorBar01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(500) ; #DEBUG_LINE_NO:32
  Game.GetPlayer().Moveto(UC_GG_Marines_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:34
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 3, False, None) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0005_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:43
  PlayACT.AddPerk(BackgroundSoldier, False) ; #DEBUG_LINE_NO:44
  PlayACT.AddPerk(BackgroundCombatMedic, False) ; #DEBUG_LINE_NO:45
  PlayACT.AddPerk(TraitUnitedColoniesNative, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC_GG_Marines_Misc.IsRunning() ; #DEBUG_LINE_NO:54
    UC_GG_Marines_Misc.SetStage(1000) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddAliasedItem(UC_GG_Marines_RecruitmentMaterials as Form, Alias_RecruitmentMaterials as Alias, 3, True) ; #DEBUG_LINE_NO:57
  Self.UpdateCurrentInstanceGlobal(UC_GG_Marines_LizzyBribe) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayedAtTop(100) ; #DEBUG_LINE_NO:59
  If UC_GG_Marines_PlayerHeardZinaidaPitch.GetValue() < 1.0 ; #DEBUG_LINE_NO:63
    Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None) ; #DEBUG_LINE_NO:81
  UC_GG_Marines_BonusCount.Mod(1.0) ; #DEBUG_LINE_NO:82
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False) ; #DEBUG_LINE_NO:83
    Self.SetStage(500) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0 ; #DEBUG_LINE_NO:87
    Self.SetStage(499) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  DialogueGagarin_UC_GG.SetStage(1200) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(310) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0300_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None) ; #DEBUG_LINE_NO:109
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False) ; #DEBUG_LINE_NO:110
    Self.SetStage(500) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0310_Item_00()
  UC_GG_Marines_BonusCount.Mod(1.0) ; #DEBUG_LINE_NO:120
  Self.SetStage(300) ; #DEBUG_LINE_NO:121
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0 ; #DEBUG_LINE_NO:123
    Self.SetStage(499) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  DialogueGagarin_UC_GG.SetStage(1210) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Marines_RecruitmentMaterials as Form, 1, False, None) ; #DEBUG_LINE_NO:136
  If Self.ModObjectiveGlobal(1.0, UC_GG_Marines_DropoffsCompleted, 100, UC_GG_Marines_TotalDropoffs.GetValue(), True, True, True, False) ; #DEBUG_LINE_NO:137
    Self.SetStage(500) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0410_Item_00()
  UC_GG_Marines_BonusCount.Mod(1.0) ; #DEBUG_LINE_NO:147
  Self.SetStage(400) ; #DEBUG_LINE_NO:148
  If UC_GG_Marines_BonusCount.GetValue() >= 3.0 ; #DEBUG_LINE_NO:150
    Self.SetStage(499) ; #DEBUG_LINE_NO:151
  EndIf ; #DEBUG_LINE_NO:
  DialogueGagarin_UC_GG.SetStage(1220) ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0415_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, UC_GG_Marines_LizzyBribe.GetValueInt(), False, None) ; #DEBUG_LINE_NO:163
  Self.SetStage(410) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetStage(410) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0499_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:188
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:189
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:197
  Self.Stop() ; #DEBUG_LINE_NO:198
EndFunction
