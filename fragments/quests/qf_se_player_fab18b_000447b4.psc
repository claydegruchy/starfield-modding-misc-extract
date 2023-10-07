ScriptName Fragments:Quests:QF_SE_Player_FAB18b_000447B4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property SE_FAB18b_200_PostCombatBark Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property SmugglerBase Auto Const
RefCollectionAlias Property Alias_Smugglers Auto Const mandatory
ReferenceAlias Property Alias_SmugglerLeader Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef() ; #DEBUG_LINE_NO:8
  spaceshipreference sShip = None ; #DEBUG_LINE_NO:9
  spaceshipreference sGenghis = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:10
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:11
  spaceshipbase sBadGuy = SmugglerBase ; #DEBUG_LINE_NO:12
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:13
  sShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:14
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:15
  sShip.StartCombat(sGenghis, False) ; #DEBUG_LINE_NO:16
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:17
  Alias_SmugglerLeader.ForceRefTo(sShip as ObjectReference) ; #DEBUG_LINE_NO:18
  Alias_Smugglers.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:19
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, -500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:21
  sShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:22
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:23
  sShip.StartCombat(sGenghis, False) ; #DEBUG_LINE_NO:24
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:25
  Alias_Smugglers.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:26
  Alias_Smugglers.StartCombatAll(sGenghis as ObjectReference) ; #DEBUG_LINE_NO:29
  Alias_Smugglers.StartCombatAll(sPlayer as ObjectReference) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0025_Item_00()
  spaceshipreference sGenghis = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:39
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:40
  Alias_Smugglers.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:41
  Alias_Smugglers.StartCombatAll(sGenghis as ObjectReference) ; #DEBUG_LINE_NO:42
  Alias_Smugglers.StartCombatAll(sPlayer as ObjectReference) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:52
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_FAB18b_200_PostCombatBark.Start() ; #DEBUG_LINE_NO:62
  MS02_GenghisReactivity.SetValue(3.0) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:75
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference sShip = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:85
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:86
  sShip.RemoveFromAllFactions() ; #DEBUG_LINE_NO:87
  sShip.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:88
  MS02_GenghisReactivity.SetValue(0.0) ; #DEBUG_LINE_NO:91
EndFunction
