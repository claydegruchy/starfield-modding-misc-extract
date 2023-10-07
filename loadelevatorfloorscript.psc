ScriptName LoadElevatorFloorScript Extends ObjectReference

;-- Structs -----------------------------------------
Struct LoadElevatorFloorSetupData
  Int floorIndex
  loadelevatormanagerscript managerScript
  Message buttonActivationMessage
EndStruct


;-- Variables ---------------------------------------
ObjectReference[] allTriggers
ObjectReference[] cosmeticEntranceDoors
Int doorControlTimerID = 0 Const
Bool isFloorOperational = True
Int lockLevelInaccessible = 254 Const
Int lockLevelUnlocked = 0 Const
ObjectReference[] occupancyTriggers
ObjectReference[] proximityTriggers

;-- Properties --------------------------------------
Group NoTouch collapsedonref
{ These properties should only be set in the base form. }
  Keyword Property ProximityTriggerKeyword Auto Const mandatory
  Keyword Property OccupancyTriggerKeyword Auto Const mandatory
  Keyword Property LobbyDoorKeyword Auto Const mandatory
  Keyword Property CosmeticEntranceDoorKeyord Auto Const mandatory
  Keyword Property FloorRequestTargetKeyword Auto Const mandatory
  Keyword Property LoadElevatorManagerKeyword Auto Const mandatory
  GlobalVariable Property DoorControlTimerSeconds Auto Const mandatory
  GlobalVariable Property ArrivalSequenceWaitSeconds Auto Const mandatory
EndGroup

Group Customization
{ Set these properties to customize how your elevator floor behaves. }
  wwiseevent Property OBJ_Elevator_Generic_02_Arrive_WEF Auto Const
  { The sound that players when the player arrives on this floor. }
  wwiseevent Property OBJ_Elevator_Generic_02_Arrive_Chime_WEF Auto Const
  { The sound that players when non-player Actors arrive on this floor. }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference managerDoor = Self.GetManagerDoor() ; #DEBUG_LINE_NO:50
  If managerDoor == None ; #DEBUG_LINE_NO:52
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  loadelevatorfloorscript:loadelevatorfloorsetupdata setupData = Self.GetLoadElevatorFloorSetupDataRecursive(Self as ObjectReference, 0) ; #DEBUG_LINE_NO:57
  If setupData == None ; #DEBUG_LINE_NO:59
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100) ; #DEBUG_LINE_NO:64
  Int I = 0 ; #DEBUG_LINE_NO:66
  While I < elevatorButtons.Length ; #DEBUG_LINE_NO:67
    loadelevatorrequestflooronactivate elevatorButton = elevatorButtons[I] as loadelevatorrequestflooronactivate ; #DEBUG_LINE_NO:68
    elevatorButton.AssignLoadElevatorData(setupData.floorIndex, setupData.managerScript) ; #DEBUG_LINE_NO:69
    elevatorButton.AssignButtonName(setupData.buttonActivationMessage) ; #DEBUG_LINE_NO:70
    I += 1 ; #DEBUG_LINE_NO:72
  EndWhile ; #DEBUG_LINE_NO:
  cosmeticEntranceDoors = Self.GetRefsLinkedToMe(CosmeticEntranceDoorKeyord, None) ; #DEBUG_LINE_NO:76
  proximityTriggers = Self.GetRefsLinkedToMe(ProximityTriggerKeyword, None) ; #DEBUG_LINE_NO:79
  occupancyTriggers = Self.GetRefsLinkedToMe(OccupancyTriggerKeyword, None) ; #DEBUG_LINE_NO:80
  allTriggers = new ObjectReference[proximityTriggers.Length + occupancyTriggers.Length] ; #DEBUG_LINE_NO:81
  Int iTrigger = 0 ; #DEBUG_LINE_NO:83
  I = 0 ; #DEBUG_LINE_NO:84
  While I < proximityTriggers.Length ; #DEBUG_LINE_NO:85
    allTriggers[iTrigger] = proximityTriggers[I] ; #DEBUG_LINE_NO:86
    iTrigger += 1 ; #DEBUG_LINE_NO:87
    I += 1 ; #DEBUG_LINE_NO:88
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:91
  While I < occupancyTriggers.Length ; #DEBUG_LINE_NO:92
    allTriggers[iTrigger] = occupancyTriggers[I] ; #DEBUG_LINE_NO:93
    iTrigger += 1 ; #DEBUG_LINE_NO:94
    I += 1 ; #DEBUG_LINE_NO:95
  EndWhile ; #DEBUG_LINE_NO:
  If setupData.managerScript.GetElevatorOperational() ; #DEBUG_LINE_NO:98
    Self.RegisterTriggerEvents(allTriggers) ; #DEBUG_LINE_NO:99
  Else ; #DEBUG_LINE_NO:
    managerDoor.Disable(False) ; #DEBUG_LINE_NO:101
    Self.BlockElevatorButtonActivation(True, True) ; #DEBUG_LINE_NO:102
    isFloorOperational = False ; #DEBUG_LINE_NO:103
    Self.RegisterTriggerEvents(occupancyTriggers) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] triggers = None ; #DEBUG_LINE_NO:109
  If isFloorOperational ; #DEBUG_LINE_NO:113
    triggers = allTriggers ; #DEBUG_LINE_NO:114
  Else ; #DEBUG_LINE_NO:
    triggers = occupancyTriggers ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
  Bool triggersAreOccupied = Self.AreTriggersOccupied(triggers) ; #DEBUG_LINE_NO:120
  If triggersAreOccupied ; #DEBUG_LINE_NO:122
    Self.GotoState("DoorsAreOpenState") ; #DEBUG_LINE_NO:124
    Self.SetAllDoorsOpen(True) ; #DEBUG_LINE_NO:125
    Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID) ; #DEBUG_LINE_NO:126
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterTriggerEvents(allTriggers) ; #DEBUG_LINE_NO:131
  cosmeticEntranceDoors.clear() ; #DEBUG_LINE_NO:133
  proximityTriggers.clear() ; #DEBUG_LINE_NO:134
  occupancyTriggers.clear() ; #DEBUG_LINE_NO:135
  allTriggers.clear() ; #DEBUG_LINE_NO:136
