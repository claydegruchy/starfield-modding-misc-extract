ScriptName Fragments:Quests:QF_SE_Player_FAB20_0004789E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
RefCollectionAlias Property Alias_MathisAllies Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
Form Property EncShip_CrimsonFleet_F Auto Const
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker03 Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker01 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
GlobalVariable Property SE_Player_FAB20_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oMarker = Alias_GeneralMarker01.GetRef() ; #DEBUG_LINE_NO:8
  spaceshipreference sShip = None ; #DEBUG_LINE_NO:9
  Float[] offset = new Float[6] ; #DEBUG_LINE_NO:12
  offset[0] = 221.0 ; #DEBUG_LINE_NO:13
  offset[1] = -333.0 ; #DEBUG_LINE_NO:14
  offset[2] = 0.0 ; #DEBUG_LINE_NO:15
  offset[5] = 23.0 ; #DEBUG_LINE_NO:16
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True) ; #DEBUG_LINE_NO:18
  Alias_MathisAllies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:19
  offset[0] = -100.0 ; #DEBUG_LINE_NO:21
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True) ; #DEBUG_LINE_NO:22
  Alias_MathisAllies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:23
  offset[1] = -200.0 ; #DEBUG_LINE_NO:25
  sShip = oMarker.PlaceShipAtMe(EncShip_CrimsonFleet_F, 4, True, False, False, True, offset, None, None, True) ; #DEBUG_LINE_NO:26
  Alias_MathisAllies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.wait(6.0) ; #DEBUG_LINE_NO:36
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference sShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:46
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:47
  sShip.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:48
  sShip.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:49
  sShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:50
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:51
  Int I = 0 ; #DEBUG_LINE_NO:54
  Int iCount = Alias_MathisAllies.GetCount() ; #DEBUG_LINE_NO:55
  While I < iCount ; #DEBUG_LINE_NO:57
    sShip = Alias_MathisAllies.GetShipAt(I) ; #DEBUG_LINE_NO:58
    If sShip ; #DEBUG_LINE_NO:59
      sShip.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:60
      sShip.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:61
      sShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:62
      sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:66
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  SE_Player_FAB20_RunOnce.SetValue(1.0) ; #DEBUG_LINE_NO:75
EndFunction
