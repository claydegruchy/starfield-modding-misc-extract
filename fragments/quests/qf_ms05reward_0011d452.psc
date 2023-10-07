ScriptName Fragments:Quests:QF_MS05Reward_0011D452 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS05ShipDesign Auto Const mandatory
ReferenceAlias Property Alias_SensibleShip Auto Const mandatory
ReferenceAlias Property Alias_RidiculousShip Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Quest Property MQ_TutorialQuest Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If MS05ShipDesign.GetValue() >= 0.0 ; #DEBUG_LINE_NO:9
    Self.SetStage(100) ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  spaceshipreference myShip = Alias_SensibleShip.GetShipRef() ; #DEBUG_LINE_NO:21
  myShip.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:22
  myShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:23
  myShip.Enable(False) ; #DEBUG_LINE_NO:24
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:27
  SQ_PlayerShip.AddPlayerOwnedShip(myShip) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference myShip = Alias_RidiculousShip.GetShipRef() ; #DEBUG_LINE_NO:40
  myShip.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:41
  myShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:42
  myShip.Enable(False) ; #DEBUG_LINE_NO:43
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:46
  SQ_PlayerShip.AddPlayerOwnedShip(myShip) ; #DEBUG_LINE_NO:47
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:59
  MQ_TutorialQuest.SetStage(300) ; #DEBUG_LINE_NO:62
  Self.Stop() ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_1001_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:72
  Self.Stop() ; #DEBUG_LINE_NO:74
EndFunction
