ScriptName Fragments:Quests:QF_SE_Player_ZW12a_0032767C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property PPlayerFriendFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  utility_fab_script kmyQuest = __temp as utility_fab_script ; #DEBUG_LINE_NO:17
  spaceshipreference myShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:20
  kmyQuest.ShipAttackPlayer(myShip) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:33
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:34
EndFunction
