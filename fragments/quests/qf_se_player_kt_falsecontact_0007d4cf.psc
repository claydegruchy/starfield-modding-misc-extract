ScriptName Fragments:Quests:QF_SE_Player_KT_FalseContact_0007D4CF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
GlobalVariable Property OE_FalseContact_Global Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_ShipFighters Auto Const mandatory
ReferenceAlias Property Alias_HailingShip01 Auto Const mandatory
ReferenceAlias Property Alias_HailingShip02 Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
GlobalVariable Property OE_Credit_FalseContactCredits Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HailerRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:7
  spaceshipreference HailerRef01 = Alias_HailingShip01.GetShipRef() ; #DEBUG_LINE_NO:8
  spaceshipreference HailerRef02 = Alias_HailingShip02.GetShipRef() ; #DEBUG_LINE_NO:9
  Alias_ShipFighters.AddRef(HailerRef as ObjectReference) ; #DEBUG_LINE_NO:11
  Alias_ShipFighters.AddRef(HailerRef01 as ObjectReference) ; #DEBUG_LINE_NO:12
  Alias_ShipFighters.AddRef(HailerRef02 as ObjectReference) ; #DEBUG_LINE_NO:13
  HailerRef.EnableWithGravJump() ; #DEBUG_LINE_NO:15
  HailerRef01.EnableWithGravJump() ; #DEBUG_LINE_NO:19
  HailerRef02.EnableWithGravJump() ; #DEBUG_LINE_NO:20
  Alias_ShipFighters.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0040_Item_00()
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:30
  Self.SetStage(50) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0100_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, OE_Credit_FalseContactCredits.GetValueInt(), False, None) ; #DEBUG_LINE_NO:47
  OE_FalseContact_Global.SetValue(0.0) ; #DEBUG_LINE_NO:48
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:49
  Self.SetStage(300) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_ShipFighters.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:58
  Alias_ShipFighters.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:59
  Alias_ShipFighters.StartCombatAll(Alias_PlayerShip.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:60
  OE_FalseContact_Global.SetValue(0.0) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_HailingShip.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:69
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:70
  Alias_HailingShip01.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:71
  Alias_HailingShip02.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:72
EndFunction
