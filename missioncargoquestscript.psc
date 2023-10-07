ScriptName MissionCargoQuestScript Extends MissionCargoParentScript conditional
{ cargo delivery quest script }

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Properties --------------------------------------
Group CargoMissionData
  sq_parentscript Property SQ_Parent Auto Const
  { optional - to get contraband confiscated events }
  RefCollectionAlias Property SourceCollection Auto Const mandatory
  { collection holding all valid source refs }
  ReferenceAlias Property DestinationCargo Auto Const mandatory
  { alias holding cargo destination ref - counterpart to what is in PrimaryRef alias }
  RefCollectionAlias Property CargoCollection Auto Const mandatory
  { alias holding cargo items }
  LocationAlias Property CargoSourceLocation Auto Const mandatory
  { alias with source location }
  Message Property MissionBoardCargoNoSpaceMessage Auto Const mandatory
  { if you don't have space on your ship for this cargo }
  Message Property MissionBoardContrabandWarningAcceptMessage Auto Const mandatory
  { accept message to use if you don't have enough shielded space on your ship for this contraband cargo }
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
  { for now holds player ship }
  Keyword Property MissionStoryKeywordCargoDestination Auto Const mandatory
  { keyword to use to start this quest's cargo destination finder quest }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
  Bool Property Contraband = False Auto Const
  { set to TRUE if this mission involves contraband - if TRUE, accept will warn player if their ship doesn't have enough shielded cargo space for this cargo }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Bool Property PickOnlyCargoThatWillFit = False Auto Const
  { by default, will pick randomly from all cargo - some of which may be too heavy for player's current ship 
	  set this to TRUE to pick only form cargo that can fit in the player's current ship }
  Float Property DestinationCheckDistance = 50000.0 Auto Const
  { if UseDistanceCheckForDestinationCheck = true, count as "at destination" if destination marker is within this distance }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestTimerStart(Int aiReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID) ; #DEBUG_LINE_NO:54
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID ; #DEBUG_LINE_NO:58
    Self.InitializeCargo() ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function InitializeCargo()
  Bool foundValidDestination = False ; #DEBUG_LINE_NO:66
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:67
  missionparentscript:missionlocreftype[] cargoTypes = new missionparentscript:missionlocreftype[0] ; #DEBUG_LINE_NO:69
  If PlayerShipRef ; #DEBUG_LINE_NO:70
    Float cargoSpaceTotal = PlayerShipRef.GetShipMaxCargoWeight() ; #DEBUG_LINE_NO:71
    Int I = 0 ; #DEBUG_LINE_NO:73
    While I < SourceCollection.GetCount() ; #DEBUG_LINE_NO:74
      missionboardcargocontainerscript sourceRef = SourceCollection.GetAt(I) as missionboardcargocontainerscript ; #DEBUG_LINE_NO:75
      If sourceRef ; #DEBUG_LINE_NO:76
        MiscObject theCargoMiscObject = sourceRef.CargoMiscObject ; #DEBUG_LINE_NO:77
        Float cargoWeightBase = theCargoMiscObject.GetWeight() ; #DEBUG_LINE_NO:79
        Float minCargoWeight = cargoWeightBase * sourceRef.CargoWeightMultMin as Float ; #DEBUG_LINE_NO:80
        If PickOnlyCargoThatWillFit == False || minCargoWeight <= cargoSpaceTotal ; #DEBUG_LINE_NO:82
          Int cargoTypeIndex = MissionParent.cargoTypes.findstruct("CargoSourceBase", sourceRef.GetBaseObject(), 0) ; #DEBUG_LINE_NO:84
          If cargoTypeIndex > -1 ; #DEBUG_LINE_NO:85
            missionparentscript:missionlocreftype theCargoType = MissionParent.cargoTypes[cargoTypeIndex] ; #DEBUG_LINE_NO:86
            cargoTypes.add(theCargoType, 1) ; #DEBUG_LINE_NO:88
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:92
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If cargoTypes.Length > 0 ; #DEBUG_LINE_NO:96
    missiondestinationfinderscript finderQuest = None ; #DEBUG_LINE_NO:97
    missiondestinationfinderscript[] startedQuests = MissionStoryKeywordCargoDestination.SendStoryEventAndWait(CargoSourceLocation.GetLocation(), SourceCollection.GetAt(0), None, 0, 0) as missiondestinationfinderscript[] ; #DEBUG_LINE_NO:98
    If startedQuests.Length > 0 ; #DEBUG_LINE_NO:100
      finderQuest = startedQuests[0] ; #DEBUG_LINE_NO:102
      While finderQuest.IsStarting() ; #DEBUG_LINE_NO:103
         ; #DEBUG_LINE_NO:
      EndWhile ; #DEBUG_LINE_NO:
      foundValidDestination = finderQuest.FindMatchingDestination(cargoTypes, SourceCollection, PrimaryRef, DestinationCargo, TargetLocation) ; #DEBUG_LINE_NO:107
      TargetSystemLocation.RefillAlias() ; #DEBUG_LINE_NO:109
      TargetPlanetLocation.RefillAlias() ; #DEBUG_LINE_NO:110
      finderQuest.Stop() ; #DEBUG_LINE_NO:111
    EndIf ; #DEBUG_LINE_NO:
    If foundValidDestination ; #DEBUG_LINE_NO:116
      Parent.OnQuestStarted() ; #DEBUG_LINE_NO:117
    Else ; #DEBUG_LINE_NO:
      Self.Stop() ; #DEBUG_LINE_NO:121
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:126
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:132
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:136
EndFunction

Function CheckForCargoUnloading()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:141
  Location currentShipLocation = PlayerShipRef.GetCurrentLocation() ; #DEBUG_LINE_NO:142
  If PlayerAcceptedQuest as Bool && PlayerFailedQuest == False ; #DEBUG_LINE_NO:146
    If currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior) ; #DEBUG_LINE_NO:147
      Self.MissionComplete() ; #DEBUG_LINE_NO:148
    Else ; #DEBUG_LINE_NO:
      ObjectReference destinationMarkerRef = DestinationCargo.GetRef() ; #DEBUG_LINE_NO:153
      If PlayerShipRef.GetDistance(destinationMarkerRef) < DestinationCheckDistance ; #DEBUG_LINE_NO:154
        Self.MissionComplete() ; #DEBUG_LINE_NO:157
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return PrimaryRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:166
EndFunction

Function HandleOnMissionAccepted()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:173
  If PlayerShipRef ; #DEBUG_LINE_NO:174
    missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:176
    If cargoContainerRef ; #DEBUG_LINE_NO:180
      Self.UpdatePlayerCargoSpace() ; #DEBUG_LINE_NO:181
      If hasCargoSpace ; #DEBUG_LINE_NO:182
        If Contraband && hasShieldedCargoSpace == False ; #DEBUG_LINE_NO:183
          If MissionBoardContrabandWarningAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:185
            Self.MissionAccepted(True) ; #DEBUG_LINE_NO:186
          Else ; #DEBUG_LINE_NO:
            Self.MissionAccepted(False) ; #DEBUG_LINE_NO:188
          EndIf ; #DEBUG_LINE_NO:
        ElseIf MissionParent.MissionBoardAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:193
          Self.MissionAccepted(True) ; #DEBUG_LINE_NO:194
        Else ; #DEBUG_LINE_NO:
          Self.MissionAccepted(False) ; #DEBUG_LINE_NO:196
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If hasCargoSpace == False ; #DEBUG_LINE_NO:208
    MissionBoardCargoNoSpaceMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:216
  If bAccepted ; #DEBUG_LINE_NO:217
    spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:218
    If PlayerShipRef ; #DEBUG_LINE_NO:219
      missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:220
      If cargoContainerRef ; #DEBUG_LINE_NO:221
        PlayerShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, CargoCollection as Alias, CargoItems, True) ; #DEBUG_LINE_NO:223
      EndIf ; #DEBUG_LINE_NO:
      If Contraband && SQ_Parent as Bool ; #DEBUG_LINE_NO:227
        Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated") ; #DEBUG_LINE_NO:228
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    MissionParent.UpdateMissions() ; #DEBUG_LINE_NO:232
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionComplete()
  Self.UnloadCargo() ; #DEBUG_LINE_NO:237
  Parent.MissionComplete() ; #DEBUG_LINE_NO:238
EndFunction

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:243
  Float rewardBase = RewardAmountGlobal.GetValue() ; #DEBUG_LINE_NO:244
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight() ; #DEBUG_LINE_NO:248
  CargoItems = Utility.RandomInt(cargoContainerRef.CargoWeightMultMin, cargoContainerRef.CargoWeightMultMax) ; #DEBUG_LINE_NO:250
  Float cargoWeight = cargoWeightBase * CargoItems as Float ; #DEBUG_LINE_NO:251
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:255
  If PlayerShipRef ; #DEBUG_LINE_NO:256
    Float cargoSpaceMax = PlayerShipRef.GetShipMaxCargoWeight() - PlayerShipRef.GetWeightInContainer() ; #DEBUG_LINE_NO:257
    If cargoSpaceMax < cargoWeight ; #DEBUG_LINE_NO:259
      Int minWeight = cargoContainerRef.CargoWeightMultMin * cargoWeightBase as Int ; #DEBUG_LINE_NO:260
      If minWeight as Float < cargoSpaceMax ; #DEBUG_LINE_NO:262
        Int maxCount = (cargoSpaceMax / cargoWeightBase) as Int ; #DEBUG_LINE_NO:264
        CargoItems = Utility.RandomInt(cargoContainerRef.CargoWeightMultMin, maxCount) ; #DEBUG_LINE_NO:265
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  cargoWeight = cargoWeightBase * CargoItems as Float ; #DEBUG_LINE_NO:270
  MissionIntValue01.SetValue((cargoWeight as Int) as Float) ; #DEBUG_LINE_NO:273
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float ; #DEBUG_LINE_NO:276
  ActorValue rewardMultAV = MissionParent.MissionRewardMultiplier ; #DEBUG_LINE_NO:279
  Float valueMult = MissionBoardCargoValueMult.GetValue() ; #DEBUG_LINE_NO:281
  Float sourceMult = 1.0 + PrimaryRef.GetRef().GetValue(rewardMultAV) ; #DEBUG_LINE_NO:282
  Float destMult = 1.0 + DestinationCargo.GetRef().GetValue(rewardMultAV) ; #DEBUG_LINE_NO:283
  Float reward = rewardBase + cargoValue * valueMult * sourceMult * destMult ; #DEBUG_LINE_NO:288
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01) ; #DEBUG_LINE_NO:290
  Return reward as Int ; #DEBUG_LINE_NO:291
EndFunction

Function MissionFailed()
  If PlayerCompletedQuest == False ; #DEBUG_LINE_NO:297
    Self.UnloadCargo() ; #DEBUG_LINE_NO:299
    Parent.MissionFailed() ; #DEBUG_LINE_NO:300
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UnloadCargo()
  Self.UnregisterForRemoteEvent(CargoCollection as ScriptObject, "OnContainerChanged") ; #DEBUG_LINE_NO:307
  ObjectReference PlayerShipRef = PlayerShip.GetRef() ; #DEBUG_LINE_NO:309
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:310
  Int I = CargoCollection.GetCount() - 1 ; #DEBUG_LINE_NO:314
  While I > -1 ; #DEBUG_LINE_NO:315
    ObjectReference cargoRef = CargoCollection.GetAt(I) ; #DEBUG_LINE_NO:316
    PlayerShipRef.RemoveItem(cargoRef as Form, 1, False, None) ; #DEBUG_LINE_NO:318
    I += -1 ; #DEBUG_LINE_NO:320
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestTimerEnd(Int aiReason)
  If aiReason == 0 ; #DEBUG_LINE_NO:331
    Self.MissionFailed() ; #DEBUG_LINE_NO:332
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_ContrabandConfiscated(sq_parentscript akSource, Var[] akArgs)
  Self.MissionFailed() ; #DEBUG_LINE_NO:342
EndEvent

Function testShipCargoSpace()
  ObjectReference PlayerShipRef = PlayerShip.GetRef() ; #DEBUG_LINE_NO:346
  Self.TestWeightInContainer(PlayerShipRef) ; #DEBUG_LINE_NO:347
EndFunction

Function TestWeightInContainer(ObjectReference testRef)
  spaceshipreference ShipRef = testRef as spaceshipreference ; #DEBUG_LINE_NO:351
  If ShipRef ; #DEBUG_LINE_NO:352
    Float shipcarryweight = ShipRef.GetWeightInContainer() ; #DEBUG_LINE_NO:353
    Float shipweight = testRef.GetWeightInContainer() ; #DEBUG_LINE_NO:354
  EndIf ; #DEBUG_LINE_NO:
EndFunction
