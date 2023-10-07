ScriptName Fragments:Quests:QF_DialogueCydonia_0024AFED Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CY_Anna_CreditsAmount Auto Const mandatory
LeveledItem Property LL_CY_HorusGift Auto Const mandatory
Scene Property DialogueCydonia_EstablishingScene01 Auto Const mandatory
Quest Property FFCydoniaZ04 Auto Const mandatory
ReferenceAlias Property ReneeShelby Auto Const mandatory
ReferenceAlias Property MitchBenjamin Auto Const mandatory
Quest Property City_CY_RedTape01 Auto Const mandatory
ReferenceAlias Property TrevorPetyarre Auto Const mandatory
Book Property City_CY_RedTape02_HurstNote Auto Const mandatory
GlobalVariable Property CY_HurstGone Auto Const mandatory
ReferenceAlias Property DenisAverin Auto Const mandatory
Quest Property FFCydoniaZ01 Auto Const mandatory
ReferenceAlias Property RivkahOvadia Auto Const mandatory
Quest Property City_CY_Runaway01 Auto Const mandatory
ReferenceAlias Property Alias_GillySeong Auto Const mandatory
Quest Property City_CY_Psych01 Auto Const mandatory
ReferenceAlias Property Alias_JaneWeller Auto Const mandatory
Quest Property City_CY_StartUp01 Auto Const mandatory
GlobalVariable Property DialogueCydonia_RedEyes Auto Const mandatory
ReferenceAlias Property Alias_SupervisorIntroMarker Auto Const mandatory
GlobalVariable Property CY_Hurst_Donation Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
Quest Property City_CY_Psych01Misc Auto Const mandatory
ReferenceAlias Property Alias_TrevorMarker Auto Const mandatory
MiscObject Property City_CY_Runaway01_Whiskey Auto Const mandatory
Scene Property DialogueCydonia_Rivkah_Greeting_CityCYRunaway01_Start Auto Const mandatory
Quest Property City_CY_RedTape03 Auto Const mandatory
Quest Property FFCydoniaZ04Misc Auto Const mandatory
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_SaoirseBowden Auto Const mandatory
Scene Property DialogueCydonia_EstablishingScene02 Auto Const mandatory
Quest Property City_CY_RedTape01_Misc Auto Const mandatory
Perk Property TRAIT_Extrovert Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ReferenceAlias Property Alias_TiaWu Auto Const mandatory
Topic Property DialogueCydonia_Psych01_Tia_OverhearTopic Auto Const mandatory
Quest Property City_CY_Runaway01_Misc Auto Const mandatory
ActorValue Property City_CY_Runaway01_Foreknowledge_RivkahSickAV Auto Const mandatory
ActorValue Property FFCydoniaR03_Foreknowledge_BooksAV Auto Const mandatory
Scene Property DialogueCydonia_ErickJane_NoShip Auto Const mandatory
GlobalVariable Property UC_PlayerKnows_RedDevils Auto Const mandatory
ActorValue Property City_CY_Psych01_Foreknowledge_AV Auto Const mandatory
ReferenceAlias Property Alias_LaylahPulaski Auto Const mandatory
Quest Property FFCydoniaZ07 Auto Const mandatory
Quest Property FFCydoniaZ07Misc Auto Const mandatory
Quest Property FFCydoniaZ08Misc Auto Const mandatory
Quest Property FFCydoniaZ08 Auto Const mandatory
Quest Property RAD04 Auto Const mandatory
ReferenceAlias Property Alias_TrackerAgent Auto Const mandatory
RefCollectionAlias Property Alias_OldMiningEquipment Auto Const mandatory
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
conditionform Property CY_DetonationCountConditionForm Auto Const mandatory
Quest Property DialogueCydonia_Detonation_Helper Auto Const mandatory
RefCollectionAlias Property Alias_AllMiners Auto Const mandatory
Topic Property DialogueCydonia_Trevor_City_CY_Runaway01_Topic Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  ObjectReference myTrevor = TrevorPetyarre.GetRef() ; #DEBUG_LINE_NO:10
  ObjectReference myTrevorMarker = Alias_TrevorMarker.GetRef() ; #DEBUG_LINE_NO:11
  Self.SetStage(11) ; #DEBUG_LINE_NO:13
  myPlayer.MoveTo(myTrevorMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
  myPlayer.AddPerk(TRAIT_Extrovert, False) ; #DEBUG_LINE_NO:16
  myPlayer.AddPerk(BackgroundIndustrialist, False) ; #DEBUG_LINE_NO:17
  myTrevor.MoveTo(myTrevorMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(DenisAverin.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(DenisAverin.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0003_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:43
  myPlayer.MoveTo(MitchBenjamin.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
  myPlayer.AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().MoveTo(ReneeShelby.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0005_Item_00()
  City_CY_RedTape03.SetStage(1000) ; #DEBUG_LINE_NO:62
  Game.GetPlayer().MoveTo(RivkahOvadia.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0006_Item_00()
  Game.GetPlayer().MoveTo(Alias_GillySeong.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0007_Item_00()
  Game.GetPlayer().MoveTo(Alias_JaneWeller.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0008_Item_00()
  City_CY_RedTape03.SetStage(1000) ; #DEBUG_LINE_NO:89
  Game.GetPlayer().MoveTo(Alias_LaylahPulaski.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0009_Item_00()
  Game.GetPlayer().MoveTo(Alias_TrackerAgent.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:99
  RAD04.SetStage(1000) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0010_Item_00()
  If !Self.GetStageDone(0) ; #DEBUG_LINE_NO:111
    DialogueCydonia_EstablishingScene01.Start() ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0011_Item_00()
  TrevorPetyarre.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:121
  DialogueCydonia_EstablishingScene02.Start() ; #DEBUG_LINE_NO:122
  City_CY_RedTape01_Misc.Start() ; #DEBUG_LINE_NO:123
  DialogueCydonia_Detonation_Helper.SetStage(50) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0012_Item_00()
  TrevorPetyarre.GetRef().MoveTo(Alias_SupervisorIntroMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0013_Item_00()
  If !City_CY_Runaway01.IsRunning() && !City_CY_Runaway01.IsCompleted() ; #DEBUG_LINE_NO:141
    City_CY_Runaway01_Misc.Start() ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  If CY_DetonationCountConditionForm.IsTrue(None, None) ; #DEBUG_LINE_NO:151
    DialogueCydoniaDetonationQuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:152
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0017_Item_00()
  Game.GetPlayer().MoveTo(Alias_SaoirseBowden.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0050_Item_00()
  DialogueCydonia_RedEyes.SetValue(1.0) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CY_Anna_CreditsAmount.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0212_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CY_Hurst_Donation.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0500_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote as Form, 1, False, None) ; #DEBUG_LINE_NO:195
  City_CY_RedTape02_Blackmail.SetStage(1000) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0801_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0900_Item_00()
  FFCydoniaZ04.Start() ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0902_Item_00()
  If !FFCydoniaZ04.IsRunning() && !FFCydoniaZ04.IsCompleted() ; #DEBUG_LINE_NO:232
    FFCydoniaZ04Misc.Start() ; #DEBUG_LINE_NO:233
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1002_Item_00()
  Game.GetPlayer().SetValue(FFCydoniaR03_Foreknowledge_BooksAV, 1.0) ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_1110_Item_00()
  City_CY_RedTape01_Misc.SetStage(1000) ; #DEBUG_LINE_NO:250
  City_CY_RedTape01.Start() ; #DEBUG_LINE_NO:251
EndFunction

Function Fragment_Stage_1130_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:259
  dialoguecydoniaquestscript kmyQuest = __temp as dialoguecydoniaquestscript ; #DEBUG_LINE_NO:260
  Alias_OldMiningEquipment.DisableAll(False) ; #DEBUG_LINE_NO:263
  kmyQuest.SwapCutters() ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_1150_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:272
EndFunction

Function Fragment_Stage_1200_Item_00()
  FFCydoniaZ01.Start() ; #DEBUG_LINE_NO:280
EndFunction

Function Fragment_Stage_1300_Item_00()
  City_CY_Runaway01_Misc.SetStage(1000) ; #DEBUG_LINE_NO:288
  City_CY_Runaway01.Start() ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_1302_Item_00()
  Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, RivkahOvadia.GetRef()) ; #DEBUG_LINE_NO:297
EndFunction

Function Fragment_Stage_1310_Item_00()
  Game.GetPlayer().SetValue(City_CY_Runaway01_Foreknowledge_RivkahSickAV, 1.0) ; #DEBUG_LINE_NO:305
EndFunction

Function Fragment_Stage_1320_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None) ; #DEBUG_LINE_NO:313
EndFunction

Function Fragment_Stage_1321_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_Runaway01_Whiskey as Form, 1, False, None) ; #DEBUG_LINE_NO:321
EndFunction

Function Fragment_Stage_1400_Item_00()
  City_CY_Psych01.Start() ; #DEBUG_LINE_NO:329
  Game.GetPlayer().SetValue(City_CY_Psych01_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:330
EndFunction

Function Fragment_Stage_1402_Item_00()
  If !City_CY_Psych01Misc.IsRunning() && !City_CY_Psych01.IsRunning() && !City_CY_Psych01Misc.IsCompleted() && !City_CY_Psych01.IsRunning() ; #DEBUG_LINE_NO:338
    City_CY_Psych01Misc.Start() ; #DEBUG_LINE_NO:339
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1500_Item_00()
  City_CY_StartUp01.Start() ; #DEBUG_LINE_NO:348
EndFunction

Function Fragment_Stage_1501_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:356
EndFunction

Function Fragment_Stage_1550_Item_00()
  DialogueCydonia_ErickJane_NoShip.Start() ; #DEBUG_LINE_NO:364
EndFunction

Function Fragment_Stage_1700_Item_00()
  RAD03.Start() ; #DEBUG_LINE_NO:372
EndFunction

Function Fragment_Stage_1800_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:380
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:388
EndFunction

Function Fragment_Stage_2301_Item_00()
  UC_PlayerKnows_RedDevils.SetValue(1.0) ; #DEBUG_LINE_NO:396
EndFunction

Function Fragment_Stage_2400_Item_00()
  FFCydoniaZ07Misc.Start() ; #DEBUG_LINE_NO:404
EndFunction

Function Fragment_Stage_2405_Item_00()
  If !FFCydoniaZ07.IsRunning() && !FFCydoniaZ07.IsCompleted() ; #DEBUG_LINE_NO:412
    FFCydoniaZ07Misc.Start() ; #DEBUG_LINE_NO:413
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2410_Item_00()
  FFCydoniaZ07.Start() ; #DEBUG_LINE_NO:422
EndFunction

Function Fragment_Stage_2500_Item_00()
  If !FFCydoniaZ08.IsRunning() && !FFCydoniaZ08.IsCompleted() ; #DEBUG_LINE_NO:430
    FFCydoniaZ08Misc.Start() ; #DEBUG_LINE_NO:431
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2510_Item_00()
  FFCydoniaZ08.Start() ; #DEBUG_LINE_NO:440
EndFunction

Function Fragment_Stage_2600_Item_00()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:448
  TrevorPetyarre.GetRef().Say(DialogueCydonia_Trevor_City_CY_Runaway01_Topic, None, False, None) ; #DEBUG_LINE_NO:449
EndFunction
