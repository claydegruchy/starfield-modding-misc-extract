ScriptName Fragments:Quests:QF_SE_Player_ZW09_00089819 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
GlobalVariable Property PSE_zw09_ShipDestroyed Auto Const mandatory
Faction Property PPlayerEnemyFaction Auto Const mandatory
ActorValue Property PShipSystemGravDriveHealth Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  utility_fab_script kmyQuest = __temp as utility_fab_script ; #DEBUG_LINE_NO:17
  spaceshipreference hailShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:20
  kmyQuest.ShipAttackPlayer(hailShip) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0280_Item_00()
  PSE_zw09_ShipDestroyed.setValue(1.0) ; #DEBUG_LINE_NO:29
  Utility.wait(6.0) ; #DEBUG_LINE_NO:30
  Self.setstage(300) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(4.0) ; #DEBUG_LINE_NO:41
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:42
  oTarg.RestoreValue(PShipSystemGravDriveHealth, 1000.0) ; #DEBUG_LINE_NO:43
  Utility.wait(2.0) ; #DEBUG_LINE_NO:44
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:45
EndFunction
