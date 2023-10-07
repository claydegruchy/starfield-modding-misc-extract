ScriptName Fragments:Quests:QF_SE_JP01_00134BE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ActorValue Property Aggression Auto Const
ReferenceAlias Property Alias_AttackingShip01 Auto Const mandatory
ReferenceAlias Property Alias_AttackingShip02 Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:26
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  utility_fab_script kmyQuest = __temp as utility_fab_script ; #DEBUG_LINE_NO:36
  kmyQuest.ShipAttackPlayer(Alias_HailingShip.GetShipReference()) ; #DEBUG_LINE_NO:39
  Alias_AttackingShip01.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:41
  Alias_AttackingShip01.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:42
  Alias_AttackingShip02.GetShipReference().EnableWithGravJump() ; #DEBUG_LINE_NO:44
  Alias_AttackingShip02.GetShipReference().StartCombat(Alias_PlayerShip.GetShipReference(), False) ; #DEBUG_LINE_NO:45
EndFunction
