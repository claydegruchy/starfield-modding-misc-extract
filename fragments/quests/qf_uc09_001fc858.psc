ScriptName Fragments:Quests:QF_UC09_001FC858 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
ObjectReference Property UC09_DebugMarker01 Auto Const mandatory
ObjectReference Property UC09_DebugMarker02 Auto Const mandatory
ObjectReference Property UC09_DebugMarker03 Auto Const mandatory
ObjectReference Property UC09_DebugMarker04 Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
Message Property UC09_DEBUG_ExpansionPoint Auto Const mandatory
Message Property UC09_DEBUG_SpeechChallenge Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
Scene Property UC09_300_CabinetMainScene Auto Const mandatory
Message Property UC09_DEBUG_AdditionalUC05Variations Auto Const mandatory
Message Property UC09_DEBUG_SpeakToTuala Auto Const mandatory
GlobalVariable Property UC_PlayerMentionedVVToHadrian Auto Const mandatory
GlobalVariable Property UC09_HadsMad Auto Const mandatory
GlobalVariable Property UC09_CleanUpLazarusPlant Auto Const mandatory
ReferenceAlias Property Alias_VaeVictis Auto Const mandatory
ReferenceAlias Property Alias_FB441MarineEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_FCObserverEnableMarker Auto Const mandatory
Quest Property UC09_PostQuestline_HadrianScene Auto Const mandatory
GlobalVariable Property UC07_HadrianKnowsVVLives Auto Const mandatory
ReferenceAlias Property Alias_PostVVSceneTrigger Auto Const mandatory
Perk Property BackgroundDiplomat Auto Const mandatory
Perk Property TraitEmpath Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Perk Property BackgroundXenobiologist Auto Const mandatory
GlobalVariable Property UCR05_Bonus Auto Const mandatory
RefCollectionAlias Property Alias_LondinionDoors Auto Const mandatory
ReferenceAlias Property Alias_ContinueAddressTrigger Auto Const mandatory
GlobalVariable Property UC09_TellFreestarAboutLazPlant Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const mandatory
GlobalVariable Property MQ305_UC_AcelesEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_PlagueEnding Auto Const mandatory
GlobalVariable Property UC09_LazarusPlantResult Auto Const mandatory
GlobalVariable Property UC_LoganKnowsPlayerLearnedOfVaeVictis Auto Const mandatory
ActorValue Property UC09_Foreknowledge_VVCommittedTheAttacksAV Auto Const mandatory
ReferenceAlias Property Alias_HadrianShip Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToDisable Auto Const mandatory
ReferenceAlias Property Alias_EmergencyRecording Auto Const mandatory
GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const mandatory
ReferenceAlias Property Alias_ChiefSarkin Auto Const mandatory
ReferenceAlias Property Alias_Abello Auto Const mandatory
ReferenceAlias Property Alias_ChiefYasin Auto Const mandatory
ReferenceAlias Property Alias_ChiefKulkarni Auto Const mandatory
ReferenceAlias Property Alias_AdmiralLogan Auto Const mandatory
ReferenceAlias Property Alias_VVDoor Auto Const mandatory
ReferenceAlias Property Alias_SS7FloorManager Auto Const mandatory
Book Property UC08_VV_AudioLog Auto Const mandatory
Quest Property DialogueUCFactionNewAtlantis Auto Const mandatory
GlobalVariable Property UCR05_Enabled Auto Const mandatory
ReferenceAlias Property Alias_PostQuestSlate Auto Const mandatory
Quest Property UC08_QueenBattle Auto Const mandatory
Quest Property UC08_AnomalyBattle Auto Const mandatory
ReferenceAlias Property Alias_HadriansShip_RHQ Auto Const mandatory
Quest Property UC01 Auto Const mandatory
ReferenceAlias Property Alias_VVCellDoor Auto Const mandatory
ReferenceAlias Property Alias_SS7_CompanionWaitTrigger Auto Const mandatory
Outfit Property Outfit_Clothes_Colonist_CroppedVest_Hadrian Auto Const mandatory
Outfit Property Outfit_Clothes_ScienceLabTec Auto Const mandatory
ActorValue Property ActorShouldShowSpacesuitCosmetic_AV Auto Const mandatory
ActorValue Property ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
Quest Property UC02 Auto Const mandatory
affinityevent Property COM_WantsToTalkEvent_UnitedColonies Auto Const mandatory
Keyword Property SQ_Followers_UseFollowPlayerCustom Auto Const mandatory
ReferenceAlias[] Property Alias_Companions Auto Const mandatory
GlobalVariable Property COM_WantsToTalk_CooldownDays Auto Const mandatory
ActorValue Property COM_WantsToTalk_UnitedColonies_Cooldown Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(UC09_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:17
  Self.SetStage(200) ; #DEBUG_LINE_NO:18
  Game.GetPlayer().MoveTo(UC09_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:30
  Self.SetStage(200) ; #DEBUG_LINE_NO:31
  Self.SetStage(300) ; #DEBUG_LINE_NO:32
  Game.GetPlayer().MoveTo(UC09_DebugMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:44
  Self.SetStage(200) ; #DEBUG_LINE_NO:45
  Self.SetStage(310) ; #DEBUG_LINE_NO:46
  UC09_300_CabinetMainScene.Stop() ; #DEBUG_LINE_NO:47
  UC01.SetStage(100) ; #DEBUG_LINE_NO:48
  UC01.SetStage(1000) ; #DEBUG_LINE_NO:49
  Game.GetPlayer().MoveTo(UC09_DebugMarker04, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:51
  Alias_Hadrian.GetRef().MoveTo(UC09_DebugMarker04, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:52
  UC02.Stop() ; #DEBUG_LINE_NO:53
  Self.SetStage(500) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0019_Item_00()
  Alias_Hadrian.GetRef().Enable(False) ; #DEBUG_LINE_NO:62
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:63
  PlayACT.AddPerk(BackgroundDiplomat, False) ; #DEBUG_LINE_NO:64
  PlayACT.AddPerk(BackgroundIndustrialist, False) ; #DEBUG_LINE_NO:65
  PlayACT.AddPerk(TraitEmpath, False) ; #DEBUG_LINE_NO:66
  PlayACT.AddPerk(BackgroundXenobiologist, False) ; #DEBUG_LINE_NO:67
  Alias_VVDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:70
  (Alias_SS7FloorManager.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:71
  Game.GetPlayer().AddAliasedItem(UC08_VV_AudioLog as Form, Alias_EmergencyRecording as Alias, 1, True) ; #DEBUG_LINE_NO:74
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:85
  Self.SetActive(True) ; #DEBUG_LINE_NO:86
  Alias_NPCsToDisable.DisableAll(False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0105_Item_00()
  UC08_AnomalyBattle.SetStage(1000) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0110_Item_00()
  Int Count = Alias_LondinionDoors.GetCount() ; #DEBUG_LINE_NO:106
  Int I = 0 ; #DEBUG_LINE_NO:107
  While I < Count ; #DEBUG_LINE_NO:109
    ObjectReference currDoor = Alias_LondinionDoors.GetAt(I) ; #DEBUG_LINE_NO:110
    currDoor.SetOpen(False) ; #DEBUG_LINE_NO:111
    currDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:112
    I += 1 ; #DEBUG_LINE_NO:114
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0113_Item_00()
  Self.SetStage(124) ; #DEBUG_LINE_NO:124
EndFunction

Function Fragment_Stage_0119_Item_00()
  UCR05_Bonus.SetValue(1.0) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0124_Item_00()
  Alias_VaeVictis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0125_Item_00()
  Game.GetPlayer().SetValue(UC09_Foreknowledge_VVCommittedTheAttacksAV, 1.0) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0130_Item_00()
  DialogueUCFactionNewAtlantis.SetStage(1011) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:164
  uc09questscript kmyQuest = __temp as uc09questscript ; #DEBUG_LINE_NO:165
  Actor HadACT = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:168
  HadACT.SetOutfit(Outfit_Clothes_Colonist_CroppedVest_Hadrian, True) ; #DEBUG_LINE_NO:169
  HadACT.SetValue(ActorShouldShowSpacesuitCosmetic_AV, 0.0) ; #DEBUG_LINE_NO:170
  HadACT.SetValue(ActorShouldHideSpacesuitHelmetCosmeticBreathable_AV, 0.0) ; #DEBUG_LINE_NO:171
  Alias_Jakob.GetActorRef().SetOutfit(Outfit_Clothes_ScienceLabTec, False) ; #DEBUG_LINE_NO:172
  kmyQuest.GetNPCsInPlace() ; #DEBUG_LINE_NO:173
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:175
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:176
  Alias_HadrianShip.GetRef().Disable(False) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0210_Item_00()
  UC_PlayerMentionedVVToHadrian.SetValue(1.0) ; #DEBUG_LINE_NO:187
  UC07_HadrianKnowsVVLives.SetValue(1.0) ; #DEBUG_LINE_NO:188
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(229) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:205
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:207
  Alias_Jakob.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0310_Item_00()
  UC09_300_CabinetMainScene.Start() ; #DEBUG_LINE_NO:216
  Alias_ContinueAddressTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:219
  Alias_NPCsToDisable.EnableAll(False) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0315_Item_00()
  UC09_HadsMad.SetValue(1.0) ; #DEBUG_LINE_NO:230
EndFunction

Function Fragment_Stage_0320_Item_00()
  UC_LoganKnowsPlayerLearnedOfVaeVictis.SetValue(1.0) ; #DEBUG_LINE_NO:239
EndFunction

Function Fragment_Stage_0325_Item_00()
  Game.GetPlayer().RemoveItem(Alias_EmergencyRecording.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0365_Item_00()
  UC09_LazarusPlantResult.SetValue(1.0) ; #DEBUG_LINE_NO:255
EndFunction

Function Fragment_Stage_0367_Item_00()
  UC09_LazarusPlantResult.SetValue(1.0) ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0369_Item_00()
  UC09_LazarusPlantResult.SetValue(2.0) ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0371_Item_00()
  UC09_LazarusPlantResult.SetValue(2.0) ; #DEBUG_LINE_NO:279
EndFunction

Function Fragment_Stage_0399_Item_00()
  UC09_DEBUG_AdditionalUC05Variations.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:287
EndFunction

Function Fragment_Stage_0499_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:295
  uc09questscript kmyQuest = __temp as uc09questscript ; #DEBUG_LINE_NO:296
  Alias_ContinueAddressTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:300
  kmyQuest.StaggeredEvalPackages() ; #DEBUG_LINE_NO:302
  If Self.GetStageDone(401) ; #DEBUG_LINE_NO:305
    UC09_PlayerChoiceResult.SetValue(2.0) ; #DEBUG_LINE_NO:307
    MQ305_UC_PlagueEnding.SetValue(1.0) ; #DEBUG_LINE_NO:308
  ElseIf Self.GetStageDone(402) ; #DEBUG_LINE_NO:309
    UC09_PlayerChoiceResult.SetValue(3.0) ; #DEBUG_LINE_NO:311
    MQ305_UC_SterilizationEnding.SetValue(1.0) ; #DEBUG_LINE_NO:312
  Else ; #DEBUG_LINE_NO:
    UC09_PlayerChoiceResult.SetValue(1.0) ; #DEBUG_LINE_NO:315
    MQ305_UC_AcelesEnding.SetValue(1.0) ; #DEBUG_LINE_NO:316
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(500) ; #DEBUG_LINE_NO:319
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(320) ; #DEBUG_LINE_NO:329
    Alias_VaeVictis.GetRef().Disable(False) ; #DEBUG_LINE_NO:330
    Alias_PostQuestSlate.GetRef().Enable(False) ; #DEBUG_LINE_NO:331
    Alias_VVCellDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:332
    Alias_SS7_CompanionWaitTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:333
  Else ; #DEBUG_LINE_NO:
    UCR05_Enabled.SetValue(1.0) ; #DEBUG_LINE_NO:335
  EndIf ; #DEBUG_LINE_NO:
  UC09_PostQuestline_HadrianScene.Start() ; #DEBUG_LINE_NO:339
  Alias_FB441MarineEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:342
  DialogueRedDevilsHQ.SetStage(30) ; #DEBUG_LINE_NO:345
  Alias_HadriansShip_RHQ.GetRef().Enable(False) ; #DEBUG_LINE_NO:348
  If Self.GetStageDone(367) || Self.GetStageDone(371) ; #DEBUG_LINE_NO:351
    DialogueRedDevilsHQ.SetStage(32) ; #DEBUG_LINE_NO:352
    Alias_FCObserverEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:353
    UC09_TellFreestarAboutLazPlant.SetValue(1.0) ; #DEBUG_LINE_NO:354
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(369) || Self.GetStageDone(371) ; #DEBUG_LINE_NO:358
    UC09_CleanUpLazarusPlant.SetValue(1.0) ; #DEBUG_LINE_NO:359
  EndIf ; #DEBUG_LINE_NO:
  DialogueUCNewAtlantisUCFaction.SetStage(500) ; #DEBUG_LINE_NO:363
  Game.AddAchievement(13) ; #DEBUG_LINE_NO:366
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:369
  Float cooldownTime = currentGameTime + COM_WantsToTalk_CooldownDays.GetValue() ; #DEBUG_LINE_NO:370
  Int I = 0 ; #DEBUG_LINE_NO:371
  While I < Alias_Companions.Length ; #DEBUG_LINE_NO:372
    Alias_Companions[I].GetActorRef().SetValue(COM_WantsToTalk_UnitedColonies_Cooldown, cooldownTime) ; #DEBUG_LINE_NO:373
    I += 1 ; #DEBUG_LINE_NO:374
  EndWhile ; #DEBUG_LINE_NO:
  COM_WantsToTalkEvent_UnitedColonies.Send(None) ; #DEBUG_LINE_NO:377
  Actor HadACT = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:380
  If HadACT.HasKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:382
    HadACT.RemoveKeyword(SQ_Followers_UseFollowPlayerCustom) ; #DEBUG_LINE_NO:383
  EndIf ; #DEBUG_LINE_NO:
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:386
  Self.Stop() ; #DEBUG_LINE_NO:387
EndFunction
