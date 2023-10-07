ScriptName MissionPiracyQuestScript Extends MissionCargoParentScript conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group PiracyMissionData
  sq_parentscript Property SQ_Parent Auto Const mandatory
  ReferenceAlias Property CargoTargetRef Auto Const mandatory
  { alias holding cargo marker ref - used for text replacement and getting cargo data }
  RefCollectionAlias Property CargoCollection Auto Const mandatory
  { alias holding cargo items }
  Int Property CargoWeightMultMin = 3 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoWeightMultMax = 20 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Message Property MissionBoardPiracyWarningAcceptMessage Auto Const mandatory
  { if you don't have space on your ship for this cargo }
  Int Property PlayerHasPiratedStage = 35 Auto
  { if this stage is done, the player has pirated/attacked the target ship }
  Int Property PlayerHasCargoStage = 40 Auto
  { if this stage is done, the player has the cargo }
  Keyword Property ObjectTypeMissionCargo Auto Const mandatory
  { keyword for what to watch for being removed from target ship }
  GlobalVariable Property MissionBoardPiracy_EscortChance Auto Const mandatory
  { percent chance that escorts appear on this mission }
  RefCollectionAlias Property Escorts Auto Const
  { optional - holds escorts to randomly enable }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnMissionAccepted()
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:47
  If PlayerShipRef ; #DEBUG_LINE_NO:48
    missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:50
    If cargoContainerRef ; #DEBUG_LINE_NO:54
      Self.UpdatePlayerCargoSpace() ; #DEBUG_LINE_NO:55
      If hasCargoSpace == False ; #DEBUG_LINE_NO:56
        If MissionBoardPiracyWarningAcceptMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) == 0 ; #DEBUG_LINE_NO:58
          Self.MissionAccepted(True) ; #DEBUG_LINE_NO:59
        Else ; #DEBUG_LINE_NO:
          Self.MissionAccepted(False) ; #DEBUG_LINE_NO:61
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Parent.HandleOnMissionAccepted() ; #DEBUG_LINE_NO:65
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionAccepted(Bool bAccepted)
  Parent.MissionAccepted(bAccepted) ; #DEBUG_LINE_NO:78
  If bAccepted ; #DEBUG_LINE_NO:80
    spaceshipreference cargoShipRef = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:82
    Int I = 0 ; #DEBUG_LINE_NO:84
    While I < CargoCollection.GetCount() ; #DEBUG_LINE_NO:85
      ObjectReference cargoRef = CargoCollection.GetAt(I) ; #DEBUG_LINE_NO:86
      cargoShipRef.AddItem(cargoRef as Form, 1, False) ; #DEBUG_LINE_NO:87
      I += 1 ; #DEBUG_LINE_NO:88
    EndWhile ; #DEBUG_LINE_NO:
    cargoShipRef.RemoveItem(Self.GetCargoContainer() as Form, 1, False, None) ; #DEBUG_LINE_NO:90
    Self.RegisterForRemoteEvent(PrimaryRef as ScriptObject, "OnItemRemoved") ; #DEBUG_LINE_NO:92
    Self.AddInventoryEventFilter(ObjectTypeMissionCargo as Form) ; #DEBUG_LINE_NO:93
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_PiracyEvent") ; #DEBUG_LINE_NO:96
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:99
    Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnHomeShipSet") ; #DEBUG_LINE_NO:100
    If Game.GetDieRollSuccess(MissionBoardPiracy_EscortChance.GetValueInt(), 1, 100, -1, -1) ; #DEBUG_LINE_NO:103
      If Escorts as Bool && Escorts.GetCount() > 0 ; #DEBUG_LINE_NO:104
        Int numToEnable = Utility.RandomInt(1, Escorts.GetCount()) ; #DEBUG_LINE_NO:106
        If numToEnable > 0 ; #DEBUG_LINE_NO:108
          I = 0 ; #DEBUG_LINE_NO:109
          While I < numToEnable ; #DEBUG_LINE_NO:110
            spaceshipreference escortRef = Escorts.GetShipAt(I) ; #DEBUG_LINE_NO:111
            If escortRef ; #DEBUG_LINE_NO:112
              escortRef.Enable(False) ; #DEBUG_LINE_NO:113
            EndIf ; #DEBUG_LINE_NO:
            I += 1 ; #DEBUG_LINE_NO:115
          EndWhile ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:126
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:131
EndFunction

Function CheckForCargoUnloading()
  Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation() ; #DEBUG_LINE_NO:136
  If (PlayerAcceptedQuest as Bool && PlayerFailedQuest == False) && Self.GetStageDone(PlayerHasCargoStage) && (currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(TargetLocation.GetLocation(), LocTypeStarstationExterior)) ; #DEBUG_LINE_NO:140
    Self.MissionComplete() ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionComplete()
  ObjectReference PlayerShipRef = PlayerShip.GetRef() ; #DEBUG_LINE_NO:146
  Self.RemoveCargo() ; #DEBUG_LINE_NO:148
  Parent.MissionComplete() ; #DEBUG_LINE_NO:149
EndFunction

