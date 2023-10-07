ScriptName OutpostStarstationActorScript Extends Actor

;-- Variables ---------------------------------------
Bool initialized = False
ObjectReference myOutpostObject
spaceshipreference orbitalShip
spaceshipreference orbitalStarstation

;-- Properties --------------------------------------
Keyword Property SQ_OutpostCreateStarstationStoryEvent Auto Const mandatory
{ used to create orbital marker }
Keyword Property LinkOutpostStarstationObject Auto Const mandatory
{ used to link actor to outpost functional proxy }
spaceshipbase Property OutpostStarstationShip01 Auto Const mandatory
{ use to create defense ships in orbit }
ObjectReference Property myLandingMarker Auto hidden
{ landing marker, set by Initialize }
sq_outpostcreatestarstationscript Property SQ_OutpostCreateStarstation Auto hidden
{ quest that holds orbital marker data }
ActorValue Property SpaceshipRegistration Auto Const mandatory
{ to register the starstation }
ActorValue Property PowerGenerated Auto Const mandatory
{ outpost stat }
ActorValue Property OutpostStarstationShips Auto Const mandatory
{ create ships in orbit to match this }
ActorValue Property OutpostScannerMultiplier Auto Const mandatory
{ outpost stat }
ActorValue Property OutpostScannerRadius Auto Const mandatory
{ outpost stat }
Float Property OutpostScannerMultBase = 5.0 Auto Const
{ this is what the outpost OutpostScannerMultiplier will be set to if the starstation OutpostScannerMultiplier > 0 }
Float Property OutpostScannerRadiusMax = 1000.0 Auto Const
{ outpost scanner radius can't exceed this no matter what value is on the starstation }

;-- Functions ---------------------------------------

Function Initialize(ObjectReference landingMarkerRef)
  If initialized == False ; #DEBUG_LINE_NO:50
    myLandingMarker = landingMarkerRef ; #DEBUG_LINE_NO:51
    myOutpostObject = myLandingMarker.GetLinkedRef(LinkOutpostStarstationObject) ; #DEBUG_LINE_NO:54
    sq_outpostcreatestarstationscript[] createOrbitalQuests = SQ_OutpostCreateStarstationStoryEvent.SendStoryEventAndWait(None, myLandingMarker, None, 0, 0) as sq_outpostcreatestarstationscript[] ; #DEBUG_LINE_NO:57
    If createOrbitalQuests.Length > 0 ; #DEBUG_LINE_NO:58
      SQ_OutpostCreateStarstation = createOrbitalQuests[0] ; #DEBUG_LINE_NO:59
      While SQ_OutpostCreateStarstation.IsStarting() ; #DEBUG_LINE_NO:60
        Utility.wait(0.5) ; #DEBUG_LINE_NO:61
      EndWhile ; #DEBUG_LINE_NO:
      Self.CreateStarstation() ; #DEBUG_LINE_NO:63
      initialized = True ; #DEBUG_LINE_NO:64
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Cleanup()
  If SQ_OutpostCreateStarstation ; #DEBUG_LINE_NO:72
    SQ_OutpostCreateStarstation.Stop() ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ModifyStarstation()
  If initialized ; #DEBUG_LINE_NO:78
    ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef() ; #DEBUG_LINE_NO:79
    myOrbitMarker.ShowHangarMenu(0, Self as Actor, orbitalStarstation, False) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CreateStarstation()
  orbitalStarstation = SQ_OutpostCreateStarstation.Starstation.GetShipRef() ; #DEBUG_LINE_NO:85
  ObjectReference myOrbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalMarker.GetRef() ; #DEBUG_LINE_NO:86
  If orbitalStarstation ; #DEBUG_LINE_NO:87
    orbitalStarstation.SetActorRefOwner(Self as Actor, False) ; #DEBUG_LINE_NO:89
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerModifiedShip") ; #DEBUG_LINE_NO:91
    sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:95
    SQ_PlayerShip.AddPlayerOwnedShip(orbitalStarstation) ; #DEBUG_LINE_NO:96
    orbitalStarstation.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:101
    Self.UpdateStarstationStats() ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnPlayerModifiedShip(Actor akSender, spaceshipreference akShip)
  If akShip == orbitalStarstation ; #DEBUG_LINE_NO:112
    Self.UpdateStarstationStats() ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateStarstationStats()
  If orbitalStarstation ; #DEBUG_LINE_NO:121
    Float powerStat = orbitalStarstation.GetValue(PowerGenerated) ; #DEBUG_LINE_NO:123
    myOutpostObject.SetValue(PowerGenerated, powerStat) ; #DEBUG_LINE_NO:125
    Float scanStat = orbitalStarstation.GetValue(OutpostScannerRadius) ; #DEBUG_LINE_NO:128
    If scanStat > 0.0 ; #DEBUG_LINE_NO:130
      myOutpostObject.SetValue(OutpostScannerMultiplier, OutpostScannerMultBase) ; #DEBUG_LINE_NO:132
      scanStat = Math.Min(scanStat, OutpostScannerRadiusMax) ; #DEBUG_LINE_NO:133
      myOutpostObject.SetValue(OutpostScannerRadius, scanStat) ; #DEBUG_LINE_NO:134
    Else ; #DEBUG_LINE_NO:
      myOutpostObject.SetValue(OutpostScannerMultiplier, 1.0) ; #DEBUG_LINE_NO:137
      myOutpostObject.SetValue(OutpostScannerRadius, 0.0) ; #DEBUG_LINE_NO:138
    EndIf ; #DEBUG_LINE_NO:
    Int shipsStat = orbitalStarstation.GetValueInt(OutpostStarstationShips) ; #DEBUG_LINE_NO:142
    Int currentShipCount = SQ_OutpostCreateStarstation.Ships.GetCount() ; #DEBUG_LINE_NO:143
    If shipsStat > currentShipCount ; #DEBUG_LINE_NO:145
      Int numberToCreate = shipsStat - currentShipCount ; #DEBUG_LINE_NO:147
      ObjectReference orbitMarker = SQ_OutpostCreateStarstation.CreatedOrbitalPatrolStart.GetRef() ; #DEBUG_LINE_NO:149
      While numberToCreate > 0 ; #DEBUG_LINE_NO:150
        spaceshipreference newShip = orbitMarker.PlaceShipAtMe(OutpostStarstationShip01 as Form, 4, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:151
        SQ_OutpostCreateStarstation.Ships.AddRef(newShip as ObjectReference) ; #DEBUG_LINE_NO:152
        numberToCreate -= 1 ; #DEBUG_LINE_NO:154
      EndWhile ; #DEBUG_LINE_NO:
    ElseIf shipsStat < currentShipCount ; #DEBUG_LINE_NO:156
      Int numberToDelete = currentShipCount - shipsStat ; #DEBUG_LINE_NO:158
      While numberToDelete > 0 ; #DEBUG_LINE_NO:160
        ObjectReference shipToDelete = SQ_OutpostCreateStarstation.Ships.GetAt(0) ; #DEBUG_LINE_NO:161
        SQ_OutpostCreateStarstation.Ships.RemoveRef(shipToDelete) ; #DEBUG_LINE_NO:163
        shipToDelete.DisableNoWait(False) ; #DEBUG_LINE_NO:164
        numberToDelete -= 1 ; #DEBUG_LINE_NO:165
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TestShowHangarMenu()
  myLandingMarker.ShowHangarMenu(0, Self as Actor, None, False) ; #DEBUG_LINE_NO:173
EndFunction
