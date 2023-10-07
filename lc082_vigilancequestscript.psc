ScriptName LC082_VigilanceQuestScript Extends Quest
{ Quest script for LC082. Manages the Vigilance's movement. }

;-- Structs -----------------------------------------
Struct VigilanceLocationDatum
  String LocationName
  LocationAlias SpaceLocation
  Location ReserveOrbitLocation
  Cell SpaceCell
  ReferenceAlias EnableMarker
  ReferenceAlias MapMarker
  ReferenceAlias MoveToMarker
  ReferenceAlias TrafficManagerMarker
  Int StageToSet
EndStruct


;-- Variables ---------------------------------------
Int CONST_AILevelMod_Hard = 2 Const
Int CONST_Brig_ReleasedPrisonerStageToSet = 210 Const
Int CONST_DockingPermission_Neutral = 0
Int CONST_DockingPermission_Never = 4 Const
Int CONST_Global_SysDefShutdownTriggered = 1 Const
Int CONST_LC082_SysDefFail = 250 Const
Int CONST_LC082_SysDefFail_StartKickoutScene = 251 Const
Int CONST_LC088_CFMainBattleStart = 160 Const
Int CONST_LC088_SDMainBattleStart = 260 Const
spaceshipreference VigilanceShipRef
ObjectReference currentEnableMarkerRef
String currentLocationName
ObjectReference currentMoveToMarkerRef
Cell currentSpaceCell
Location currentSpaceLoc
Int currentStageToSet
ObjectReference currentTrafficManagerMarker
Int newLocationIndex = -1
ObjectReference pilotSeatRef
Location vigilanceInteriorLoc
Bool waitingForPlayerToSit

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard LocationDataGuard

;-- Properties --------------------------------------
Group AutofillProperties
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  LocationAlias Property VigilanceInteriorLocation Auto Const mandatory
  LocationAlias Property VigilanceReservedOrbitLocation Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
  ReferenceAlias Property PlayerShipPilotSeat Auto Const mandatory
  ReferenceAlias Property VigilanceShip Auto Const mandatory
  ReferenceAlias Property PilotSeat Auto Const mandatory
  RefCollectionAlias Property VigilanceMainActors Auto Const mandatory
  RefCollectionAlias Property VigilanceMainActors_Protected Auto Const mandatory
  RefCollectionAlias Property VigilanceMainTurrets Auto Const mandatory
  spaceshipbase Property DEBUG_PlayerShipCF Auto Const mandatory
  Keyword Property LC082_VigilanceTravelTargetKeyword Auto Const mandatory
  Keyword Property DisallowAsCombatTargetKeyword Auto Const mandatory
  GlobalVariable Property CF_SysDefShutdown Auto Const mandatory
  ActorValue Property DockingPermission Auto Const mandatory
  ActorValue Property ShieldHealth Auto Const mandatory
  ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
  FormList Property LC088_Space_QuickstartCrewList Auto Const mandatory
  ObjectReference Property VigilanceMarkerRef Auto Const mandatory
  ObjectReference Property scDebugStartOriginMarker Auto Const mandatory
  Message Property LC082_PilotSeatNotAuthorizedMessage Auto Const mandatory
  Quest Property LC088_Space Auto Const mandatory
  Perk Property LC088_Space_VigilanceDamageImmunityPerk Auto Const mandatory
  Potion Property ShipRepairKit Auto Const mandatory
EndGroup

lc082_vigilancequestscript:vigilancelocationdatum[] Property VigilanceLocationData Auto Const mandatory
{ List of locations the Vigilance will be, ordered from the first to the last. }

;-- Functions ---------------------------------------

Event OnQuestInit()
  VigilanceShipRef = VigilanceShip.GetShipRef() ; #DEBUG_LINE_NO:89
  vigilanceInteriorLoc = VigilanceInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:90
  pilotSeatRef = PilotSeat.GetRef() ; #DEBUG_LINE_NO:91
  pilotSeatRef.BlockActivation(True, False) ; #DEBUG_LINE_NO:92
  Self.RegisterForRemoteEvent(pilotSeatRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:93
EndEvent

Function UpdateVigilanceLocation(String proposedLocationName)
  Self.Start() ; #DEBUG_LINE_NO:97
  Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:98
    If currentLocationName == proposedLocationName ; #DEBUG_LINE_NO:99
       ; #DEBUG_LINE_NO:
    ElseIf currentLocationName == "Shutdown" ; #DEBUG_LINE_NO:101
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      If newLocationIndex >= 0 ; #DEBUG_LINE_NO:104
         ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      newLocationIndex = VigilanceLocationData.findstruct("LocationName", proposedLocationName, 0) ; #DEBUG_LINE_NO:107
      If newLocationIndex < 0 ; #DEBUG_LINE_NO:108
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.Private_UpdateVigilanceLocation() ; #DEBUG_LINE_NO:111
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_ForceUpdateVigilanceLocation(String proposedLocationName)
  Self.Start() ; #DEBUG_LINE_NO:118
  Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:119
    newLocationIndex = VigilanceLocationData.findstruct("LocationName", proposedLocationName, 0) ; #DEBUG_LINE_NO:120
    Self.Private_UpdateVigilanceLocation() ; #DEBUG_LINE_NO:121
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function Private_UpdateVigilanceLocation()
  If Game.GetPlayer().GetCurrentLocation() == vigilanceInteriorLoc || PlayerShip.GetShipRef() != None && PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc ; #DEBUG_LINE_NO:132
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:134
  ElseIf VigilanceLocationData[newLocationIndex].LocationName == "Shutdown" ; #DEBUG_LINE_NO:135
    If LC088_Space.GetStageDone(CONST_LC088_CFMainBattleStart) || LC088_Space.GetStageDone(CONST_LC088_SDMainBattleStart) ; #DEBUG_LINE_NO:136
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      currentLocationName = "Shutdown" ; #DEBUG_LINE_NO:140
      currentSpaceLoc = None ; #DEBUG_LINE_NO:141
      currentSpaceCell = None ; #DEBUG_LINE_NO:142
      currentEnableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:143
      currentTrafficManagerMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:144
      currentEnableMarkerRef = None ; #DEBUG_LINE_NO:145
      currentMoveToMarkerRef = None ; #DEBUG_LINE_NO:146
      currentTrafficManagerMarker = None ; #DEBUG_LINE_NO:147
      VigilanceShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:148
      VigilanceReservedOrbitLocation.Clear() ; #DEBUG_LINE_NO:149
    EndIf ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:151
  ElseIf newLocationIndex == -1 ; #DEBUG_LINE_NO:152
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    lc082_vigilancequestscript:vigilancelocationdatum newDatum = VigilanceLocationData[newLocationIndex] ; #DEBUG_LINE_NO:155
    newLocationIndex = -1 ; #DEBUG_LINE_NO:156
    Location newLoc = newDatum.SpaceLocation.GetLocation() ; #DEBUG_LINE_NO:157
    If currentSpaceLoc != None ; #DEBUG_LINE_NO:160
      currentEnableMarkerRef.Disable(False) ; #DEBUG_LINE_NO:161
      currentTrafficManagerMarker.Disable(False) ; #DEBUG_LINE_NO:162
    EndIf ; #DEBUG_LINE_NO:
    currentLocationName = newDatum.LocationName ; #DEBUG_LINE_NO:165
    currentSpaceLoc = newLoc ; #DEBUG_LINE_NO:166
    currentSpaceCell = newDatum.SpaceCell ; #DEBUG_LINE_NO:167
    currentEnableMarkerRef = newDatum.EnableMarker.GetRef() ; #DEBUG_LINE_NO:168
    currentMoveToMarkerRef = newDatum.MoveToMarker.GetRef() ; #DEBUG_LINE_NO:169
    currentTrafficManagerMarker = newDatum.TrafficManagerMarker.GetRef() ; #DEBUG_LINE_NO:170
    currentStageToSet = newDatum.StageToSet ; #DEBUG_LINE_NO:171
    VigilanceShipRef.Disable(False) ; #DEBUG_LINE_NO:173
    VigilanceShipRef.SetLinkedRef(currentMoveToMarkerRef, LC082_VigilanceTravelTargetKeyword, True) ; #DEBUG_LINE_NO:174
    VigilanceShipRef.MoveTo(currentMoveToMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:175
    VigilanceShipRef.EvaluatePackage(True) ; #DEBUG_LINE_NO:176
    VigilanceShipRef.Enable(False) ; #DEBUG_LINE_NO:177
    ObjectReference mapMarkerHeadingRef = newDatum.MapMarker.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:179
    If mapMarkerHeadingRef != None ; #DEBUG_LINE_NO:180
      VigilanceMarkerRef.MoveTo(mapMarkerHeadingRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:181
    EndIf ; #DEBUG_LINE_NO:
    currentEnableMarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:184
    currentTrafficManagerMarker.EnableNoWait(False) ; #DEBUG_LINE_NO:186
    VigilanceReservedOrbitLocation.ForceLocationTo(newDatum.ReserveOrbitLocation) ; #DEBUG_LINE_NO:188
    If currentStageToSet ; #DEBUG_LINE_NO:190
      Self.SetStage(currentStageToSet) ; #DEBUG_LINE_NO:191
    EndIf ; #DEBUG_LINE_NO:
    Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnLocationChange(Actor akSource, Location akOldLoc, Location akNewLoc)
  If akSource == Game.GetPlayer() && akNewLoc != vigilanceInteriorLoc && akNewLoc != currentSpaceLoc ; #DEBUG_LINE_NO:199
    Guard LocationDataGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:200
      Self.Private_UpdateVigilanceLocation() ; #DEBUG_LINE_NO:201
    EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetEscortShipsEnabled(Bool shouldBeEnabled)
  If currentEnableMarkerRef != None ; #DEBUG_LINE_NO:212
    If shouldBeEnabled ; #DEBUG_LINE_NO:213
      currentEnableMarkerRef.EnableNoWait(False) ; #DEBUG_LINE_NO:214
    Else ; #DEBUG_LINE_NO:
      currentEnableMarkerRef.DisableNoWait(False) ; #DEBUG_LINE_NO:216
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ActivateTurrets()
  Actor[] vigilanceTurrets = VigilanceMainTurrets.GetArray() as Actor[] ; #DEBUG_LINE_NO:227
  Int I = 0 ; #DEBUG_LINE_NO:228
  While I < vigilanceTurrets.Length ; #DEBUG_LINE_NO:229
    vigilanceTurrets[I].SetUnconscious(False) ; #DEBUG_LINE_NO:230
    I += 1 ; #DEBUG_LINE_NO:231
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetAllowDockingWithVigilance(Bool shouldAllowDocking)
  If shouldAllowDocking ; #DEBUG_LINE_NO:236
    VigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Neutral as Float) ; #DEBUG_LINE_NO:237
  Else ; #DEBUG_LINE_NO:
    VigilanceShipRef.SetValue(DockingPermission, CONST_DockingPermission_Never as Float) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TryToStartKickoutScene()
  Self.SetAllowDockingWithVigilance(False) ; #DEBUG_LINE_NO:244
  If Game.GetPlayer().GetCurrentLocation() == vigilanceInteriorLoc || PlayerShip.GetShipRef().IsDocked() ; #DEBUG_LINE_NO:245
    Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:246
  ElseIf PlayerShip.GetShipRef().GetCurrentLocation() == currentSpaceLoc ; #DEBUG_LINE_NO:247
    Self.SetStage(CONST_LC082_SysDefFail_StartKickoutScene) ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnShipUndock(ReferenceAlias akShip, Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If abComplete && akShip == PlayerShip && Self.GetStageDone(CONST_LC082_SysDefFail) ; #DEBUG_LINE_NO:255
    Self.UnregisterForRemoteEvent(PlayerShip as ScriptObject, "OnShipUndock") ; #DEBUG_LINE_NO:256
    Self.SetStage(CONST_LC082_SysDefFail_StartKickoutScene) ; #DEBUG_LINE_NO:257
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSource, ObjectReference akActivator)
  If akSource == pilotSeatRef && (akActivator == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:267
    LC082_PilotSeatNotAuthorizedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:268
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProtectVigilanceMainActors(Bool shouldBeProtected)
  If shouldBeProtected ; #DEBUG_LINE_NO:278
    VigilanceMainActors_Protected.AddRefCollection(VigilanceMainActors) ; #DEBUG_LINE_NO:279
    Int I = 0 ; #DEBUG_LINE_NO:280
    Int count = VigilanceMainActors_Protected.GetCount() ; #DEBUG_LINE_NO:281
    While I < count ; #DEBUG_LINE_NO:282
      VigilanceMainActors_Protected.GetAt(I).IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:283
      I += 1 ; #DEBUG_LINE_NO:284
    EndWhile ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Int i = 0 ; #DEBUG_LINE_NO:287
    Int count = VigilanceMainActors_Protected.GetCount() ; #DEBUG_LINE_NO:288
    While i < count ; #DEBUG_LINE_NO:289
      VigilanceMainActors_Protected.GetAt(i).IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:290
      i += 1 ; #DEBUG_LINE_NO:291
    EndWhile ; #DEBUG_LINE_NO:
    VigilanceMainActors_Protected.RemoveAll() ; #DEBUG_LINE_NO:293
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DEBUG_SetupVigilanceCombatDemo()
  Self.DEBUG_GoToSpaceAndWait() ; #DEBUG_LINE_NO:304
  Self.UpdateVigilanceLocation("DEBUG_CombatDemo") ; #DEBUG_LINE_NO:307
  VigilanceShipRef.RemovePerk(LC088_Space_VigilanceDamageImmunityPerk) ; #DEBUG_LINE_NO:310
  VigilanceShipRef.RemoveKeyword(DisallowAsCombatTargetKeyword) ; #DEBUG_LINE_NO:311
  VigilanceShipRef.DamageValue(ShieldHealth, 100000.0) ; #DEBUG_LINE_NO:312
  VigilanceShipRef.DamageValue(ShipSystemShieldsHealth, 100000.0) ; #DEBUG_LINE_NO:313
  VigilanceShipRef.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:314
  VigilanceShipRef.RemoveFromAllFactions() ; #DEBUG_LINE_NO:315
  Self.SetStage(210) ; #DEBUG_LINE_NO:318
  PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:321
EndFunction

Function DEBUG_SetupBatteryCombatDemo()
  Self.DEBUG_GoToSpaceAndWait() ; #DEBUG_LINE_NO:326
  PlayerShip.GetShipRef().MoveTo(VigilanceMarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:329
EndFunction

Function DEBUG_GoToSpaceAndWait()
  inputenablelayer myEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:334
  myEnableLayer.DisablePlayerControls(True, True, True, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:335
  spaceshipreference testShip = scDebugStartOriginMarker.PlaceShipAtMe(DEBUG_PlayerShipCF as Form, CONST_AILevelMod_Hard, True, False, False, True, None, None, None, True) ; #DEBUG_LINE_NO:336
  SQ_PlayerShip.ResetPlayerShip(testShip) ; #DEBUG_LINE_NO:337
  SQ_PlayerShip.ResetHomeShip(testShip) ; #DEBUG_LINE_NO:338
  testShip.AddItem(ShipRepairKit as Form, 20, False) ; #DEBUG_LINE_NO:339
  Game.GetPlayer().MoveTo(testShip as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:340
  SQ_PlayerShip.HandleShipTakeOff(True, False) ; #DEBUG_LINE_NO:341
  PlayerShipPilotSeat.GetRef().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:342
  myEnableLayer.Delete() ; #DEBUG_LINE_NO:343
  waitingForPlayerToSit = True ; #DEBUG_LINE_NO:344
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnSit") ; #DEBUG_LINE_NO:345
  While waitingForPlayerToSit ; #DEBUG_LINE_NO:
    Utility.Wait(0.5) ; #DEBUG_LINE_NO:347
  EndWhile ; #DEBUG_LINE_NO:
  SQ_Crew.DebugCreateCrewFromFormlist(LC088_Space_QuickstartCrewList, True, testShip) ; #DEBUG_LINE_NO:349
EndFunction

Event Actor.OnSit(Actor akSource, ObjectReference akFurniture)
  waitingForPlayerToSit = False ; #DEBUG_LINE_NO:353
EndEvent