EndEvent

Function SetElevatorButtonName(Message buttonName)
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100) ; #DEBUG_LINE_NO:141
  Int I = 0 ; #DEBUG_LINE_NO:143
  While I < elevatorButtons.Length ; #DEBUG_LINE_NO:144
    loadelevatorrequestflooronactivate elevatorButton = elevatorButtons[I] as loadelevatorrequestflooronactivate ; #DEBUG_LINE_NO:145
    elevatorButton.AssignButtonName(buttonName) ; #DEBUG_LINE_NO:146
    I += 1 ; #DEBUG_LINE_NO:148
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsAccessible()
  Return Self.GetManagerDoor().GetLockLevel() != lockLevelInaccessible ; #DEBUG_LINE_NO:155
EndFunction

Function SetAccessible(Bool accessible)
  ObjectReference managerDoor = Self.GetManagerDoor() ; #DEBUG_LINE_NO:160
  If accessible ; #DEBUG_LINE_NO:162
    managerDoor.SetLockLevel(lockLevelUnlocked) ; #DEBUG_LINE_NO:163
    managerDoor.Unlock(False) ; #DEBUG_LINE_NO:164
  Else ; #DEBUG_LINE_NO:
    managerDoor.SetLockLevel(lockLevelInaccessible) ; #DEBUG_LINE_NO:166
    managerDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function PlayArrivalSound(Bool isPlayer)
  If isPlayer ; #DEBUG_LINE_NO:174
    If OBJ_Elevator_Generic_02_Arrive_WEF != None ; #DEBUG_LINE_NO:176
      OBJ_Elevator_Generic_02_Arrive_WEF.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:177
    EndIf ; #DEBUG_LINE_NO:
  ElseIf OBJ_Elevator_Generic_02_Arrive_Chime_WEF != None ; #DEBUG_LINE_NO:183
    OBJ_Elevator_Generic_02_Arrive_Chime_WEF.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:184
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
  Self.GotoState("DoorsAreOpenState") ; #DEBUG_LINE_NO:200
  If occupancyTriggers.find(akSender, 0) >= 0 ; #DEBUG_LINE_NO:203
    Bool isPlayer = akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:204
    If isPlayer ; #DEBUG_LINE_NO:206
      Utility.Wait(ArrivalSequenceWaitSeconds.GetValue()) ; #DEBUG_LINE_NO:209
    EndIf ; #DEBUG_LINE_NO:
    Self.PlayArrivalSound(isPlayer) ; #DEBUG_LINE_NO:212
  EndIf ; #DEBUG_LINE_NO:
  Self.SetAllDoorsOpen(True) ; #DEBUG_LINE_NO:216
  Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID) ; #DEBUG_LINE_NO:219
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == doorControlTimerID ; #DEBUG_LINE_NO:233
    ObjectReference[] triggers = None ; #DEBUG_LINE_NO:235
    If isFloorOperational ; #DEBUG_LINE_NO:237
      triggers = allTriggers ; #DEBUG_LINE_NO:238
    Else ; #DEBUG_LINE_NO:
      triggers = occupancyTriggers ; #DEBUG_LINE_NO:240
    EndIf ; #DEBUG_LINE_NO:
    Bool triggersAreOccupied = Self.AreTriggersOccupied(triggers) ; #DEBUG_LINE_NO:243
    If triggersAreOccupied ; #DEBUG_LINE_NO:245
      Self.StartTimer(DoorControlTimerSeconds.GetValue(), doorControlTimerID) ; #DEBUG_LINE_NO:247
    Else ; #DEBUG_LINE_NO:
      Self.SetAllDoorsOpen(False) ; #DEBUG_LINE_NO:250
      Self.GotoState("") ; #DEBUG_LINE_NO:253
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function AreTriggersOccupied(ObjectReference[] triggers)
  Int I = 0 ; #DEBUG_LINE_NO:260
  While I < triggers.Length ; #DEBUG_LINE_NO:261
    If triggers[I].GetTriggerObjectCount() > 0 ; #DEBUG_LINE_NO:262
      Return True ; #DEBUG_LINE_NO:263
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:266
  EndWhile ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:269
