ScriptName ElevatorMasterScript Extends ObjectReference conditional hidden
{ Script for handling elevators. Be sure to AttachRef any thing you want to move with the platform helper }

;-- Variables ---------------------------------------
Bool bBeingActivated = False
Bool bElevatorIsAtTop = False conditional
Bool bElevatorIsMoving = False conditional
Bool bHasAlreadyLoaded = False
Float fAnimRate
Int iElevatorLoopInstance

;-- Properties --------------------------------------
Group Optional_Properties
  Float Property fTimeTakenToMove = 3.0 Auto
  { The time, in seconds, it takes for the elevator to move from point A to B. }
  Bool Property bStartAtTop = True Auto
  { Default = TRUE, elevator is starting at the top }
  Bool Property bStartDeactivated = False Auto
  { Whether this elevator starts "off" or not. }
  Message Property DeactivatedMessage Auto
  { Message that shows up when any elevator button is pressed while it's deactivated. }
  Bool Property CloseInteriorDoor = True Auto
  { Inner door closes by default. Set this to FALSE to keep it from closing at all. }
EndGroup

Group No_Touchy collapsedonref
  Keyword Property Elevator_PlatformHelper Auto mandatory
  Keyword Property Elevator_InteriorButton Auto mandatory
  Keyword Property Elevator_BottomButton Auto mandatory
  Keyword Property Elevator_TopButton Auto mandatory
  Keyword Property Elevator_InteriorDoor Auto mandatory
  Keyword Property Elevator_BottomDoor Auto mandatory
  Keyword Property Elevator_TopDoor Auto mandatory
  Keyword Property Elevator_BottomNavCut Auto mandatory
  Keyword Property Elevator_TopNavCut Auto mandatory
  Keyword Property Elevator_DisableAfterLoad Auto mandatory
  Keyword Property Elevator_SoundMarker01 Auto mandatory
  { SoundMarker that enables when elevator moves and disables when elevator stops }
EndGroup


;-- Functions ---------------------------------------

Function MoveElevatorMeterHandler(ObjectReference Meter1, ObjectReference Meter2)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnInit()
  fAnimRate = 1.0 / fTimeTakenToMove ; #DEBUG_LINE_NO:98
EndEvent

Event OnCellLoad()
  Self.ElevatorSetupFunction() ; #DEBUG_LINE_NO:104
EndEvent

Event OnUnload()
  Self.UnregisterForDistanceEvents(Self as ScriptObject, Game.GetPlayer() as ScriptObject, -1) ; #DEBUG_LINE_NO:110
EndEvent

Function ElevatorSetupFunction()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper) ; #DEBUG_LINE_NO:117
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton) ; #DEBUG_LINE_NO:118
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton) ; #DEBUG_LINE_NO:119
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor) ; #DEBUG_LINE_NO:120
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor) ; #DEBUG_LINE_NO:121
  ObjectReference DisableAfterLoad = Self.GetLinkedRef(Elevator_DisableAfterLoad) ; #DEBUG_LINE_NO:122
  Self.GoToState("AlreadyLoaded") ; #DEBUG_LINE_NO:124
  Self.RegisterForRemoteEvent(Self.GetLinkedRef(Elevator_InteriorButton) as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:125
  If CallButtonTop ; #DEBUG_LINE_NO:130
    Self.RegisterForRemoteEvent(CallButtonTop as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
  If TopDoor ; #DEBUG_LINE_NO:135
    TopDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:136
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:138
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnOpen") ; #DEBUG_LINE_NO:139
    Self.RegisterForRemoteEvent(TopDoor as ScriptObject, "OnClose") ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
  If CallButtonBottom ; #DEBUG_LINE_NO:145
    Self.RegisterForRemoteEvent(CallButtonBottom as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:146
  EndIf ; #DEBUG_LINE_NO:
  If BottomDoor ; #DEBUG_LINE_NO:150
    BottomDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:151
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:153
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnOpen") ; #DEBUG_LINE_NO:154
    Self.RegisterForRemoteEvent(BottomDoor as ScriptObject, "OnClose") ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  If bHasAlreadyLoaded == False ; #DEBUG_LINE_NO:160
    ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor) ; #DEBUG_LINE_NO:161
    If bStartDeactivated == False ; #DEBUG_LINE_NO:165
      If CloseInteriorDoor == False ; #DEBUG_LINE_NO:171
        If InteriorDoor.Is3DLoaded() == False ; #DEBUG_LINE_NO:172
          InteriorDoor.Waitfor3dLoad() ; #DEBUG_LINE_NO:173
        EndIf ; #DEBUG_LINE_NO:
        InteriorDoor.SetOpen(True) ; #DEBUG_LINE_NO:175
      EndIf ; #DEBUG_LINE_NO:
      TopDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:178
      BottomDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:179
    EndIf ; #DEBUG_LINE_NO:
    If bStartAtTop == True ; #DEBUG_LINE_NO:192
      PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 1.0) ; #DEBUG_LINE_NO:197
      PlatformHelper.SetAnimationVariableFloat("Position", 1.0) ; #DEBUG_LINE_NO:198
      bElevatorIsAtTop = True ; #DEBUG_LINE_NO:201
      DisableAfterLoad.Disable(False) ; #DEBUG_LINE_NO:202
    Else ; #DEBUG_LINE_NO:
      If PlatformHelper.Is3DLoaded() == False ; #DEBUG_LINE_NO:208
        PlatformHelper.Waitfor3dLoad() ; #DEBUG_LINE_NO:209
      EndIf ; #DEBUG_LINE_NO:
      PlatformHelper.SetAnimationVariableFloat("CurrentPosition", 0.0) ; #DEBUG_LINE_NO:213
      PlatformHelper.SetAnimationVariableFloat("Position", 0.0) ; #DEBUG_LINE_NO:214
      bElevatorIsAtTop = False ; #DEBUG_LINE_NO:217
    EndIf ; #DEBUG_LINE_NO:
    bHasAlreadyLoaded = True ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetElevator()
  bHasAlreadyLoaded = False ; #DEBUG_LINE_NO:228
  Self.ElevatorSetupFunction() ; #DEBUG_LINE_NO:229
EndFunction

Function MakeElevatorFunctional()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper) ; #DEBUG_LINE_NO:236
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton) ; #DEBUG_LINE_NO:237
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton) ; #DEBUG_LINE_NO:238
  bStartDeactivated = False ; #DEBUG_LINE_NO:244
  bHasAlreadyLoaded = True ; #DEBUG_LINE_NO:259
  PlatformHelper.SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:260
