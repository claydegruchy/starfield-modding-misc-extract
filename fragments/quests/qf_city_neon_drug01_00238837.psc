ScriptName Fragments:Quests:QF_City_Neon_Drug01_00238837 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_C153Container Auto Const mandatory
RefCollectionAlias Property Alias_BadGuys Auto Const mandatory
ReferenceAlias Property Alias_Felix Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
Quest Property City_Neon_Drug02 Auto Const mandatory
ReferenceAlias Property Alias_NesharStart Auto Const mandatory
ReferenceAlias Property Alias_Neshar Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_C203Container Auto Const mandatory
MiscObject Property Neon_Drug01_Package Auto Const mandatory
LeveledItem Property Drug02_AmpResearch Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Keyword Property AnimArchetypeDepressed Auto Const mandatory
Scene Property Drug01_550_SyndicateGreeting Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property Neon_EvictedSleepcrate_Global Auto Const mandatory
Quest Property SleepcrateMinigameQuest Auto Const
ReferenceAlias Property Alias_XenofreshFisheriesDoor Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard00 Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard01 Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard_NoTrespass Auto Const mandatory
ReferenceAlias Property Alias_XenofreshGuard_NoTrespass01 Auto Const mandatory
ReferenceAlias Property Alias_NesharsPackage Auto Const mandatory
ObjectReference Property Neon_Drug01_NesharCrateDoor Auto Const mandatory
ObjectReference Property Drug01_NesharDoorRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0420_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Self.SetStage(125) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:20
  Float fAggression = 0.0 ; #DEBUG_LINE_NO:23
  Alias_BadGuys.SetValue(Aggression, fAggression) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:32
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:35
  Alias_Neshar.GetRef().Disable(False) ; #DEBUG_LINE_NO:36
  Game.GetPlayer().MoveTo(Alias_Yannick.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:45
  Drug01_NesharDoorRef.Lock(True, False, True) ; #DEBUG_LINE_NO:48
  Drug01_NesharDoorRef.SetLockLevel(254) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_Neshar.GetRef().Enable(False) ; #DEBUG_LINE_NO:58
  Alias_Neshar.GetRef().MoveTo(Alias_NesharStart.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:59
  Alias_Neshar.GetActorRef().ChangeAnimArchetype(AnimArchetypeDepressed) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:78
  Alias_C153Container.GetRef().Unlock(False) ; #DEBUG_LINE_NO:81
  Neon_Drug01_NesharCrateDoor.Unlock(False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0310_Item_00()
  Neon_EvictedSleepcrate_Global.Mod(1.0) ; #DEBUG_LINE_NO:91
  SleepcrateMinigameQuest.SetStage(10) ; #DEBUG_LINE_NO:92
  Alias_C203Container.GetRef().Unlock(False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:103
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:112
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:113
  DialogueFCNeon.SetStage(490) ; #DEBUG_LINE_NO:116
  Alias_Felix.GetRef().Enable(False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0410_Item_00()
  Game.GetPlayer().RemoveItem(Alias_NesharsPackage.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_BadGuys.EnableAll(False) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0550_Item_00()
  Self.SetStage(575) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:161
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:162
  Alias_BadGuys.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:165
  Float fAggression = 1.0 ; #DEBUG_LINE_NO:166
  Alias_BadGuys.SetValue(Aggression, fAggression) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:175
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:176
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:177
  Alias_Felix.GetRef().Enable(False) ; #DEBUG_LINE_NO:180
  Alias_Felix.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:189
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:190
  Alias_Felix.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0710_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:200
EndFunction

Function Fragment_Stage_0720_Item_00()
  (Alias_Felix.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:209
EndFunction

Function Fragment_Stage_0730_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0790_Item_00()
  Game.GetPlayer().AddItem(Drug02_AmpResearch as Form, 1, False) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:234
  city_neon_drug01_questscript kmyQuest = __temp as city_neon_drug01_questscript ; #DEBUG_LINE_NO:235
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:238
  Drug01_NesharDoorRef.Unlock(False) ; #DEBUG_LINE_NO:241
  Drug01_NesharDoorRef.SetLockLevel(0) ; #DEBUG_LINE_NO:242
  Alias_Neshar.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:243
  kmyQuest.UnregisterForExteriorDoorEvents() ; #DEBUG_LINE_NO:244
  City_Neon_Drug02.Start() ; #DEBUG_LINE_NO:247
  City_Neon_Drug02.SetActive(True) ; #DEBUG_LINE_NO:248
  Alias_XenofreshFisheriesDoor.GetRef().Unlock(False) ; #DEBUG_LINE_NO:252
  Alias_XenofreshGuard00.GetRef().Disable(False) ; #DEBUG_LINE_NO:253
  Alias_XenofreshGuard01.GetRef().Disable(False) ; #DEBUG_LINE_NO:254
  Alias_XenofreshGuard_NoTrespass.GetRef().Enable(False) ; #DEBUG_LINE_NO:255
  Alias_XenofreshGuard_NoTrespass01.GetRef().Enable(False) ; #DEBUG_LINE_NO:256
  Self.SetStage(9000) ; #DEBUG_LINE_NO:258
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Felix.GetRef().Disable(False) ; #DEBUG_LINE_NO:267
  Alias_Neshar.GetRef().Disable(False) ; #DEBUG_LINE_NO:268
  Self.Stop() ; #DEBUG_LINE_NO:270
EndFunction