EndFunction

Function SetAllDoorsOpen(Bool setOpen)
  Int iDoor = 0 ; #DEBUG_LINE_NO:274
  While iDoor < cosmeticEntranceDoors.Length ; #DEBUG_LINE_NO:275
    ObjectReference cosmeticEntranceDoor = cosmeticEntranceDoors[iDoor] ; #DEBUG_LINE_NO:277
    Int openState = cosmeticEntranceDoor.GetOpenState() ; #DEBUG_LINE_NO:278
    If setOpen ; #DEBUG_LINE_NO:280
      If openState == 3 || openState == 4 ; #DEBUG_LINE_NO:281
        cosmeticEntranceDoor.setOpen(True) ; #DEBUG_LINE_NO:282
      EndIf ; #DEBUG_LINE_NO:
    ElseIf openState == 1 || openState == 2 ; #DEBUG_LINE_NO:285
      cosmeticEntranceDoor.setOpen(False) ; #DEBUG_LINE_NO:286
    EndIf ; #DEBUG_LINE_NO:
    iDoor += 1 ; #DEBUG_LINE_NO:290
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function SetElevatorFloorOperational(Bool operational)
  ObjectReference managerDoor = Self.GetManagerDoor() ; #DEBUG_LINE_NO:301
  If operational ; #DEBUG_LINE_NO:303
    managerDoor.Enable(False) ; #DEBUG_LINE_NO:304
    Self.RegisterTriggerEvents(proximityTriggers) ; #DEBUG_LINE_NO:306
    Self.BlockElevatorButtonActivation(False, False) ; #DEBUG_LINE_NO:309
  Else ; #DEBUG_LINE_NO:
    managerDoor.Disable(False) ; #DEBUG_LINE_NO:311
    Self.UnregisterTriggerEvents(proximityTriggers) ; #DEBUG_LINE_NO:313
    Self.BlockElevatorButtonActivation(True, True) ; #DEBUG_LINE_NO:316
  EndIf ; #DEBUG_LINE_NO:
  isFloorOperational = operational ; #DEBUG_LINE_NO:319