EndFunction

Function MakeElevatorNonFunctional()
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper) ; #DEBUG_LINE_NO:268
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton) ; #DEBUG_LINE_NO:269
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton) ; #DEBUG_LINE_NO:270
  bStartDeactivated = True ; #DEBUG_LINE_NO:276
  bHasAlreadyLoaded = True ; #DEBUG_LINE_NO:291
  PlatformHelper.SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:292
EndFunction

Event ObjectReference.OnOpen(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor) ; #DEBUG_LINE_NO:299
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor) ; #DEBUG_LINE_NO:300
  If akSender == TopDoor ; #DEBUG_LINE_NO:302
    TopDoor.BlockActivation(True, True) ; #DEBUG_LINE_NO:303
  EndIf ; #DEBUG_LINE_NO:
  If akSender == BottomDoor ; #DEBUG_LINE_NO:306
    BottomDoor.BlockActivation(True, True) ; #DEBUG_LINE_NO:307
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor) ; #DEBUG_LINE_NO:314
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor) ; #DEBUG_LINE_NO:315
  If akSender == TopDoor ; #DEBUG_LINE_NO:317
    TopDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:318
  EndIf ; #DEBUG_LINE_NO:
  If akSender == BottomDoor ; #DEBUG_LINE_NO:321
    BottomDoor.BlockActivation(True, False) ; #DEBUG_LINE_NO:322
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:331
    Self.GoToState("Busy") ; #DEBUG_LINE_NO:332
    ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton) ; #DEBUG_LINE_NO:333
    ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton) ; #DEBUG_LINE_NO:334
    ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor) ; #DEBUG_LINE_NO:335
    ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor) ; #DEBUG_LINE_NO:336
    ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor) ; #DEBUG_LINE_NO:337
    ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton) ; #DEBUG_LINE_NO:338
    Bool bIgnoreDoorActivation = False ; #DEBUG_LINE_NO:342
    If akSender == TopDoor && Math.ABS(TopDoor.GetHeadingAngle(Game.GetPlayer() as ObjectReference)) < 90.0 ; #DEBUG_LINE_NO:345
      bIgnoreDoorActivation = True ; #DEBUG_LINE_NO:346
      TopDoor.SetOpen(True) ; #DEBUG_LINE_NO:347
    EndIf ; #DEBUG_LINE_NO:
    If akSender == BottomDoor && Math.ABS(BottomDoor.GetHeadingAngle(Game.GetPlayer() as ObjectReference)) < 90.0 ; #DEBUG_LINE_NO:350
      bIgnoreDoorActivation = True ; #DEBUG_LINE_NO:351
      BottomDoor.SetOpen(True) ; #DEBUG_LINE_NO:352
    EndIf ; #DEBUG_LINE_NO:
    If bStartDeactivated == False && bIgnoreDoorActivation == False ; #DEBUG_LINE_NO:355
      If bElevatorIsMoving == False && bBeingActivated == False ; #DEBUG_LINE_NO:357
        Self.BlockAllButtons(True) ; #DEBUG_LINE_NO:358
        bBeingActivated = True ; #DEBUG_LINE_NO:359
        If akSender == InteriorButton ; #DEBUG_LINE_NO:365
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate) ; #DEBUG_LINE_NO:367
          Self.HandleElevatorDoor(TopDoor, False) ; #DEBUG_LINE_NO:374
          Self.HandleElevatorDoor(BottomDoor, False) ; #DEBUG_LINE_NO:375
          Self.HandleElevatorDoor(InteriorDoor, False) ; #DEBUG_LINE_NO:376
          Utility.Wait(0.5) ; #DEBUG_LINE_NO:382
          Self.MoveElevator(True) ; #DEBUG_LINE_NO:383
        ElseIf akSender == CallButtonTop || akSender == TopDoor && bStartDeactivated == False ; #DEBUG_LINE_NO:385
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2.0) ; #DEBUG_LINE_NO:386
          If bElevatorIsAtTop == True ; #DEBUG_LINE_NO:390
            Utility.Wait(0.5) ; #DEBUG_LINE_NO:394
            Self.HandleElevatorDoor(TopDoor, True) ; #DEBUG_LINE_NO:396
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012)) ; #DEBUG_LINE_NO:397
            bBeingActivated = False ; #DEBUG_LINE_NO:405
            Self.BlockAllButtons(False) ; #DEBUG_LINE_NO:406
          Else ; #DEBUG_LINE_NO:
            Self.HandleElevatorDoor(TopDoor, False) ; #DEBUG_LINE_NO:409
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012)) ; #DEBUG_LINE_NO:410
            Self.HandleElevatorDoor(BottomDoor, False) ; #DEBUG_LINE_NO:411
            Self.HandleElevatorDoor(InteriorDoor, False) ; #DEBUG_LINE_NO:412
            Utility.Wait(0.5) ; #DEBUG_LINE_NO:418
            Self.MoveElevator(False) ; #DEBUG_LINE_NO:419
          EndIf ; #DEBUG_LINE_NO:
        ElseIf akSender == CallButtonBottom || akSender == BottomDoor && bStartDeactivated == False ; #DEBUG_LINE_NO:423
          Self.GetLinkedRef(Elevator_PlatformHelper).SetAnimationVariableFloat("Speed", fAnimRate / 2.0) ; #DEBUG_LINE_NO:424
          If bElevatorIsAtTop == False ; #DEBUG_LINE_NO:428
            Utility.Wait(0.5) ; #DEBUG_LINE_NO:432
            Self.HandleElevatorDoor(BottomDoor, True) ; #DEBUG_LINE_NO:434
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012)) ; #DEBUG_LINE_NO:435
            Self.HandleElevatorDoor(InteriorDoor, True) ; #DEBUG_LINE_NO:436
            bBeingActivated = False ; #DEBUG_LINE_NO:437
            Self.BlockAllButtons(False) ; #DEBUG_LINE_NO:438
          Else ; #DEBUG_LINE_NO:
            Self.HandleElevatorDoor(TopDoor, False) ; #DEBUG_LINE_NO:441
            Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012)) ; #DEBUG_LINE_NO:442
            Self.HandleElevatorDoor(BottomDoor, False) ; #DEBUG_LINE_NO:443
            Self.HandleElevatorDoor(InteriorDoor, False) ; #DEBUG_LINE_NO:444
            Utility.Wait(0.5) ; #DEBUG_LINE_NO:450
            Self.MoveElevator(False) ; #DEBUG_LINE_NO:451
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf bStartDeactivated == True ; #DEBUG_LINE_NO:458
      DeactivatedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:459
    EndIf ; #DEBUG_LINE_NO:
    If bIgnoreDoorActivation == True ; #DEBUG_LINE_NO:464
      bIgnoreDoorActivation = False ; #DEBUG_LINE_NO:465
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function BlockAllButtons(Bool bShouldBlock)
  ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton) ; #DEBUG_LINE_NO:475
  ObjectReference CallButtonTop = Self.GetLinkedRef(Elevator_TopButton) ; #DEBUG_LINE_NO:476
  ObjectReference CallButtonBottom = Self.GetLinkedRef(Elevator_BottomButton) ; #DEBUG_LINE_NO:477
  If bShouldBlock == True ; #DEBUG_LINE_NO:479
    InteriorButton.BlockActivation(True, False) ; #DEBUG_LINE_NO:480
    CallButtonTop.BlockActivation(True, False) ; #DEBUG_LINE_NO:486
    CallButtonBottom.BlockActivation(True, False) ; #DEBUG_LINE_NO:487
  Else ; #DEBUG_LINE_NO:
    InteriorButton.BlockActivation(False, False) ; #DEBUG_LINE_NO:489
    CallButtonTop.BlockActivation(False, False) ; #DEBUG_LINE_NO:495
    CallButtonBottom.BlockActivation(False, False) ; #DEBUG_LINE_NO:496
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function HandleElevatorDoor(ObjectReference akDoor, Bool bOpen)
  ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor) ; #DEBUG_LINE_NO:505
  If bOpen == True ; #DEBUG_LINE_NO:507
    If akDoor.GetOpenState() >= 3 ; #DEBUG_LINE_NO:509
      akDoor.SetOpen(True) ; #DEBUG_LINE_NO:511
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akDoor.GetOpenState() <= 2 ; #DEBUG_LINE_NO:517
    If akDoor == InteriorDoor && CloseInteriorDoor == False ; #DEBUG_LINE_NO:520
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      akDoor.SetOpen(False) ; #DEBUG_LINE_NO:523
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function MoveElevator(Bool bActivatedFromPanel)
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper) ; #DEBUG_LINE_NO:537
  ObjectReference TopDoor = Self.GetLinkedRef(Elevator_TopDoor) ; #DEBUG_LINE_NO:538
  ObjectReference BottomDoor = Self.GetLinkedRef(Elevator_BottomDoor) ; #DEBUG_LINE_NO:539
  ObjectReference InteriorDoor = Self.GetLinkedRef(Elevator_InteriorDoor) ; #DEBUG_LINE_NO:540
  ObjectReference InteriorButton = Self.GetLinkedRef(Elevator_InteriorButton) ; #DEBUG_LINE_NO:541
  ObjectReference ElevatorRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:542
  ObjectReference SoundMarker01 = Self.GetLinkedRef(Elevator_SoundMarker01) ; #DEBUG_LINE_NO:543
  bElevatorIsMoving = True ; #DEBUG_LINE_NO:551
  Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:566
  If bElevatorIsAtTop == True ; #DEBUG_LINE_NO:568
    PlatformHelper.SetAnimationVariableFloat("Position", 0.0) ; #DEBUG_LINE_NO:569
    Self.MoveElevatorFloorPlatHandler(0) ; #DEBUG_LINE_NO:570
  Else ; #DEBUG_LINE_NO:
    PlatformHelper.SetAnimationVariableFloat("Position", 1.0) ; #DEBUG_LINE_NO:572
    Self.MoveElevatorFloorPlatHandler(1) ; #DEBUG_LINE_NO:573
  EndIf ; #DEBUG_LINE_NO:
  If SoundMarker01 ; #DEBUG_LINE_NO:577
    SoundMarker01.enableNoWait(False) ; #DEBUG_LINE_NO:578
  EndIf ; #DEBUG_LINE_NO:
  ElevatorRef.PlayAnimation("Stage2") ; #DEBUG_LINE_NO:581
  PlatformHelper.PlayAnimationAndWait("Play01", "done") ; #DEBUG_LINE_NO:582
  ElevatorRef.PlayAnimation("Stage1") ; #DEBUG_LINE_NO:583
  If SoundMarker01 ; #DEBUG_LINE_NO:586
    SoundMarker01.disableNoWait(False) ; #DEBUG_LINE_NO:587
  EndIf ; #DEBUG_LINE_NO:
  If bElevatorIsAtTop == False ; #DEBUG_LINE_NO:617
    Self.MoveElevatorDoorHandler(BottomDoor) ; #DEBUG_LINE_NO:618
  Else ; #DEBUG_LINE_NO:
    Self.MoveElevatorDoorHandler(TopDoor) ; #DEBUG_LINE_NO:620
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(Utility.RandomFloat(0.100000001, 0.300000012)) ; #DEBUG_LINE_NO:623
  Self.MoveElevatorDoorHandler(InteriorDoor) ; #DEBUG_LINE_NO:626
  Utility.Wait(1.200000048) ; #DEBUG_LINE_NO:636
  Self.BlockAllButtons(False) ; #DEBUG_LINE_NO:637
  bBeingActivated = False ; #DEBUG_LINE_NO:638
  bElevatorIsMoving = False ; #DEBUG_LINE_NO:639
  Self.GoToState("") ; #DEBUG_LINE_NO:640
EndFunction

Function MoveElevatorFloorPlatHandler(Int PlatformHelperAnimVar)
  ObjectReference PlatformHelper = Self.GetLinkedRef(Elevator_PlatformHelper) ; #DEBUG_LINE_NO:649
  bElevatorIsAtTop = PlatformHelperAnimVar as Bool ; #DEBUG_LINE_NO:651
EndFunction

Function MoveElevatorDoorHandler(ObjectReference DoorRef)
  Self.HandleElevatorDoor(DoorRef, True) ; #DEBUG_LINE_NO:658
  Self.HandleElevatorDoor(DoorRef, True) ; #DEBUG_LINE_NO:659
EndFunction

;-- State -------------------------------------------
State AlreadyLoaded

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Busy
EndState
