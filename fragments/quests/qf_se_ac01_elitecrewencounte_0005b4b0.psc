ScriptName Fragments:Quests:QF_SE_AC01_EliteCrewEncounte_0005B4B0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BettyHailScene Auto Const
ActorValue Property DockingPermission Auto Const
ReferenceAlias Property BettyShip Auto Const
ReferenceAlias Property Betty Auto Const
ReferenceAlias Property NewAtlantisMarker Auto Const
ReferenceAlias Property BettyShipMarker Auto Const
Quest Property BettyECQuest Auto Const
Scene Property SE_AC01_000_BettyInitialComment Auto Const mandatory
Scene Property SE_AC01_LuckyLuGoodbye Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
sq_parentscript Property SQ_Parent Auto Const mandatory
LocationAlias Property Alias_OrbitLocation Auto Const mandatory
Keyword Property LocTypeSENotAllowed Auto Const mandatory
Potion Property ShipRepairKit Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0005_Item_00()
  Betty.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_00()
  SE_AC01_000_BettyInitialComment.Start() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0015_Item_00()
  BettyECQuest.SetStage(45) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:47
  defaultquestchangelocationscript kmyQuest = __temp as defaultquestchangelocationscript ; #DEBUG_LINE_NO:48
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:52
  BettyECQuest.SetStage(40) ; #DEBUG_LINE_NO:53
  spaceshipreference BettyShipRef = BettyShip.GetShipRef() ; #DEBUG_LINE_NO:56
  BettyShipRef.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:57
  SQ_Parent.SetupDamagedShip(BettyShipRef, False, True, True, True, True, True, None) ; #DEBUG_LINE_NO:58
  If !BettyECQuest.GetStageDone(50) ; #DEBUG_LINE_NO:60
    Game.GetPlayer().RemoveItem(ShipRepairKit as Form, 1, False, None) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  BettyECQuest.SetStage(1) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0050_Item_00()
  BettyShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:83
  Betty.GetActorRef().MoveTo(NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:84
  Self.SetStage(1000) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_1000_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:95
    BettyShip.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:96
    Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:97
  Else ; #DEBUG_LINE_NO:
    SE_AC01_LuckyLuGoodbye.Start() ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  Betty.GetRef().MoveTo(NewAtlantisMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_2000_Item_01()
  BettyShip.GetShipRef().DisableNoWait(False) ; #DEBUG_LINE_NO:116
  Alias_OrbitLocation.GetLocation().RemoveKeyword(LocTypeSENotAllowed) ; #DEBUG_LINE_NO:117
  Self.Stop() ; #DEBUG_LINE_NO:118
EndFunction
