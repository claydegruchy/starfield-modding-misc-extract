ScriptName Fragments:Quests:QF_SE_Player_FAB21_00046049 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_EclipticBackup Auto Const mandatory
Form Property Ecliptic_A_Fighter_Sparrow01 Auto Const
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef() ; #DEBUG_LINE_NO:8
  oTarg.PlaceShipAtMeOffset(Ecliptic_A_Fighter_Sparrow01, 100.0, -100.0, 0.0, 1, True, False, False, True, Alias_EclipticBackup as Alias, None, True) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.wait(6.0) ; #DEBUG_LINE_NO:18
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference sShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:28
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:29
  sShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:30
  sShip.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:31
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:32
  sShip = Alias_EclipticBackup.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:34
  sShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:35
  sShip.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:36
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:47
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:48
EndFunction
