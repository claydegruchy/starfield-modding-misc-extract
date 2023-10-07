ScriptName Fragments:Quests:QF_TEST_BE_GenericDerelict_K_000F2E6D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TestGoToSpaceQuest Auto Const mandatory
ReferenceAlias Property Alias_DerelictShip Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Perk Property StarshipEngineering Auto Const mandatory
Quest Property BE_Player_DerelictShip_Generic Auto Const mandatory
Keyword Property SE_DerelictShipKeyword_Generic Auto Const mandatory
Keyword Property SE_KT02_ShipKeyword Auto Const mandatory
ReferenceAlias Property Alias_DerelictShip01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  TestGoToSpaceQuest.SetStage(10) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  spaceshipreference MyShipRef = Alias_DerelictShip.GetShipRef() ; #DEBUG_LINE_NO:15
  MyShipRef.MoveNear(Alias_PlayerShip.GetShipRef() as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().AddPerk(StarshipEngineering, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0030_Item_00()
  spaceshipreference MyShipRef = Alias_DerelictShip01.GetShipRef() ; #DEBUG_LINE_NO:26
  Alias_DerelictShip.GetShipRef().DisableNoWait(False) ; #DEBUG_LINE_NO:28
  MyShipRef.EnableNoWait(False) ; #DEBUG_LINE_NO:29
  MyShipRef.MoveNear(Alias_PlayerShip.GetShipRef() as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_1000_Item_00()
  BE_Player_DerelictShip_Generic.SetStage(1000) ; #DEBUG_LINE_NO:38
EndFunction
