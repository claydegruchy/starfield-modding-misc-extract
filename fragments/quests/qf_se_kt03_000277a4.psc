ScriptName Fragments:Quests:QF_SE_KT03_000277A4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0006_Item_00()
  spaceshipreference myShip = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:15
  myShip.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:17
  myShip.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:18
  myShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:19
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:63
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:64
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:73
  Self.Stop() ; #DEBUG_LINE_NO:74
EndFunction
