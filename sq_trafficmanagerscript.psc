ScriptName SQ_TrafficManagerScript Extends Quest
{ Quest script for Traffic Manager }

;-- Variables ---------------------------------------
spaceshipreference[] AllShips
Int CheckStateTimerID = 1 Const
Bool IsEntering
Float MaxRefreshTime
Float MinRefreshTime
FormList TrafficShiplist
Int despawnDist = 500 Const
Int maxShips
Float percentMaxSpeed = 1.0 Const

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_EnterPoints Auto Const mandatory
{ RC of markers that represent where ships are entering and leaving the planet's atmosphere }
RefCollectionAlias Property Alias_HoldPoints Auto Const mandatory
{ RC of markers that represent where ships might hold and park in the middle of the space }
RefCollectionAlias Property Alias_ExitPoints Auto Const mandatory
{ RC of markers that represent where ships are entering and leaving the planet's gravity well via grav jump }
RefCollectionAlias Property Alias_ShipsTransitNoWaitEntering Auto Const mandatory
RefCollectionAlias Property Alias_ShipsTransitNoWaitExiting Auto Const mandatory
{ RCs to hold ships that are going to fly straight through without waiting. Different group for different behaviors }
ReferenceAlias Property Alias_Settings Auto Const mandatory
{ Object in the cell that holds all of the settings }
ReferenceAlias Property PlayerShip Auto Const mandatory
{ PlayerShip Alias }
LocationAlias Property PlayerShipLocation Auto Const mandatory
Keyword Property LinkKeywordHold Auto Const mandatory
{ Keyword to define the hold point the ships are linked to, referred to by it's package }
Keyword Property LinkKeywordDestination Auto Const mandatory
{ Keyword to define the destination the ships are linked to, referred to by it's package }
Keyword Property SQ_TrafficManager_ToDelete Auto Const mandatory
{ Keyword to mark ships that are disabled and ready to be deleted }

;-- Functions ---------------------------------------

Event OnQuestinit()
  ObjectReference SettingsMarker = Alias_Settings.GetRef() ; #DEBUG_LINE_NO:52
  sq_trafficmanagersettingsscript SettingsScript = SettingsMarker as sq_trafficmanagersettingsscript ; #DEBUG_LINE_NO:53
  maxShips = SettingsScript.maxShips ; #DEBUG_LINE_NO:54
  TrafficShiplist = SettingsScript.TrafficShiplist ; #DEBUG_LINE_NO:55
  MinRefreshTime = SettingsScript.MinRefreshTime ; #DEBUG_LINE_NO:56
  MaxRefreshTime = SettingsScript.MaxRefreshTime ; #DEBUG_LINE_NO:57
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:59
  AllShips = new spaceshipreference[0] ; #DEBUG_LINE_NO:61
  ObjectReference[] myObjectRefs = Alias_ShipsTransitNoWaitEntering.GetArray() ; #DEBUG_LINE_NO:63
  spaceshipreference[] myShipRefs = myObjectRefs as spaceshipreference[] ; #DEBUG_LINE_NO:64
  Int I = 0 ; #DEBUG_LINE_NO:65
  While I < myShipRefs.Length ; #DEBUG_LINE_NO:66
    AllShips.add(myShipRefs[I], 1) ; #DEBUG_LINE_NO:67
    I += 1 ; #DEBUG_LINE_NO:68
  EndWhile ; #DEBUG_LINE_NO:
  myObjectRefs = Alias_ShipsTransitNoWaitExiting.GetArray() ; #DEBUG_LINE_NO:71
  myShipRefs = myObjectRefs as spaceshipreference[] ; #DEBUG_LINE_NO:72
  I = 0 ; #DEBUG_LINE_NO:73
  While I < myShipRefs.Length ; #DEBUG_LINE_NO:74
    AllShips.add(myShipRefs[I], 1) ; #DEBUG_LINE_NO:75
    I += 1 ; #DEBUG_LINE_NO:76
  EndWhile ; #DEBUG_LINE_NO:
  Self.CheckState() ; #DEBUG_LINE_NO:79
EndEvent

Function SpawnShip()
  spaceshipreference newShip = None ; #DEBUG_LINE_NO:88
  ObjectReference DestinationLink = None ; #DEBUG_LINE_NO:89
  If IsEntering == True ; #DEBUG_LINE_NO:93
    Int tempSpawnPoint = Utility.RandomInt(0, Alias_ExitPoints.GetCount() - 1) ; #DEBUG_LINE_NO:95
    Int tempDestinationPoint = Utility.RandomInt(0, Alias_EnterPoints.GetCount() - 1) ; #DEBUG_LINE_NO:96
    ObjectReference spawnMarkerRef = Alias_ExitPoints.GetAt(tempSpawnPoint) ; #DEBUG_LINE_NO:97
    DestinationLink = Alias_EnterPoints.GetAt(tempDestinationPoint) ; #DEBUG_LINE_NO:98
    newShip = spawnMarkerRef.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0, TrafficShiplist.GetSize() - 1)), 4, False, False, True, True, None, None, None, True) ; #DEBUG_LINE_NO:100
    newShip.EnableWithGravJump() ; #DEBUG_LINE_NO:103
    Alias_ShipsTransitNoWaitEntering.AddRef(newShip as ObjectReference) ; #DEBUG_LINE_NO:104
    IsEntering = False ; #DEBUG_LINE_NO:105
  ElseIf IsEntering == False ; #DEBUG_LINE_NO:107
    Int tempspawnpoint = Utility.RandomInt(0, Alias_EnterPoints.GetCount() - 1) ; #DEBUG_LINE_NO:109
    Int tempdestinationpoint = Utility.RandomInt(0, Alias_ExitPoints.GetCount() - 1) ; #DEBUG_LINE_NO:110
    ObjectReference spawnmarkerref = Alias_EnterPoints.GetAt(tempspawnpoint) ; #DEBUG_LINE_NO:111
    DestinationLink = Alias_ExitPoints.GetAt(tempdestinationpoint) ; #DEBUG_LINE_NO:112
    newShip = spawnmarkerref.PlaceShipAtMe(TrafficShiplist.GetAt(Utility.RandomInt(0, TrafficShiplist.GetSize() - 1)), 4, False, False, True, True, None, None, None, True) ; #DEBUG_LINE_NO:114
    newShip.EnableWithGravJump() ; #DEBUG_LINE_NO:116
    Alias_ShipsTransitNoWaitExiting.AddRef(newShip as ObjectReference) ; #DEBUG_LINE_NO:117
    IsEntering = True ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  newShip.SetLinkedRef(DestinationLink, LinkKeywordDestination, False) ; #DEBUG_LINE_NO:122
  newShip.SetForwardVelocity(percentMaxSpeed) ; #DEBUG_LINE_NO:123
  AllShips.add(newShip, 1) ; #DEBUG_LINE_NO:125
EndFunction

Function CheckState()
  Int I = AllShips.Length - 1 ; #DEBUG_LINE_NO:131
  While I >= 0 ; #DEBUG_LINE_NO:134
    spaceshipreference currentShip = AllShips[I] ; #DEBUG_LINE_NO:136
    If currentShip.HasKeyword(SQ_TrafficManager_ToDelete) ; #DEBUG_LINE_NO:138
      AllShips.remove(I, 1) ; #DEBUG_LINE_NO:139
      currentShip.Disable(False) ; #DEBUG_LINE_NO:141
    EndIf ; #DEBUG_LINE_NO:
    If currentShip.GetDistance(currentShip.GetLinkedRef(LinkKeywordDestination)) < despawnDist as Float ; #DEBUG_LINE_NO:144
      If currentShip.GetLinkedRef(LinkKeywordHold) != None ; #DEBUG_LINE_NO:146
        Alias_HoldPoints.AddRef(currentShip.GetLinkedRef(LinkKeywordHold)) ; #DEBUG_LINE_NO:147
      EndIf ; #DEBUG_LINE_NO:
      If Alias_ShipsTransitNoWaitExiting.Find(currentShip as ObjectReference) >= 0 ; #DEBUG_LINE_NO:150
        Alias_ShipsTransitNoWaitExiting.RemoveRef(currentShip as ObjectReference) ; #DEBUG_LINE_NO:151
        currentShip.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:152
        currentShip.AddKeyword(SQ_TrafficManager_ToDelete) ; #DEBUG_LINE_NO:153
      ElseIf Alias_ShipsTransitNoWaitEntering.Find(currentShip as ObjectReference) >= 0 ; #DEBUG_LINE_NO:154
        Alias_ShipsTransitNoWaitEntering.RemoveRef(currentShip as ObjectReference) ; #DEBUG_LINE_NO:155
        currentShip.DisableWithTakeOffOrLandingNoWait() ; #DEBUG_LINE_NO:156
        currentShip.AddKeyword(SQ_TrafficManager_ToDelete) ; #DEBUG_LINE_NO:157
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I -= 1 ; #DEBUG_LINE_NO:162
  EndWhile ; #DEBUG_LINE_NO:
  If AllShips.Length < maxShips ; #DEBUG_LINE_NO:167
    Self.SpawnShip() ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
  Float TimerDuration = Utility.RandomFloat(MinRefreshTime, MaxRefreshTime) ; #DEBUG_LINE_NO:171
  Self.StartTimer(TimerDuration, CheckStateTimerID) ; #DEBUG_LINE_NO:173
EndFunction

Event OnTimer(Int timerID)
  If timerID == CheckStateTimerID ; #DEBUG_LINE_NO:178
    Self.CheckState() ; #DEBUG_LINE_NO:179
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias source, Location akOldLoc, Location akNewLoc)
  If akNewLoc != PlayerShipLocation.GetLocation() ; #DEBUG_LINE_NO:184
    Int I = AllShips.Length - 1 ; #DEBUG_LINE_NO:186
    While I >= 0 ; #DEBUG_LINE_NO:188
      spaceshipreference currentShip = AllShips[I] ; #DEBUG_LINE_NO:190
      currentShip.SetLinkedRef(None, LinkKeywordDestination, False) ; #DEBUG_LINE_NO:191
      currentShip.DisableNoWait(False) ; #DEBUG_LINE_NO:192
      I -= 1 ; #DEBUG_LINE_NO:193
    EndWhile ; #DEBUG_LINE_NO:
    AllShips.clear() ; #DEBUG_LINE_NO:197
    Self.Stop() ; #DEBUG_LINE_NO:198
  EndIf ; #DEBUG_LINE_NO:
EndEvent
