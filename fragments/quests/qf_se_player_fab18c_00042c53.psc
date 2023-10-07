ScriptName Fragments:Quests:QF_SE_Player_FAB18c_00042C53 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_GenghisKhan Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
spaceshipbase Property GenghisBaseShip Auto Const
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property MS02_GenghisReactivity Auto Const mandatory
Scene Property SE_FAB18c_100_SpawnLine Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  spaceshipreference sShip = None ; #DEBUG_LINE_NO:9
  spaceshipreference sPlayer = Alias_PlayerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:10
  sShip = sPlayer.PlaceShipAtMeOffset(GenghisBaseShip as Form, 50.0, 750.0, 0.0, 4, True, False, True, True, Alias_GenghisKhan as Alias, None, True) ; #DEBUG_LINE_NO:11
  sShip.EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:12
  sShip.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:13
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:17
  Self.SetStage(100) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0100_Item_00()
  SE_FAB18c_100_SpawnLine.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference sGenghis = Alias_GenghisKhan.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:35
  spaceshipreference sPlayer = Alias_PlayerShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:36
  sGenghis.RemoveFromAllFactions() ; #DEBUG_LINE_NO:37
  sGenghis.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:38
  sGenghis.StartCombat(sPlayer, False) ; #DEBUG_LINE_NO:39
  sGenghis.EvaluatePackage(False) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0300_Item_00()
  MS02_GenghisReactivity.SetValue(0.0) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:57
EndFunction
