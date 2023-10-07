ScriptName Fragments:Quests:QF_SE_DB_04_005F18BF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_DB_04_100a_Hailing Auto Const mandatory
Scene Property SE_DB_04_200_LastWarning Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const
{ The faction that is the enemy of the player }
Faction Property PlayerFriendFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  oTarg.AddToFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0050_Item_00()
  SE_DB_04_100a_Hailing.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_DB_04_200_LastWarning.Start() ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0250_Item_00()
  SE_DB_04_200_LastWarning.Start() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:44
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:54
  oTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:55
  oTarg.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:56
EndFunction
