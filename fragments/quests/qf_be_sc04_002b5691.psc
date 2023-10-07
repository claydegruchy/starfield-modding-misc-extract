ScriptName Fragments:Quests:QF_BE_SC04_002B5691 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BE_SC04_BargainingScene Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ActorValue Property Health Auto Const mandatory
Scene Property BE_SC04_BargainingSceneIntro Auto Const mandatory
ReferenceAlias Property Alias_CaptainEssentialAlias Auto Const mandatory
Scene Property BE_SC04_BargainSucceeds Auto Const mandatory
Scene Property BE_SC04_BargainFails Auto Const mandatory
GlobalVariable Property BE_SC04_PirateKeepsBargainChanceGlobal Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
Keyword Property BE_SC04_Misc_Keyword Auto Const mandatory
Quest Property BE_SC04_Misc Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:8
  BE_SC04_BargainingSceneIntro.Start() ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0021_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:22
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:23
  kmyQuest.SetCrewPlayerFriend(True, True) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:37
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:38
  BE_SC04_BargainingSceneIntro.Stop() ; #DEBUG_LINE_NO:46
  BE_SC04_BargainingScene.Stop() ; #DEBUG_LINE_NO:47
  Actor captainRef = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:51
  If captainRef.GetValue(Health) <= 0.0 ; #DEBUG_LINE_NO:52
    captainRef.RestoreValue(Health, Math.Abs(captainRef.GetValue(Health)) + 1.0) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  Alias_CaptainEssentialAlias.Clear() ; #DEBUG_LINE_NO:55
  kmyQuest.SetCrewPlayerFriend(False, True) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:66
  be_sc04questscript kmyQuest = __temp as be_sc04questscript ; #DEBUG_LINE_NO:67
  kmyQuest.SpawnJumpTravelMarker() ; #DEBUG_LINE_NO:73
  If Self.GetStageDone(30) && !Self.GetStageDone(50) ; #DEBUG_LINE_NO:76
    If Utility.RandomInt(0, 100) < BE_SC04_PirateKeepsBargainChanceGlobal.GetValueInt() ; #DEBUG_LINE_NO:78
      BE_SC04_BargainSucceeds.Start() ; #DEBUG_LINE_NO:79
    Else ; #DEBUG_LINE_NO:
      BE_SC04_BargainFails.Start() ; #DEBUG_LINE_NO:81
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(70) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0061_Item_00()
  BE_SC04_Misc.SetStage(10) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0070_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:107
  be_sc04questscript kmyQuest = __temp as be_sc04questscript ; #DEBUG_LINE_NO:108
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:115
  If enemyShipRef.GetValue(SpaceshipCrew) > 0.0 ; #DEBUG_LINE_NO:116
    enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
EndFunction
