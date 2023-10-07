ScriptName Fragments:Quests:QF_SE_Player_AC01_000850F4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property PSE_Player_AC01_RunOnce Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:16
  ShipRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:17
  ShipRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:18
  ShipRef.StartCombat(Alias_PlayerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:19
  Self.Setstage(300) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  PSE_Player_AC01_RunOnce.SetValue(1.0) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:38
  oTarg.SetGhost(True) ; #DEBUG_LINE_NO:39
  Utility.wait(3.0) ; #DEBUG_LINE_NO:40
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:41
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:42
  Self.Setstage(1000) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:51
EndFunction
