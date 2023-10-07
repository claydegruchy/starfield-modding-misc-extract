ScriptName Fragments:Quests:QF_SE_FAB17_0005072A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
Scene Property SE_FAB17_050_InitialScene Auto Const mandatory
ReferenceAlias Property Alias_Smuggler Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Smuggler.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:7
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:8
  ShipRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:10
  ShipRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0005_Item_00()
  PHailTemplate_100a_Hailing.Stop() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0050_Item_00()
  Utility.wait(5.0) ; #DEBUG_LINE_NO:36
  SE_FAB17_050_InitialScene.Start() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference SmugglerShip = Alias_Smuggler.GetShipRef() ; #DEBUG_LINE_NO:45
  SE_FAB17_050_InitialScene.Stop() ; #DEBUG_LINE_NO:46
  SmugglerShip.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:47
  SmugglerShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:48
  Utility.wait(2.0) ; #DEBUG_LINE_NO:50
  Self.SetStage(300) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0100_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:70
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0325_Item_00()
  SE_FAB17_050_InitialScene.Stop() ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0350_Item_00()
  SE_FAB17_050_InitialScene.Stop() ; #DEBUG_LINE_NO:88
  (Alias_Smuggler.GetRef() as spaceshipreference).DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:89
EndFunction
