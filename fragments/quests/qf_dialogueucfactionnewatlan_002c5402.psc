ScriptName Fragments:Quests:QF_DialogueUCFactionNewAtlan_002C5402 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UC01 Auto Const mandatory
LeveledItem Property LL_Credits_Medium Auto Const mandatory
ReferenceAlias Property Alias_TarmacEnableMarker Auto Const mandatory
GlobalVariable Property UC04_PostAttackDialogueActive Auto Const mandatory
Scene Property DialogueUCNewAtlantisUCFaction_POST_TualaAttract Auto Const mandatory
Message Property UC09_DEBUG_TualasContinuance Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
Quest Property UC09 Auto Const mandatory
GlobalVariable Property UC09_Result Auto Const mandatory
ObjectReference Property UCR01_DebugMarker Auto Const mandatory
Quest Property UC02 Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
ObjectReference Property UCR05_DebugMarker Auto Const mandatory
GlobalVariable Property CreditsRewardFactionQuestLarge Auto Const mandatory
ReferenceAlias Property Alias_TualaLookatMarker Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Perk Property UC_CitizenVendorDiscount_Rank02 Auto Const mandatory
Perk Property UC_CitizenVendorDiscount_Rank01 Auto Const mandatory
Message Property UC09_DEBUG_Zora Auto Const mandatory
ObjectReference Property UC_TualaTravelMaker Auto Const mandatory
ReferenceAlias Property Alias_Tuala Auto Const mandatory
Quest Property UCR01 Auto Const mandatory
Quest Property UCR03 Auto Const mandatory
ReferenceAlias Property Alias_ZoraSangweni Auto Const
ReferenceAlias Property Alias_VVEntrance Auto Const mandatory
ReferenceAlias Property Alias_MuseumPatron_Child Auto Const mandatory
ReferenceAlias Property Alias_MuseumPatron_Dad Auto Const mandatory
ReferenceAlias Property Alias_Pacifist Auto Const mandatory
GlobalVariable Property UC01_MuralsViewedGlobal Auto Const mandatory
RefCollectionAlias Property Alias_SpaceportGuards Auto Const mandatory
ReferenceAlias Property Alias_SS7FloorManager Auto Const mandatory
Quest Property UC09_PostQuest_VaeVictis_Misc Auto Const mandatory
Quest Property UC09_PostQuest_Tuala_Misc Auto Const mandatory
Quest Property UC09_PostQuest_Percival_Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0300_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:7
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:8
  UC02.Stop() ; #DEBUG_LINE_NO:9
  UC09.SetStage(500) ; #DEBUG_LINE_NO:10
  UC09_Result.SetValue(2.0) ; #DEBUG_LINE_NO:11
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:13
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:22
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:23
  UC02.Stop() ; #DEBUG_LINE_NO:24
  UC09.SetStage(500) ; #DEBUG_LINE_NO:25
  UC09_Result.SetValue(1.0) ; #DEBUG_LINE_NO:26
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:28
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:37
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
  UC02.Stop() ; #DEBUG_LINE_NO:39
  UC09.SetStage(500) ; #DEBUG_LINE_NO:40
  UC09_Result.SetValue(1.0) ; #DEBUG_LINE_NO:41
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:42
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:43
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0004_Item_00()
  UC09.Start() ; #DEBUG_LINE_NO:52
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:53
  UC09.SetStage(200) ; #DEBUG_LINE_NO:54
  UC09.SetStage(340) ; #DEBUG_LINE_NO:55
  UC09.SetStage(500) ; #DEBUG_LINE_NO:56
  Game.GetPlayer().MoveTo(UCR05_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:60
  Alias_VVEntrance.GetRef().Unlock(False) ; #DEBUG_LINE_NO:62
  (Alias_SS7FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0005_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:72
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:73
  UC02.Stop() ; #DEBUG_LINE_NO:74
  UC09.SetStage(500) ; #DEBUG_LINE_NO:75
  UC09_Result.SetValue(1.0) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:77
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:78
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:79
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:80
  Self.SetStage(550) ; #DEBUG_LINE_NO:81
  UCR01.Start() ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0006_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:90
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:91
  UC02.Stop() ; #DEBUG_LINE_NO:92
  UC09.SetStage(500) ; #DEBUG_LINE_NO:93
  UC09_Result.SetValue(2.0) ; #DEBUG_LINE_NO:94
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:95
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:96
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:97
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:98
  Self.SetStage(550) ; #DEBUG_LINE_NO:99
  UCR01.Start() ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0007_Item_00()
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:108
  UC02.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:109
  UC02.Stop() ; #DEBUG_LINE_NO:110
  UC09.SetStage(500) ; #DEBUG_LINE_NO:111
  UC09_Result.SetValue(1.0) ; #DEBUG_LINE_NO:112
  Game.GetPlayer().MoveTo(UCR01_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:113
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:114
  Alias_Tuala.GetRef().MoveTo(UC_TualaTravelMaker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:115
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:116
  Self.SetStage(550) ; #DEBUG_LINE_NO:117
  UCR03.Start() ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0010_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0020_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0021_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:142
EndFunction

Function Fragment_Stage_0023_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0024_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0030_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0031_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0032_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0040_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0050_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:198
EndFunction

Function Fragment_Stage_0051_Item_00()
  UC01_MuralsViewedGlobal.Mod(1.0) ; #DEBUG_LINE_NO:206
EndFunction

Function Fragment_Stage_0200_Item_00()
  UC01.Start() ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0400_Item_00()
  Game.GetPlayer().AddItem(LL_Credits_Medium as Form, 1, False) ; #DEBUG_LINE_NO:230
EndFunction

Function Fragment_Stage_0500_Item_00()
  UC09_PostQuest_Tuala_Misc.Start() ; #DEBUG_LINE_NO:238
  If !UC09.GetStageDone(320) ; #DEBUG_LINE_NO:240
    UC09_PostQuest_VaeVictis_Misc.Start() ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0525_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:250
  PlayACT.AddItem(Credits as Form, CreditsRewardFactionQuestLarge.GetValueInt(), False) ; #DEBUG_LINE_NO:252
  PlayACT.RemovePerk(UC_CitizenVendorDiscount_Rank01) ; #DEBUG_LINE_NO:253
  PlayACT.AddPerk(UC_CitizenVendorDiscount_Rank02, False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0550_Item_00()
  UC09_PostQuest_Tuala_Misc.SetStage(1000) ; #DEBUG_LINE_NO:262
  Alias_ZoraSangweni.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0600_Item_00()
  UC09_PostQuest_Percival_Misc.Start() ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0650_Item_00()
  UC09_PostQuest_Percival_Misc.SetStage(1000) ; #DEBUG_LINE_NO:279
EndFunction

Function Fragment_Stage_0990_Item_00()
  Alias_MuseumPatron_Child.GetRef().Disable(False) ; #DEBUG_LINE_NO:288
  Alias_MuseumPatron_Dad.GetRef().Disable(False) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_1000_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:298
  Int iCount = Alias_SpaceportGuards.GetCount() ; #DEBUG_LINE_NO:299
  While I < iCount ; #DEBUG_LINE_NO:301
    Actor currAct = Alias_SpaceportGuards.GetAt(I) as Actor ; #DEBUG_LINE_NO:302
    If currAct.IsDisabled() ; #DEBUG_LINE_NO:304
      currAct.Enable(False) ; #DEBUG_LINE_NO:305
    EndIf ; #DEBUG_LINE_NO:
    If currAct.IsDead() ; #DEBUG_LINE_NO:308
      currAct.Reset(None) ; #DEBUG_LINE_NO:309
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:312
  EndWhile ; #DEBUG_LINE_NO:
  Alias_SpaceportGuards.RemoveAll() ; #DEBUG_LINE_NO:315
EndFunction

Function Fragment_Stage_1020_Item_00()
  UC09_PostQuest_VaeVictis_Misc.SetStage(1000) ; #DEBUG_LINE_NO:323
EndFunction

Function Fragment_Stage_1100_Item_00()
  Alias_Pacifist.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:332
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetStage(1100) ; #DEBUG_LINE_NO:340
EndFunction
