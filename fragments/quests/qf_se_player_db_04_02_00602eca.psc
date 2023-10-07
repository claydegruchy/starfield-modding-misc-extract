ScriptName Fragments:Quests:QF_SE_Player_DB_04_02_00602ECA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
Faction Property PlayerFriendFaction Auto Const
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_HailingShip2 Auto Const
ReferenceAlias Property Alias_HailingShip3 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HailingShip1 = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  HailingShip1.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:8
  spaceshipreference HailingShip2 = Alias_HailingShip2.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:10
  HailingShip2.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:11
  spaceshipreference HailingShip3 = Alias_HailingShip3.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:13
  HailingShip3.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference HailingShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:33
  HailingShip.DisableWithGravJump() ; #DEBUG_LINE_NO:34
  spaceshipreference HailingShip2 = Alias_HailingShip2.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:36
  HailingShip2.DisableWithGravJump() ; #DEBUG_LINE_NO:37
  spaceshipreference HailingShip3 = Alias_HailingShip3.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:39
  HailingShip3.DisableWithGravJump() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:48
  oTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:49
  oTarg.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:50
  spaceshipreference HailingShip2 = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:52
  HailingShip2.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:53
  HailingShip2.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:54
  spaceshipreference HailingShip3 = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:56
  HailingShip3.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:57
  HailingShip3.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:58
EndFunction
