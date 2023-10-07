ScriptName Fragments:Quests:QF_TestE3VideoQuest_00019467 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
spaceshipreference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property MQ101KreetShipLandingMarkerREF005 Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property TestE3VideoGlobal Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
Keyword Property AnimLandingKreet Auto Const mandatory
ObjectReference Property TestKreetRoof Auto Const mandatory
ObjectReference Property LC003_RoofMarker001 Auto Const mandatory
ObjectReference Property KreetPirateShip02 Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
Faction Property LC003PirateBossFaction Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
ObjectReference Property KreetLandingMarker02 Auto Const mandatory
Keyword Property AnimLandingKreetPirates Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor01 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor02 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor03 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor04 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor05 Auto Const mandatory
ReferenceAlias Property Alias_VigilancePatrolMarker01 Auto Const mandatory
ReferenceAlias Property Alias_VigilancePatrolMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Story14Actor Auto Const mandatory
Scene Property E3Story14 Auto Const mandatory
Scene Property TestE3Story14 Auto Const mandatory
Furniture Property ShipLandingMarker_80m_Large Auto Const mandatory
Keyword Property AnimTakeOffE3 Auto Const mandatory
GlobalVariable Property TestE3TakeoffGlobal Auto Const mandatory
Scene Property E3Ending11 Auto Const mandatory
ReferenceAlias Property Alias_Ending11LandingPad Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor07 Auto Const mandatory
ReferenceAlias Property Alias_VigilanceActor07Marker Auto Const mandatory
ReferenceAlias Property Alias_LandingPad Auto Const mandatory
ReferenceAlias Property Alias_Frontier Auto Const mandatory
Form Property Constellation_Frontier Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Frontier_ModularREF.Disable(False) ; #DEBUG_LINE_NO:7
  Utility.Wait(0.25) ; #DEBUG_LINE_NO:8
  Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:10
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0010_Item_01()
  MQ101KreetShipLandingMarkerREF005.addKeyword(AnimLandingKreet) ; #DEBUG_LINE_NO:19
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:20
  Frontier_ModularREF.moveto(MQ101KreetShipLandingMarkerREF005, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Frontier_ModularREF.setlinkedref(MQ101KreetShipLandingMarkerREF005, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:23
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:24
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF) ; #DEBUG_LINE_NO:25
  TestE3VideoGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:34
  MQ101.SetStage(670) ; #DEBUG_LINE_NO:35
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:36
  MQ101.SetStage(690) ; #DEBUG_LINE_NO:37
  Game.GetPlayer().moveto(TestKreetRoof, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  LC003_RoofMarker001.Enable(False) ; #DEBUG_LINE_NO:39
  KreetLandingMarker02.addKeyword(AnimLandingKreetPirates) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0030_Item_00()
  KreetPirateShip02.Enable(False) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_VigilanceActor01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:56
  Alias_VigilanceActor02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:57
  Alias_VigilanceActor03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:58
  Alias_VigilanceActor04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:59
  Alias_VigilanceActor05.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:60
  Alias_VigilancePatrolMarker01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:61
  Alias_VigilancePatrolMarker02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:62
  Actor VigRef = Alias_VigilanceActor07.GetActorRef() ; #DEBUG_LINE_NO:63
  VigRef.moveto(Alias_VigilanceActor07Marker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  VigRef.Kill(None) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Story14Actor.GetRef().Enable(False) ; #DEBUG_LINE_NO:73
  E3Story14.Start() ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0100_Item_00()
  E3Ending11.Stop() ; #DEBUG_LINE_NO:82
  ObjectReference LandingMarkerREF = None ; #DEBUG_LINE_NO:84
  If Alias_Ending11LandingPad.GetRef() == None ; #DEBUG_LINE_NO:86
    LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:87
    LandingMarkerREF.addKeyword(AnimTakeOffE3) ; #DEBUG_LINE_NO:88
    Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF) ; #DEBUG_LINE_NO:89
  Else ; #DEBUG_LINE_NO:
    LandingMarkerREF = Alias_Ending11LandingPad.GetRef() ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  TestE3TakeoffGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:94
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:96
  spaceshipreference FrontierShipREF = LandingMarkerREF.PlaceShipAtMe(Constellation_Frontier, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:98
  Alias_Frontier.ForceRefTo(FrontierShipREF as ObjectReference) ; #DEBUG_LINE_NO:99
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:101
  E3Ending11.Start() ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0110_Item_00()
  ObjectReference LandingMarkerREF = None ; #DEBUG_LINE_NO:111
  LandingMarkerREF = Game.GetPlayer().PlaceAtMe(ShipLandingMarker_80m_Large as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:113
  LandingMarkerREF.addKeyword(AnimTakeOffE3) ; #DEBUG_LINE_NO:114
  Alias_Ending11LandingPad.ForceRefTo(LandingMarkerREF) ; #DEBUG_LINE_NO:115
  Self.SetStage(100) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0120_Item_00()
  Alias_Frontier.GetRef().Disable(False) ; #DEBUG_LINE_NO:125
  Alias_Frontier.GetRef().Delete() ; #DEBUG_LINE_NO:126
  Alias_Frontier.Clear() ; #DEBUG_LINE_NO:127
EndFunction
