ScriptName BEDebugScript Extends Quest
{ Quest script for BEDebug, the Boarding Encounter Debug quest. }

;-- Variables ---------------------------------------
Bool skipInstantBoardingAfterDocking
spaceshipreference testShip
bescript testShipQuest
spaceshipreference testShipWaitingForBE

;-- Properties --------------------------------------
Group QuestProperties collapsedonbase
  sq_parentscript Property SQ_Parent Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  LocationAlias Property PlayerShipInteriorLocation Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property Companion Auto Const mandatory
  GlobalVariable Property BEChanceMainGlobal Auto Const mandatory
  GlobalVariable Property BEChanceDerelictGlobal Auto Const mandatory
  ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
  ActorValue Property ShipSystemEngineHealth Auto Const mandatory
  Keyword Property CurrentInteractionLinkedRefKeyword Auto Const mandatory
  ReferenceAlias Property TestCreatedShip Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function TestBE(String testBEQuestName, spaceshipbase testBEShip, Bool skipInstantBoarding)
  Self.Start() ; #DEBUG_LINE_NO:26
  If testBEQuestName == "" ; #DEBUG_LINE_NO:27
    Return  ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  SQ_Parent.SendBEForceStopEvent() ; #DEBUG_LINE_NO:31
  While testShipQuest != None && testShipQuest.IsRunning() ; #DEBUG_LINE_NO:32
    Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:33
  EndWhile ; #DEBUG_LINE_NO:
  BEChanceMainGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:35
  BEChanceDerelictGlobal.SetValue(100.0) ; #DEBUG_LINE_NO:36
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:39
  ObjectReference playerShipPilotSeatRef = PlayerShipPilotSeat.GetRef() ; #DEBUG_LINE_NO:40
  Location playerShipInteriorLoc = PlayerShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:41
  If playerShipInteriorLoc == None || playerShipPilotSeatRef == None ; #DEBUG_LINE_NO:42
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If player.GetCurrentLocation() == playerShipInteriorLoc ; #DEBUG_LINE_NO:45
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      player.MoveTo(playerShipPilotSeatRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
    testShipWaitingForBE = Self.TestBESpawn(testBEShip) ; #DEBUG_LINE_NO:52
    If testShipWaitingForBE == None ; #DEBUG_LINE_NO:53
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_BEStarted") ; #DEBUG_LINE_NO:57
      skipInstantBoardingAfterDocking = skipInstantBoarding ; #DEBUG_LINE_NO:58
      PlayerShip.GetShipRef().InstantDock(testShipWaitingForBE as ObjectReference) ; #DEBUG_LINE_NO:59
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

spaceshipreference Function TestBESpawn(spaceshipbase testBEShip)
  If testBEShip == None ; #DEBUG_LINE_NO:65
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:68
    If playerShipRef == None ; #DEBUG_LINE_NO:69
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      If playerShipRef.IsDocked() ; #DEBUG_LINE_NO:72
        playerShipRef.InstantUndock() ; #DEBUG_LINE_NO:73
      EndIf ; #DEBUG_LINE_NO:
      If testShip != None ; #DEBUG_LINE_NO:75
        testShip.Disable(False) ; #DEBUG_LINE_NO:76
        testShip.Delete() ; #DEBUG_LINE_NO:77
      EndIf ; #DEBUG_LINE_NO:
      If testShipWaitingForBE != None ; #DEBUG_LINE_NO:79
        testShipWaitingForBE.Disable(False) ; #DEBUG_LINE_NO:80
        testShipWaitingForBE.Delete() ; #DEBUG_LINE_NO:81
      EndIf ; #DEBUG_LINE_NO:
      Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:83
      offsets[1] = 250.0 ; #DEBUG_LINE_NO:84
      testShip = PlayerShip.GetRef().PlaceShipAtMe(testBEShip as Form, 4, False, False, False, True, offsets, None, None, True) ; #DEBUG_LINE_NO:85
      testShip.EnablePartRepair(ShipSystemEngineHealth, False) ; #DEBUG_LINE_NO:86
      testShip.DamageValue(ShipSystemEngineHealth, 100000.0) ; #DEBUG_LINE_NO:87
      testShip.WaitFor3DLoad() ; #DEBUG_LINE_NO:88
      Return testShip ; #DEBUG_LINE_NO:89
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event SQ_ParentScript.SQ_BEStarted(sq_parentscript akSender, Var[] akArgs)
  spaceshipreference enemyShip = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:95
  bescript enemyShipBEQuest = akArgs[1] as bescript ; #DEBUG_LINE_NO:96
  If enemyShip == testShipWaitingForBE ; #DEBUG_LINE_NO:98
    testShipQuest = enemyShipBEQuest ; #DEBUG_LINE_NO:99
    testShipWaitingForBE = None ; #DEBUG_LINE_NO:100
    If skipInstantBoardingAfterDocking ; #DEBUG_LINE_NO:
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.TestBEInstantBoard(enemyShip, enemyShipBEQuest) ; #DEBUG_LINE_NO:104
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TestBEInstantBoard(spaceshipreference enemyShip, bescript enemyShipBEQuest)
  ObjectReference loadMarker = enemyShipBEQuest.GetEnemyShipLoadDoorMarker() ; #DEBUG_LINE_NO:111
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:112
  player.MoveTo(loadMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:113
  Actor companionRef = Companion.GetActorRef() ; #DEBUG_LINE_NO:114
  If companionRef != None ; #DEBUG_LINE_NO:115
    companionRef.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TestBEUndock()
  PlayerShip.GetShipRef().InstantUndock() ; #DEBUG_LINE_NO:121
EndFunction

ObjectReference Function TestSpawnShip(Form testObject)
  If testObject == None ; #DEBUG_LINE_NO:126
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    spaceshipreference playerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:129
    If playerShipRef == None ; #DEBUG_LINE_NO:130
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Float[] offsets = new Float[6] ; #DEBUG_LINE_NO:133
      offsets[1] = 250.0 ; #DEBUG_LINE_NO:134
      testShip = PlayerShip.GetRef().PlaceShipAtMe(testObject, 4, True, False, False, True, offsets, None, None, True) ; #DEBUG_LINE_NO:135
      TestCreatedShip.ForceRefTo(testShip as ObjectReference) ; #DEBUG_LINE_NO:136
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetHomeShip(Form newShipBase)
  spaceshipreference oldPlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:143
  oldPlayerShipRef.Disable(False) ; #DEBUG_LINE_NO:144
  spaceshipreference newPlayerShipRef = NewAtlantisShipLandingMarker.PlaceShipAtMe(newShipBase, 4, False, False, True, True, None, None, None, True) ; #DEBUG_LINE_NO:145
  SQ_PlayerShip.ResetHomeShip(newPlayerShipRef) ; #DEBUG_LINE_NO:146
  newPlayerShipRef.SetLinkedRef(NewAtlantisShipLandingMarker, CurrentInteractionLinkedRefKeyword, True) ; #DEBUG_LINE_NO:147
  newPlayerShipRef.Enable(False) ; #DEBUG_LINE_NO:148
EndFunction
