ScriptName Fragments:Quests:QF_City_ER_Peace_001699FB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Snead Auto Const mandatory
ReferenceAlias Property Alias_Nevan Auto Const mandatory
ObjectReference Property City_ER_Peace_DebugMarker01 Auto Const mandatory
ObjectReference Property City_ER_Peace_DebugMarker02 Auto Const mandatory
Scene Property City_ER_Peace_0340_Lance_Attract Auto Const mandatory
Scene Property City_ER_Peace_0400_Lance_MainScene Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerKilledTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStartedTrackersNegotiation Auto Const mandatory
Scene Property City_ER_Peace_0200_Snead_CheckIn Auto Const mandatory
Scene Property City_ER_Peace_0290_Snead_PlayerSneaksBy Auto Const mandatory
Armor Property Spacesuit_Recon_01_PeaceReward Auto Const mandatory
Armor Property Spacesuit_Recon_Backpack_01_PeaceReward Auto Const mandatory
Armor Property Spacesuit_Recon_Helmet_01_PeaceReward Auto Const mandatory
GlobalVariable Property ER_Dead_KilmansReturned Auto Const mandatory
Quest Property DialogueEleosRetreat Auto Const mandatory
Scene Property DialogueEleosRetreat_OpeningScene Auto Const mandatory
Perk Property BackgroundSoldier Auto Const mandatory
Perk Property BackgroundDiplomat Auto Const mandatory
Quest Property City_ER_Ghost_SupportQuest Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerBribedTrackers Auto Const mandatory
GlobalVariable Property ER_Exorcism_PlayerStarbornedTrackers Auto Const mandatory
Quest Property City_ER_Peace_Misc Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
GlobalVariable Property ER_QuestlineComplete Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_City_ER_Peace Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_01_PeaceReward_HighestQuality Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality Auto Const mandatory
LeveledItem Property LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:7
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(City_ER_Peace_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(19) ; #DEBUG_LINE_NO:17
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:18
  Self.SetStage(200) ; #DEBUG_LINE_NO:19
  Game.GetPlayer().MoveTo(City_ER_Peace_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:21
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0003_Item_00()
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0004_Item_00()
  ER_Exorcism_PlayerStartedTrackersNegotiation.SetValue(1.0) ; #DEBUG_LINE_NO:38
  ER_Exorcism_PlayerKilledTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddPerk(BackgroundSoldier, False) ; #DEBUG_LINE_NO:47
  Game.GetPlayer().AddPerk(BackgroundDiplomat, False) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0006_Item_00()
  ER_Exorcism_PlayerBribedTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0007_Item_00()
  ER_Exorcism_PlayerStarbornedTrackers.SetValue(1.0) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0019_Item_00()
  ER_Dead_KilmansReturned.SetValue(1.0) ; #DEBUG_LINE_NO:72
  DialogueEleosRetreat.SetStage(900) ; #DEBUG_LINE_NO:73
  DialogueEleosRetreat.SetStage(25) ; #DEBUG_LINE_NO:75
  DialogueEleosRetreat.SetStage(40) ; #DEBUG_LINE_NO:76
  DialogueEleosRetreat.SetStage(50) ; #DEBUG_LINE_NO:77
  DialogueEleosRetreat_OpeningScene.Stop() ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:86
  Self.SetActive(True) ; #DEBUG_LINE_NO:87
  Alias_Nevan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:89
  Alias_Nevan.GetActorRef().MoveToPackageLocation() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:98
  uc09questscript kmyQuest = __temp as uc09questscript ; #DEBUG_LINE_NO:99
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:102
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:103
  DialogueFCAkilaCity.SetStage(2051) ; #DEBUG_LINE_NO:106
  Alias_EnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:108
  kmyQuest.GetNPCsInPlace() ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0205_Item_00()
  City_ER_Peace_0200_Snead_CheckIn.Start() ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0290_Item_00()
  If !Self.GetStageDone(300) ; #DEBUG_LINE_NO:126
    City_ER_Peace_0290_Snead_PlayerSneaksBy.Start() ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Snead.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:136
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:138
  If !Self.GetStageDone(340) ; #DEBUG_LINE_NO:140
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0340_Item_00()
  City_ER_Peace_0340_Lance_Attract.Start() ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:158
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0400_Item_00()
  City_ER_Peace_0400_Lance_MainScene.Start() ; #DEBUG_LINE_NO:167
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:168
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:177
  PlayACT.AddItem(LL_Spacesuit_Recon_01_PeaceReward_HighestQuality as Form, 1, False) ; #DEBUG_LINE_NO:178
  PlayACT.AddItem(LL_Spacesuit_Recon_Backpack_01_PeaceReward_HighestQuality as Form, 1, False) ; #DEBUG_LINE_NO:179
  PlayACT.AddItem(LL_Spacesuit_Recon_Helmet_01_PeaceReward_HighestQuality as Form, 1, False) ; #DEBUG_LINE_NO:180
  PlayACT.AddItem(LL_Weapon_Reward_City_ER_Peace as Form, 1, False) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_ER_Ghost_SupportQuest.SetStage(1000) ; #DEBUG_LINE_NO:190
  DialogueEleosRetreat.SetStage(5000) ; #DEBUG_LINE_NO:193
  City_ER_Peace_Misc.Start() ; #DEBUG_LINE_NO:196
  ER_QuestlineComplete.SetValue(1.0) ; #DEBUG_LINE_NO:199
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:201
  Self.Stop() ; #DEBUG_LINE_NO:202
EndFunction
