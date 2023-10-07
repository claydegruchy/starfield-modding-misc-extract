ScriptName Fragments:Quests:QF_FC08_0025613B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FC08_SpaceEnc01 Auto Const mandatory
Scene Property FC08_DebriefIntroScene Auto Const mandatory
Scene Property FC08_DebriefScene01 Auto Const mandatory
Scene Property FC08_DebriefScene02 Auto Const mandatory
ReferenceAlias Property Alias_Daniel Auto Const mandatory
ObjectReference Property FC03_DebriefScene_CarsonMarker Auto Const mandatory
ObjectReference Property FC03_DebriefScene_BlakeMarker Auto Const mandatory
ReferenceAlias Property Alias_EmmaWilcox Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
ObjectReference Property FC02_EmmaHannahSceneMarker Auto Const mandatory
Scene Property FC08_TauntScene01 Auto Const mandatory
Scene Property FC08_TauntScene02 Auto Const mandatory
Scene Property FC08_TauntScene03 Auto Const mandatory
Scene Property FC08_TauntScene04 Auto Const mandatory
ReferenceAlias Property Alias_MechFactoryMapMarker Auto Const mandatory
ReferenceAlias Property Alias_PaxtonHull Auto Const mandatory
ReferenceAlias Property Alias_EvidenceSlate Auto Const mandatory
Faction Property TheFirstFaction Auto Const mandatory
Scene Property FC08_DebriefScene03 Auto Const mandatory
Scene Property FC08_DebriefInterruptScene Auto Const mandatory
ObjectReference Property FC03_Stage600_EmmaMarker Auto Const mandatory
ReferenceAlias Property Alias_Alex Auto Const mandatory
ReferenceAlias Property Alias_MechFactoryExteriorMainDoor Auto Const mandatory
Quest Property AutumnEliteCrewQuest Auto Const
Quest Property FC09 Auto Const mandatory
Quest Property FC_EvidenceSlateHolderQuest Auto Const mandatory
ActorValue Property FC08_Completed Auto Const mandatory
GlobalVariable Property FCQuests_MeetingRoomPackages Auto Const mandatory
ReferenceAlias Property Alias_HideoutEnableMarker Auto Const mandatory
GlobalVariable Property FC08_DebriefSceneHellosBlocked Auto Const mandatory
Location Property SArcturus_PArcturusII_Surface Auto Const mandatory
Quest Property FC08 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FCQuests_MeetingRoomPackages.SetValue(1.0) ; #DEBUG_LINE_NO:8
  Alias_Daniel.GetRef().MoveTo(FC03_DebriefScene_CarsonMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  Alias_EmmaWilcox.GetRef().MoveTo(FC03_DebriefScene_BlakeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  Alias_Player.GetRef().MoveTo(FC02_EmmaHannahSceneMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:25
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0120_Item_00()
  FC08_DebriefIntroScene.Start() ; #DEBUG_LINE_NO:35
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0125_Item_00()
  FC08_DebriefScene01.Start() ; #DEBUG_LINE_NO:46
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:49
  FC08_DebriefSceneHellosBlocked.SetValue(1.0) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0130_Item_00()
  FC08_DebriefScene02.Start() ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0135_Item_00()
  FC08_DebriefScene03.Start() ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0138_Item_00()
  Alias_Alex.GetActorRef().MoveTo(FC03_Stage600_EmmaMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:76
  Self.SetStage(140) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0140_Item_00()
  FC08_DebriefInterruptScene.Start() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0180_Item_00()
  Alias_PaxtonHull.GetRef().Enable(False) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:96
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:97
  FC08_DebriefSceneHellosBlocked.SetValue(0.0) ; #DEBUG_LINE_NO:99
  SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0200_Item_00()
  FCQuests_MeetingRoomPackages.SetValue(0.0) ; #DEBUG_LINE_NO:110
  FC08_SpaceEnc01.Start() ; #DEBUG_LINE_NO:113
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:115
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_MechFactoryMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:127
  Alias_MechFactoryMapMarker.GetRef().AddToMapScanned(True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:131
  SArcturus_PArcturusII_Surface.EnableSpaceTravel(FC08, True) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:141
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:142
  Alias_HideoutEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:145
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:147
  Self.SetObjectiveDisplayed(200, False, False) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:156
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:157
  Self.SetStage(610) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0600_Item_00()
  FC08_TauntScene01.Start() ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_MechFactoryExteriorMainDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:175
EndFunction

Function Fragment_Stage_0620_Item_00()
  FC08_TauntScene02.Start() ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0640_Item_00()
  FC08_TauntScene03.Start() ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_0660_Item_00()
  FC08_TauntScene04.Start() ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:207
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:208
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0740_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:217
  If Self.GetStageDone(750) ; #DEBUG_LINE_NO:219
    Self.SetStage(800) ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef() ; #DEBUG_LINE_NO:223
  PaxtonHull.SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:225
  PaxtonHull.RemoveFromFaction(TheFirstFaction) ; #DEBUG_LINE_NO:226
  PaxtonHull.StopCombat() ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0750_Item_00()
  Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:235
  If Self.GetStageDone(740) ; #DEBUG_LINE_NO:237
    Self.SetStage(800) ; #DEBUG_LINE_NO:238
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:247
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef() ; #DEBUG_LINE_NO:249
  PaxtonHull.AllowBleedoutDialogue(True) ; #DEBUG_LINE_NO:251
  PaxtonHull.StopCombat() ; #DEBUG_LINE_NO:252
  PaxtonHull.EvaluatePackage(False) ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0825_Item_00()
  Alias_PaxtonHull.GetActorRef().SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:262
  Alias_PaxtonHull.GetActorRef().ResetHealthAndLimbs() ; #DEBUG_LINE_NO:263
EndFunction

Function Fragment_Stage_0850_Item_00()
  Alias_Player.GetActorRef().AddItem(Alias_EvidenceSlate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:281
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:282
  Actor PaxtonHull = Alias_PaxtonHull.GetActorRef() ; #DEBUG_LINE_NO:284
  PaxtonHull.SetNoBleedoutRecovery(False) ; #DEBUG_LINE_NO:286
  PaxtonHull.AllowBleedoutDialogue(False) ; #DEBUG_LINE_NO:287
  PaxtonHull.SetEssential(False) ; #DEBUG_LINE_NO:288
  PaxtonHull.AddToFaction(TheFirstFaction) ; #DEBUG_LINE_NO:289
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_Player.GetActorRef().SetValue(FC08_Completed, 1.0) ; #DEBUG_LINE_NO:298
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:300
  FC09.Start() ; #DEBUG_LINE_NO:301
  Self.Stop() ; #DEBUG_LINE_NO:303
EndFunction
