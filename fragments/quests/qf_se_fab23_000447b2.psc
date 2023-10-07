ScriptName Fragments:Quests:QF_SE_FAB23_000447B2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PatrolStartMarker01 Auto Const mandatory
spaceshipbase Property EncShip_Spacer_F01 Auto Const
spaceshipbase Property EncShip_Spacer_M01 Auto Const
RefCollectionAlias Property Alias_SpacerBaddies Auto Const mandatory
Scene Property SE_FAB23_100_IntroBark Auto Const mandatory
Scene Property SE_FAB23_200_HostilesDown Auto Const mandatory
ReferenceAlias Property Alias_NiaKalu Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_PatrolStartMarker01.GetRef() ; #DEBUG_LINE_NO:8
  spaceshipreference sShip = None ; #DEBUG_LINE_NO:9
  spaceshipreference sNia = Alias_NiaKalu.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:10
  spaceshipreference sPlayer = Alias_playerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:11
  spaceshipbase sBadGuy = EncShip_Spacer_M01 ; #DEBUG_LINE_NO:12
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:13
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:14
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:15
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, -500.0, 0.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:17
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:18
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:19
  sBadGuy = EncShip_Spacer_F01 ; #DEBUG_LINE_NO:21
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 0.0, 500.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:22
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:23
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:24
  sShip = oTarg.PlaceShipAtMeOffset(sBadGuy as Form, 0.0, -500.0, 0.0, 4, True, False, False, True, None, None, True) ; #DEBUG_LINE_NO:26
  Alias_SpacerBaddies.AddRef(sShip as ObjectReference) ; #DEBUG_LINE_NO:27
  sShip.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:28
  Alias_SpacerBaddies.StartCombatAll(sNia as ObjectReference) ; #DEBUG_LINE_NO:31
  Alias_SpacerBaddies.StartCombatAll(sPlayer as ObjectReference) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:41
  SE_FAB23_100_IntroBark.Start() ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0200_Item_00()
  SE_FAB23_200_HostilesDown.Start() ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:60
  spaceshipreference sShip = Alias_NiaKalu.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:61
  sShip.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:70
EndFunction