EndFunction

Bool Function isFloorOperational()
  Return isFloorOperational ; #DEBUG_LINE_NO:323
EndFunction

Function BlockElevatorButtonActivation(Bool blockActivation, Bool blockActivationText)
  ObjectReference[] elevatorButtons = Self.GetLinkedRefChain(FloorRequestTargetKeyword, 100) ; #DEBUG_LINE_NO:328
  Int I = 0 ; #DEBUG_LINE_NO:330
  While I < elevatorButtons.Length ; #DEBUG_LINE_NO:331
    elevatorButtons[I].blockActivation(blockActivation, blockActivationText) ; #DEBUG_LINE_NO:332
    I += 1 ; #DEBUG_LINE_NO:334
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function RegisterTriggerEvents(ObjectReference[] triggers)
  Int I = 0 ; #DEBUG_LINE_NO:340
  While I < triggers.Length ; #DEBUG_LINE_NO:341
    ObjectReference trigger = triggers[I] ; #DEBUG_LINE_NO:342
    Self.RegisterForRemoteEvent(trigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:343
    I += 1 ; #DEBUG_LINE_NO:344
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UnregisterTriggerEvents(ObjectReference[] triggers)
  Int I = 0 ; #DEBUG_LINE_NO:350
  While I < triggers.Length ; #DEBUG_LINE_NO:351
    ObjectReference trigger = triggers[I] ; #DEBUG_LINE_NO:352
    Self.UnregisterForRemoteEvent(trigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:353
    I += 1 ; #DEBUG_LINE_NO:354
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

ObjectReference Function GetManagerDoor()
  ObjectReference managerDoor = Self.GetLinkedRef(LobbyDoorKeyword) ; #DEBUG_LINE_NO:360
  If managerDoor == None ; #DEBUG_LINE_NO:362
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return managerDoor ; #DEBUG_LINE_NO:366
EndFunction

loadelevatorfloorscript:loadelevatorfloorsetupdata Function GetLoadElevatorFloorSetupDataRecursive(ObjectReference target, Int floorIndex)
  ObjectReference[] refsLinkedToMe = target.GetRefsLinkedToMe(None, None) ; #DEBUG_LINE_NO:373
  If refsLinkedToMe.Length == 0 ; #DEBUG_LINE_NO:375
    Return None ; #DEBUG_LINE_NO:377
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference refLinkedToMe = refsLinkedToMe[0] ; #DEBUG_LINE_NO:380
  If refLinkedToMe.HasKeyword(LoadElevatorManagerKeyword) ; #DEBUG_LINE_NO:382
    loadelevatorfloorscript:loadelevatorfloorsetupdata data = new loadelevatorfloorscript:loadelevatorfloorsetupdata ; #DEBUG_LINE_NO:383
    data.floorIndex = floorIndex ; #DEBUG_LINE_NO:385
    data.managerScript = refLinkedToMe as loadelevatormanagerscript ; #DEBUG_LINE_NO:386
    data.buttonActivationMessage = data.managerScript.GetButtonMessageForFloor(floorIndex) ; #DEBUG_LINE_NO:387
    Return data ; #DEBUG_LINE_NO:389
  Else ; #DEBUG_LINE_NO:
    floorIndex += 1 ; #DEBUG_LINE_NO:391
    Return Self.GetLoadElevatorFloorSetupDataRecursive(refLinkedToMe, floorIndex) ; #DEBUG_LINE_NO:392
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State DoorsAreOpenState

  Event ObjectReference.OnTriggerEnter(ObjectReference akSender, ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
