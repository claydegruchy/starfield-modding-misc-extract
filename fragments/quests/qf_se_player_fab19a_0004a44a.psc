ScriptName Fragments:Quests:QF_SE_Player_FAB19a_0004A44A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_Player_FAB19a_100_JunoBarks Auto Const mandatory
ReferenceAlias Property Alias_PatrolStartMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Juno Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_GeneralMarker03 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference oTarg = Alias_GeneralMarker03.GetRef() ; #DEBUG_LINE_NO:8
  spaceshipreference oJuno = Alias_Juno.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:9
  oJuno.Enable(False) ; #DEBUG_LINE_NO:10
  oJuno.MoveTo(oTarg, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  oJuno.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:12
  oJuno.StartCombat(Alias_playerShip.GetRef() as spaceshipreference, False) ; #DEBUG_LINE_NO:13
  oJuno.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:14
  Alias_Juno.GetShipRef().SetGhost(False) ; #DEBUG_LINE_NO:17
  Alias_Juno.GetShipRef().IsEssential(False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0100_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:27
  SE_Player_FAB19a_100_JunoBarks.Start() ; #DEBUG_LINE_NO:28
EndFunction
