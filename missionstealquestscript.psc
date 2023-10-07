ScriptName MissionStealQuestScript Extends MissionQuestScript conditional

;-- Variables ---------------------------------------
Int startupTimerID = 1 Const

;-- Properties --------------------------------------
Group StealMissionData
  ReferenceAlias Property TargetContainer Auto Const mandatory
  { alias where cargo items will be placed }
  RefCollectionAlias Property StealItemCollection Auto Const mandatory
  { alias holding cargo items }
  LocationAlias Property ReturnLocation Auto Const mandatory
  { location where items need to be delivered to }
  Int Property StealItemsStage = 50 Auto Const
  { stage set when player steals the target items }
  Int Property CargoItemCountMin = 1 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItemCountMax = 10 Auto Const
  { cargo items will be randomized between min and max }
  Int Property CargoItems = 5 Auto hidden
  { Number of cargo items created for this mission - set in GetActualReward() }
  Keyword Property LocTypeStarStation Auto Const mandatory
  { for checking for docking }
  Keyword Property LocTypeStarstationExterior Auto Const mandatory
  { keyword to check if you've docked with a starstation }
  GlobalVariable Property MissionBoardCargoValueMult Auto Const mandatory
  { multiplier on cargo value reward }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.StartTimer(0.5, startupTimerID) ; #DEBUG_LINE_NO:39
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID ; #DEBUG_LINE_NO:43
    Self.InitializeCargo() ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Int Function GetActualReward()
  missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:50
  Float rewardBase = RewardAmountGlobal.GetValue() ; #DEBUG_LINE_NO:52
  Float cargoWeightBase = cargoContainerRef.CargoMiscObject.GetWeight() ; #DEBUG_LINE_NO:56
  Float cargoWeight = cargoWeightBase * CargoItems as Float ; #DEBUG_LINE_NO:57
  MissionIntValue01.SetValue((cargoWeight as Int) as Float) ; #DEBUG_LINE_NO:60
  Float cargoValue = (cargoContainerRef.CargoMiscObject.GetGoldValue() * CargoItems) as Float ; #DEBUG_LINE_NO:63
  Float valueMult = MissionBoardCargoValueMult.GetValue() ; #DEBUG_LINE_NO:64
  Float cargoValueReward = cargoValue * valueMult ; #DEBUG_LINE_NO:65
  Float reward = rewardBase + cargoValueReward ; #DEBUG_LINE_NO:69
  Self.UpdateCurrentInstanceGlobal(MissionIntValue01) ; #DEBUG_LINE_NO:71
  Return reward as Int ; #DEBUG_LINE_NO:72
EndFunction

Function InitializeCargo()
  missionboardcargocontainerscript cargoContainerRef = PrimaryRef.GetRef() as missionboardcargocontainerscript ; #DEBUG_LINE_NO:79
  ObjectReference targetContainerRef = TargetContainer.GetRef() ; #DEBUG_LINE_NO:80
  If cargoContainerRef as Bool && targetContainerRef as Bool ; #DEBUG_LINE_NO:84
    CargoItems = Utility.RandomInt(CargoItemCountMin, CargoItemCountMax) ; #DEBUG_LINE_NO:86
    targetContainerRef.AddAliasedItem(cargoContainerRef.CargoMiscObject as Form, StealItemCollection as Alias, CargoItems, True) ; #DEBUG_LINE_NO:88
    Parent.OnQuestStarted() ; #DEBUG_LINE_NO:89
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandlePlayerShipLanding()
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:100
EndFunction

Function HandlePlayerShipDocking(spaceshipreference akParent)
  Self.CheckForCargoUnloading() ; #DEBUG_LINE_NO:105
EndFunction

Function CheckForCargoUnloading()
  If Self.GetStageDone(StealItemsStage) ; #DEBUG_LINE_NO:109
    Location currentShipLocation = PlayerShip.GetShipRef().GetCurrentLocation() ; #DEBUG_LINE_NO:111
    If (PlayerAcceptedQuest as Bool && PlayerFailedQuest == False) && (currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), None) || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarStation) || currentShipLocation.IsSameLocation(ReturnLocation.GetLocation(), LocTypeStarstationExterior)) ; #DEBUG_LINE_NO:115
      Self.MissionComplete() ; #DEBUG_LINE_NO:116
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MissionComplete()
  ObjectReference PlayerShipRef = PlayerShip.GetRef() ; #DEBUG_LINE_NO:122
  Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:123
  Int I = StealItemCollection.GetCount() - 1 ; #DEBUG_LINE_NO:125
  While I > -1 ; #DEBUG_LINE_NO:126
    ObjectReference cargoRef = StealItemCollection.GetAt(I) ; #DEBUG_LINE_NO:127
    StealItemCollection.RemoveRef(cargoRef) ; #DEBUG_LINE_NO:129
    PlayerShipRef.RemoveItem(cargoRef as Form, 1, False, None) ; #DEBUG_LINE_NO:131
    playerRef.RemoveItem(cargoRef as Form, 1, False, None) ; #DEBUG_LINE_NO:132
    I += -1 ; #DEBUG_LINE_NO:133
  EndWhile ; #DEBUG_LINE_NO:
  Parent.MissionComplete() ; #DEBUG_LINE_NO:135
EndFunction

Function MissionFailed()
  Self.RemoveCargo() ; #DEBUG_LINE_NO:139
  Parent.MissionFailed() ; #DEBUG_LINE_NO:140
EndFunction

Function RemoveCargo()
  Int I = StealItemCollection.GetCount() - 1 ; #DEBUG_LINE_NO:145
  While I > -1 ; #DEBUG_LINE_NO:146
    ObjectReference cargoRef = StealItemCollection.GetAt(I) ; #DEBUG_LINE_NO:147
    ObjectReference cargoContainerRef = cargoRef.GetContainer() ; #DEBUG_LINE_NO:148
    StealItemCollection.RemoveRef(cargoRef) ; #DEBUG_LINE_NO:150
    cargoContainerRef.RemoveItem(cargoRef as Form, 1, False, None) ; #DEBUG_LINE_NO:151
    I += -1 ; #DEBUG_LINE_NO:152
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
