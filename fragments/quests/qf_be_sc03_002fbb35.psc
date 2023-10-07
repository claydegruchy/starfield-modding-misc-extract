ScriptName Fragments:Quests:QF_BE_SC03_002FBB35 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property BE_SC03_McGrathEncounterStateGlobal Auto Const mandatory
Scene Property BE_SC03_WelcomeScene Auto Const mandatory
LeveledItem Property BE_SC03_ExtortionReward Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:8
  kmyQuest.SetCrewPlayerFriend(True, True) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_SC03_WelcomeScene.Start() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0021_Item_00()
  BE_SC03_WelcomeScene.Stop() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0027_Item_00()
  Game.GetPlayer().AddItem(BE_SC03_ExtortionReward as Form, 1, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:58
  If enemyShipRef.GetValue(SpaceshipCrew) > 0.0 ; #DEBUG_LINE_NO:59
    enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:69
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:70
  kmyQuest.SetCrewPlayerFriend(False, True) ; #DEBUG_LINE_NO:76
  BE_SC03_McGrathEncounterStateGlobal.SetValue(2.0) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(30) && BE_SC03_McGrathEncounterStateGlobal.GetValue() == 0.0 ; #DEBUG_LINE_NO:91
    BE_SC03_McGrathEncounterStateGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction
