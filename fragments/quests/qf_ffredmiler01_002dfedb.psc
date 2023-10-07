ScriptName Fragments:Quests:QF_FFRedMileR01_002DFEDB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PlayerCompletedRedMile Auto Const mandatory
Quest Property FFRedMileR01Misc Auto Const mandatory
Quest Property DialogueRedMile Auto Const mandatory
ReferenceAlias Property Alias_RedMileStartingDoor Auto Const mandatory
RefCollectionAlias Property Alias_LightRotationHelpers Auto Const mandatory
ReferenceAlias Property Alias_DoorLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_StageLightsEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Mei Auto Const mandatory
GlobalVariable Property FFRedMileR01_RunCount Auto Const mandatory
GlobalVariable Property FFRedMileR01_RunCountRecord Auto Const mandatory
LeveledItem Property LL_Weapon_AA99_Unique_02 Auto Const mandatory
LeveledItem Property CreditsReward Auto Const
LeveledItem Property LL_FFRedMileR01_Reward Auto Const mandatory
Message Property FFRedMileR01_BuildRewardMsg Auto Const mandatory
LeveledItem Property LL_Weapon_Pacifier_Unique_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  PlayerCompletedRedMile.SetValue(18.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:16
  Alias_Mei.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:19
  If FFRedMileR01Misc.IsRunning() ; #DEBUG_LINE_NO:21
    FFRedMileR01Misc.SetStage(1000) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:25
  Alias_StageLightsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:28
  kmyQuest.SpawnCreatures(0) ; #DEBUG_LINE_NO:31
  Self.SetStage(100) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:43
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:46
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:47
  kmyQuest.RMDisableFastTravel() ; #DEBUG_LINE_NO:50
  Alias_RedMileStartingDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:53
  Alias_DoorLightsEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:55
  Alias_StageLightsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:65
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:66
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:70
  kmyQuest.SpawnCreatures(1) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0400_Item_00()
  PlayerCompletedRedMile.Mod(1.0) ; #DEBUG_LINE_NO:81
  Self.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile) ; #DEBUG_LINE_NO:82
  DialogueRedMile.UpdateCurrentInstanceGlobal(PlayerCompletedRedMile) ; #DEBUG_LINE_NO:83
  Alias_RedMileStartingDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:86
  Alias_DoorLightsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_RedMileStartingDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:97
  Self.Stop() ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:107
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:108
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:111
  Float runCountNewValue = FFRedMileR01_RunCount.Mod(1.0) ; #DEBUG_LINE_NO:115
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:118
  playerRef.AddItem(CreditsReward as Form, 1, False) ; #DEBUG_LINE_NO:121
  If runCountNewValue == 1.0 ; #DEBUG_LINE_NO:123
    playerRef.AddItem(LL_Weapon_Pacifier_Unique_01 as Form, 1, False) ; #DEBUG_LINE_NO:125
  ElseIf runCountNewValue == FFRedMileR01_RunCountRecord.GetValue() ; #DEBUG_LINE_NO:126
    playerRef.AddItem(LL_Weapon_AA99_Unique_02 as Form, 1, False) ; #DEBUG_LINE_NO:128
    FFRedMileR01_BuildRewardMsg.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:129
  Else ; #DEBUG_LINE_NO:
    playerRef.AddItem(LL_FFRedMileR01_Reward as Form, 1, False) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.RMEnableFastTravel() ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:144
  ffredmiler01questscript kmyQuest = __temp as ffredmiler01questscript ; #DEBUG_LINE_NO:145
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:148
  kmyQuest.RMEnableFastTravel() ; #DEBUG_LINE_NO:150
  Alias_RedMileStartingDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:153
  Alias_DoorLightsEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:154
  Self.Stop() ; #DEBUG_LINE_NO:156
EndFunction
