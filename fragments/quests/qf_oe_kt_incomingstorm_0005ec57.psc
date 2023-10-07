ScriptName Fragments:Quests:QF_OE_KT_IncomingStorm_0005EC57 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_KT_IncomingStorm_Scene00 Auto Const mandatory
Weather Property StormWeather Auto Const mandatory
Weather Property Sandstorm Auto Const mandatory
Weather Property Snowstorm Auto Const mandatory
Scene Property OE_KT_IncomingStorm_Start Auto Const mandatory
ReferenceAlias Property Alias_Generator Auto Const mandatory
Explosion Property ElectricalExplosionSmall Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const mandatory
wwiseevent Property Wwise_SuccessSound Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
Scene Property OE_KT_IncomingStorm_ExplosionStart Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
movablestatic Property BlowingFX_SmokeBillowing_lg Auto Const mandatory
Float Property Timer Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const mandatory
ReferenceAlias Property Alias_Terminal01 Auto Const mandatory
Scene Property OE_KT_IncomingStorm_Geologist_Greet Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:8
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0) ; #DEBUG_LINE_NO:11
  OE_KT_IncomingStormGenA_Global.SetValue(80.0) ; #DEBUG_LINE_NO:12
  OE_KT_IncomingStormGenB_Global.SetValue(50.0) ; #DEBUG_LINE_NO:13
  OE_KT_IncomingStormGenC_Global.SetValue(50.0) ; #DEBUG_LINE_NO:14
  kmyQuest.PuzzleStart() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0002_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:24
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:25
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0) ; #DEBUG_LINE_NO:28
  OE_KT_IncomingStormGenA_Global.SetValue(30.0) ; #DEBUG_LINE_NO:29
  OE_KT_IncomingStormGenB_Global.SetValue(100.0) ; #DEBUG_LINE_NO:30
  OE_KT_IncomingStormGenC_Global.SetValue(50.0) ; #DEBUG_LINE_NO:31
  kmyQuest.PuzzleStart() ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0003_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:41
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:42
  OE_KT_IncomingStormTotalMoves_Global.SetValue(3.0) ; #DEBUG_LINE_NO:45
  OE_KT_IncomingStormGenA_Global.SetValue(100.0) ; #DEBUG_LINE_NO:46
  OE_KT_IncomingStormGenB_Global.SetValue(50.0) ; #DEBUG_LINE_NO:47
  OE_KT_IncomingStormGenC_Global.SetValue(30.0) ; #DEBUG_LINE_NO:48
  kmyQuest.PuzzleStart() ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:58
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:59
  OE_KT_IncomingStormTotalMoves_Global.SetValue(4.0) ; #DEBUG_LINE_NO:63
  OE_KT_IncomingStormGenA_Global.SetValue(50.0) ; #DEBUG_LINE_NO:64
  OE_KT_IncomingStormGenB_Global.SetValue(90.0) ; #DEBUG_LINE_NO:65
  OE_KT_IncomingStormGenC_Global.SetValue(40.0) ; #DEBUG_LINE_NO:66
  kmyQuest.PuzzleStart() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveFailed(20, True) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveFailed(30, True) ; #DEBUG_LINE_NO:78
  Self.SetObjectiveFailed(100, True) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0010_Item_00()
  OE_KT_IncomingStorm_Scene00.Start() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0011_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:95
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:96
  OE_KT_IncomingStormGenA_Global.Mod(-30.0) ; #DEBUG_LINE_NO:99
  OE_KT_IncomingStormGenB_Global.Mod(30.0) ; #DEBUG_LINE_NO:100
  kmyQuest.CheckPuzzle() ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0012_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:110
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:111
  OE_KT_IncomingStormGenA_Global.Mod(-10.0) ; #DEBUG_LINE_NO:114
  OE_KT_IncomingStormGenC_Global.Mod(10.0) ; #DEBUG_LINE_NO:115
  kmyQuest.CheckPuzzle() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0013_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:125
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:126
  OE_KT_IncomingStormGenB_Global.Mod(-20.0) ; #DEBUG_LINE_NO:129
  OE_KT_IncomingStormGenA_Global.Mod(20.0) ; #DEBUG_LINE_NO:130
  kmyQuest.CheckPuzzle() ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0014_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:140
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:141
  OE_KT_IncomingStormGenB_Global.Mod(-20.0) ; #DEBUG_LINE_NO:144
  OE_KT_IncomingStormGenC_Global.Mod(20.0) ; #DEBUG_LINE_NO:145
  kmyQuest.CheckPuzzle() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:155
  oe_kt_incomingstormterminalscript kmyQuest = __temp as oe_kt_incomingstormterminalscript ; #DEBUG_LINE_NO:156
  OE_KT_IncomingStormGenA_Global.Mod(10.0) ; #DEBUG_LINE_NO:159
  OE_KT_IncomingStormGenC_Global.Mod(-10.0) ; #DEBUG_LINE_NO:160
  kmyQuest.CheckPuzzle() ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:170
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:178
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:179
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0100_Item_00()
  StormWeather.SetActive(False, False) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0100_Item_01()
  Sandstorm.SetActive(False, False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0100_Item_02()
  Snowstorm.SetActive(False, False) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0100_Item_03()
  Alias_Terminal.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:212
  Alias_Terminal01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:213
  OE_KT_IncomingStorm_Start.Start() ; #DEBUG_LINE_NO:214
  Int random = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:218
  If random > 75 ; #DEBUG_LINE_NO:220
    Self.SetStage(1) ; #DEBUG_LINE_NO:221
  ElseIf random > 50 ; #DEBUG_LINE_NO:222
    Self.SetStage(2) ; #DEBUG_LINE_NO:223
  ElseIf random > 25 ; #DEBUG_LINE_NO:224
    Self.SetStage(3) ; #DEBUG_LINE_NO:225
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(4) ; #DEBUG_LINE_NO:227
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0175_Item_00()
  Int instance1 = Wwise_Event_OBJ_Alarm_Generic_Play.Play(Alias_Terminal.GetRef(), None, None) ; #DEBUG_LINE_NO:236
  Utility.Wait(Timer) ; #DEBUG_LINE_NO:238
  wwiseevent.StopInstance(instance1) ; #DEBUG_LINE_NO:239
  Self.SetStage(180) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_NPC03.GetRef().PlaceAtMe(ElectricalExplosionSmall as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:248
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:249
  Alias_NPC03.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveFailed(30, True) ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_0200_Item_00()
  Wwise_SuccessSound.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:259
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:260
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:261
EndFunction

Function Fragment_Stage_0300_Item_00()
  OE_KT_IncomingStorm_Scene00.Stop() ; #DEBUG_LINE_NO:269
  OE_KT_IncomingStorm_ExplosionStart.Start() ; #DEBUG_LINE_NO:270
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:278
EndFunction

Function Fragment_Stage_1000_Item_00()
  Weather.ReleaseOverride() ; #DEBUG_LINE_NO:286
  Self.Stop() ; #DEBUG_LINE_NO:287
EndFunction