Function MissionFailed()
  Self.RemoveCargo() ; #DEBUG_LINE_NO:153
  Parent.MissionFailed() ; #DEBUG_LINE_NO:154
EndFunction

Function RemoveCargo()
  Int I = CargoCollection.GetCount() - 1 ; #DEBUG_LINE_NO:159
  While I > -1 ; #DEBUG_LINE_NO:160
    ObjectReference cargoRef = CargoCollection.GetAt(I) ; #DEBUG_LINE_NO:161
    ObjectReference cargoContainerRef = cargoRef.GetContainer() ; #DEBUG_LINE_NO:162
    CargoCollection.RemoveRef(cargoRef) ; #DEBUG_LINE_NO:164
    cargoContainerRef.RemoveItem(cargoRef as Form, 1, False, None) ; #DEBUG_LINE_NO:165
    I += -1 ; #DEBUG_LINE_NO:166
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

missionboardcargocontainerscript Function GetCargoContainer()
  Return CargoTargetRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:172
EndFunction

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:177
  spaceshipreference cargoShipRef = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:178
  Float rewardBase = RewardAmountGlobal.GetValue() ; #DEBUG_LINE_NO:180
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight() ; #DEBUG_LINE_NO:184
  CargoItems = Utility.RandomInt(CargoWeightMultMin, CargoWeightMultMax) ; #DEBUG_LINE_NO:186
  Float cargoWeight = cargoWeightBase * CargoItems as Float ; #DEBUG_LINE_NO:187
  spaceshipreference PlayerShipRef = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:191
  If PlayerShipRef ; #DEBUG_LINE_NO:192
    Float cargoSpaceMax = PlayerShipRef.GetValue(MissionParent.CarryWeight) - PlayerShipRef.GetWeightInContainer() ; #DEBUG_LINE_NO:193
    If cargoSpaceMax < cargoWeight ; #DEBUG_LINE_NO:195
      Int minWeight = CargoWeightMultMin * cargoWeightBase as Int ; #DEBUG_LINE_NO:196
      Int maxCount = (cargoSpaceMax / cargoWeightBase) as Int ; #DEBUG_LINE_NO:199
      maxCount = Math.Max(maxCount as Float, CargoWeightMultMin as Float) as Int ; #DEBUG_LINE_NO:200
      CargoItems = Utility.RandomInt(CargoWeightMultMin, maxCount) ; #DEBUG_LINE_NO:202
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  cargoWeight = cargoWeightBase * CargoItems as Float ; #DEBUG_LINE_NO:206
  Self.InitializeCargo() ; #DEBUG_LINE_NO:210
  MissionIntValue01.SetValue((cargoWeight as Int) as Float) ; #DEBUG_LINE_NO:212
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float ; #DEBUG_LINE_NO:215
  Float valueMult = MissionBoardCargoValueMult.GetValue() ; #DEBUG_LINE_NO:216
  Float cargoValueReward = cargoValue * valueMult ; #DEBUG_LINE_NO:217
  Float reward = rewardBase + cargoValueReward ; #DEBUG_LINE_NO:220
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01) ; #DEBUG_LINE_NO:222
  Return reward as Int ; #DEBUG_LINE_NO:223
EndFunction

Function InitializeCargo()
  missionboardcargocontainerscript cargoContainerRef = Self.GetCargoContainer() ; #DEBUG_LINE_NO:229
  spaceshipreference cargoShipRef = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:230
  If cargoContainerRef as Bool && cargoShipRef as Bool ; #DEBUG_LINE_NO:234
    cargoShipRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, CargoCollection as Alias, CargoItems, True) ; #DEBUG_LINE_NO:236
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:240
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ReferenceAlias.OnItemRemoved(ReferenceAlias akSender, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  If akSender == PrimaryRef ; #DEBUG_LINE_NO:246
    spaceshipreference cargoShipRef = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:247
    If cargoShipRef.GetItemCount(ObjectTypeMissionCargo as Form) == 0 ; #DEBUG_LINE_NO:248
      Self.SetStage(PlayerHasCargoStage) ; #DEBUG_LINE_NO:249
      Self.RemoveAllInventoryEventFilters() ; #DEBUG_LINE_NO:250
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_PiracyEvent(sq_parentscript akSource, Var[] akArgs)
  spaceshipreference piratedShip = akArgs[0] as spaceshipreference ; #DEBUG_LINE_NO:256
  spaceshipreference targetShip = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:257
  If piratedShip == targetShip && PlayerFailedQuest == False ; #DEBUG_LINE_NO:260
    Self.SetStage(PlayerHasPiratedStage) ; #DEBUG_LINE_NO:262
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnHomeShipSet(Actor akSource, spaceshipreference akShip, spaceshipreference akPrevious)
  spaceshipreference targetShip = PrimaryRef.GetShipRef() ; #DEBUG_LINE_NO:268
  If akShip == targetShip ; #DEBUG_LINE_NO:269
    Self.SetStage(PlayerHasCargoStage) ; #DEBUG_LINE_NO:271
    Self.RemoveAllInventoryEventFilters() ; #DEBUG_LINE_NO:272
  EndIf ; #DEBUG_LINE_NO:
EndEvent
