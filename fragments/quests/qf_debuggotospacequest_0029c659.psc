ScriptName Fragments:Quests:QF_DebugGoToSpaceQuest_0029C659 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewGameShipMarkerREF Auto Const mandatory
Quest Property TestMQ101HelperQuest Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
ObjectReference Property JemisonArrivalMarker Auto Const mandatory
spaceshipbase Property TestMaxLandable01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Frontier_ModularREF.moveto(NewGameShipMarkerREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:16
  inputenablelayer MyEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:19
  MyEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:20
  Frontier_ModularREF.moveto(NewGameShipMarkerREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:24
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:26
  PlayerREF.moveto(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  SQ_PlayerShip.ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:30
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:31
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:36
  Game.FadeOutGame(False, True, 0.0, 5.0, False) ; #DEBUG_LINE_NO:39
  TestMQ101HelperQuest.SetStage(10) ; #DEBUG_LINE_NO:42
  MyEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:45
  MyEnableLayer = None ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetStage(5) ; #DEBUG_LINE_NO:54
  SQ_PlayerShip.debugInitializeHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:69
  Utility.Wait(20.0) ; #DEBUG_LINE_NO:72
  Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:80
  Frontier_ModularREF.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword, True) ; #DEBUG_LINE_NO:83
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:98
  inputenablelayer MyEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:100
  MyEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:101
  spaceshipreference maxShip = NewGameShipMarkerREF.PlaceShipAtMe(TestMaxLandable01 as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:103
  PlayerREF.moveto(maxShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:104
  SQ_PlayerShip.ResetHomeShip(maxShip) ; #DEBUG_LINE_NO:105
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:106
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:107
  Game.FadeOutGame(False, True, 0.0, 5.0, False) ; #DEBUG_LINE_NO:108
  TestMQ101HelperQuest.SetStage(10) ; #DEBUG_LINE_NO:110
  MyEnableLayer.EnablePlayerControls(True, True, True, True, True, True, True, True, True, True, True) ; #DEBUG_LINE_NO:112
  MyEnableLayer.Delete() ; #DEBUG_LINE_NO:113
EndFunction
