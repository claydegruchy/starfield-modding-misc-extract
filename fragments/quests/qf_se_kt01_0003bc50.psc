ScriptName Fragments:Quests:QF_SE_KT01_0003BC50 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_FemaleEvenToned Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_Male06 Auto Const mandatory
ReferenceAlias Property Alias_HailingShip_Male08 Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Quest Property BE_KT01 Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const
Faction Property REPlayerAlly Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_HailingShipInterior Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Int random = Utility.RandomInt(0, 2) ; #DEBUG_LINE_NO:7
  spaceshipreference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef() ; #DEBUG_LINE_NO:9
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef() ; #DEBUG_LINE_NO:10
  spaceshipreference Male08 = Alias_HailingShip_Male08.GetShipRef() ; #DEBUG_LINE_NO:11
  If random == 0 ; #DEBUG_LINE_NO:13
    Alias_HailingShip.ForceRefTo(FemaleEvenToned as ObjectReference) ; #DEBUG_LINE_NO:14
  ElseIf random == 1 ; #DEBUG_LINE_NO:15
    Alias_HailingShip.ForceRefTo(Male06 as ObjectReference) ; #DEBUG_LINE_NO:16
  ElseIf random == 2 ; #DEBUG_LINE_NO:17
    Alias_HailingShip.ForceRefTo(Male08 as ObjectReference) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference pShip = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:21
  pShip.EnableNoWait(False) ; #DEBUG_LINE_NO:22
  pShip.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:23
  pShip.SetValue(SpaceshipCrew, 1.0) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0000_Item_01()
  spaceshipreference FemaleEvenToned = Alias_HailingShip_FemaleEvenToned.GetShipRef() ; #DEBUG_LINE_NO:32
  Alias_HailingShip.ForceRefTo(FemaleEvenToned as ObjectReference) ; #DEBUG_LINE_NO:34
  Alias_HailingShip.GetShipRef().EnableNoWait(False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0000_Item_02()
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef() ; #DEBUG_LINE_NO:43
  Alias_HailingShip.ForceRefTo(Male06 as ObjectReference) ; #DEBUG_LINE_NO:45
  Alias_HailingShip.GetShipRef().EnableNoWait(False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0000_Item_03()
  spaceshipreference Male08 = Alias_HailingShip_Male08.GetShipRef() ; #DEBUG_LINE_NO:54
  spaceshipreference Male06 = Alias_HailingShip_Male06.GetShipRef() ; #DEBUG_LINE_NO:56
  Alias_HailingShip.ForceRefTo(Male08 as ObjectReference) ; #DEBUG_LINE_NO:58
  Alias_HailingShip.GetShipRef().EnableNoWait(False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0006_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0040_Item_00()
  BE_KT01.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:99
  BE_KT01.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:100
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0040_Item_01()
  Actor CaptainRef = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:109
  CaptainRef.RemoveFromFaction(REPlayerAlly) ; #DEBUG_LINE_NO:111
  CaptainRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:112
  CaptainRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:113
  CaptainRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:114
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:141
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:142
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:143
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(20, True) ; #DEBUG_LINE_NO:151
  Self.Stop() ; #DEBUG_LINE_NO:152
EndFunction
