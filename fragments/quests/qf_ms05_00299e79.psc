ScriptName Fragments:Quests:QF_MS05_00299E79 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MS05_RDIntroScene Auto Const
Message Property MS05_Stage300Temp_Message Auto Const
Message Property PMS05_Stage500Temp_Message Auto Const mandatory
Message Property MS05_Stage500Temp_Message Auto Const
ObjectReference Property DebugStaryardMarker Auto Const
GlobalVariable Property MS05Interpersonal Auto Const mandatory
GlobalVariable Property MS05Market Auto Const mandatory
GlobalVariable Property MS05Budget Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property MS05BudgetPlayerPay Auto Const mandatory
GlobalVariable Property MS05ShipDesign Auto Const mandatory
ActorValue Property MS05_Foreknowledge_JulesConvinceAV Auto Const mandatory
ActorValue Property MS05_Foreknowledge_FrankConvinceAV Auto Const mandatory
Quest Property MS05Reward Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_ZW16a_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_ZW16b_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().moveto(DebugStaryardMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, MS05BudgetPlayerPay.GetValue() as Int, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0110_Item_00()
  MS05_RDIntroScene.Start() ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:39
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0210_Item_00()
  MS05Budget.SetValue(-1.0) ; #DEBUG_LINE_NO:57
  Game.GetPlayer().SetValue(MS05_Foreknowledge_JulesConvinceAV, 1.0) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0220_Item_00()
  MS05Budget.SetValue(1.0) ; #DEBUG_LINE_NO:66
  Game.GetPlayer().SetValue(MS05_Foreknowledge_FrankConvinceAV, 1.0) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0260_Item_00()
  MS05Budget.SetValue(-1.0) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(270, False, False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0270_Item_00()
  Self.SetObjectiveDisplayed(270, True, False) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0280_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, MS05BudgetPlayerPay.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:102
  MS05Budget.SetValue(-1.0) ; #DEBUG_LINE_NO:103
  Self.SetObjectiveDisplayed(250, False, False) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveCompleted(270, True) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:114
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0310_Item_00()
  If Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(340) && Self.GetStageDone(350) ; #DEBUG_LINE_NO:123
    Self.SetStage(360) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0320_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(330) && Self.GetStageDone(340) && Self.GetStageDone(350) ; #DEBUG_LINE_NO:133
    Self.SetStage(360) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0330_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(340) && Self.GetStageDone(350) ; #DEBUG_LINE_NO:143
    Self.SetStage(360) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0340_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(350) ; #DEBUG_LINE_NO:153
    Self.SetStage(360) ; #DEBUG_LINE_NO:154
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(310) && Self.GetStageDone(320) && Self.GetStageDone(330) && Self.GetStageDone(340) ; #DEBUG_LINE_NO:163
    Self.SetStage(360) ; #DEBUG_LINE_NO:164
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:181
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:190
  ms05questscript kmyQuest = __temp as ms05questscript ; #DEBUG_LINE_NO:191
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:194
  Self.SetObjectiveDisplayed(510, True, False) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(520, True, False) ; #DEBUG_LINE_NO:196
  kmyQuest.StartMissions() ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0510_Item_00()
  If Self.IsObjectiveDisplayed(510) && !Self.IsObjectiveCompleted(510) ; #DEBUG_LINE_NO:207
    Self.SetObjectiveCompleted(510, True) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(511) && !Self.IsObjectiveCompleted(511) ; #DEBUG_LINE_NO:210
    Self.SetObjectiveCompleted(511, True) ; #DEBUG_LINE_NO:211
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(520) && !Self.GetStageDone(520) ; #DEBUG_LINE_NO:214
    Self.SetObjectiveDisplayed(520, False, False) ; #DEBUG_LINE_NO:215
    Self.SetObjectiveDisplayed(521, True, False) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(520) ; #DEBUG_LINE_NO:219
    Self.SetStage(550) ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0520_Item_00()
  If Self.IsObjectiveDisplayed(520) && !Self.IsObjectiveCompleted(520) ; #DEBUG_LINE_NO:231
    Self.SetObjectiveCompleted(520, True) ; #DEBUG_LINE_NO:232
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(521) && !Self.IsObjectiveCompleted(521) ; #DEBUG_LINE_NO:234
    Self.SetObjectiveCompleted(521, True) ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(510) && !Self.GetStageDone(510) ; #DEBUG_LINE_NO:238
    Self.SetObjectiveDisplayed(510, False, False) ; #DEBUG_LINE_NO:239
    Self.SetObjectiveDisplayed(511, True, False) ; #DEBUG_LINE_NO:240
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(510) ; #DEBUG_LINE_NO:243
    Self.SetStage(550) ; #DEBUG_LINE_NO:244
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(600) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0550_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:255
  ms05questscript kmyQuest = __temp as ms05questscript ; #DEBUG_LINE_NO:256
  kmyQuest.MissionsCompleted() ; #DEBUG_LINE_NO:260
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:268
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0601_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:277
  ms05questscript kmyQuest = __temp as ms05questscript ; #DEBUG_LINE_NO:278
  kmyQuest.MissionsCompleted() ; #DEBUG_LINE_NO:282
  If Self.GetStageDone(550) ; #DEBUG_LINE_NO:286
    MS05Market.SetValue(-1.0) ; #DEBUG_LINE_NO:287
  Else ; #DEBUG_LINE_NO:
    MS05Market.SetValue(1.0) ; #DEBUG_LINE_NO:289
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(511) && !Self.IsObjectiveCompleted(511) ; #DEBUG_LINE_NO:293
    Self.SetObjectiveFailed(511, True) ; #DEBUG_LINE_NO:294
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(521) && !Self.IsObjectiveCompleted(521) ; #DEBUG_LINE_NO:296
    Self.SetObjectiveFailed(521, True) ; #DEBUG_LINE_NO:297
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0610_Item_00()
  MS05Interpersonal.SetValue(1.0) ; #DEBUG_LINE_NO:306
EndFunction

Function Fragment_Stage_0620_Item_00()
  MS05Interpersonal.SetValue(-1.0) ; #DEBUG_LINE_NO:314
EndFunction

Function Fragment_Stage_0700_Item_00()
  Float fShipDesignTotal = MS05Budget.GetValue() + MS05Market.GetValue() + MS05Interpersonal.GetValue() ; #DEBUG_LINE_NO:326
  MS05ShipDesign.SetValue(fShipDesignTotal) ; #DEBUG_LINE_NO:327
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:329
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:330
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:331
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.IsObjectiveCompleted(300) ; #DEBUG_LINE_NO:339
    Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:340
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:343
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:344
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:352
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:355
  SE_Player_ZW16a_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:356
  SE_Player_ZW16b_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:357
  Self.Stop() ; #DEBUG_LINE_NO:359
EndFunction

Function Fragment_Stage_2000_Item_00()
  MS05Reward.Start() ; #DEBUG_LINE_NO:367
EndFunction
