ScriptName LoadElevatorManagerScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group MessageCustomization collapsedonref
{ Change these properties to affect Message Boxes seen by the player }
  Message Property ChooseFloorMessage Auto Const mandatory
  { The text displayed on elevator buttons, when more than two floors are present }
  Message Property InaccessibleFloorMessage Auto Const mandatory
  { The text displayed when a player attempts to travel to an inaccessible floor }
  Message Property LockedFloorMessage Auto Const mandatory
  { The text displayed when a player selects a locked floor }
  Message Property NotOperatingMessage Auto Const mandatory
  { The text displayed when the elevator is "off", and the Player tried to request travel to another floor }
EndGroup

Group TwoFloorElevator
{ Only set these properties if your elevator has exactly two floors. }
  Message Property FirstFloorName Auto
  Message Property SecondFloorName Auto
EndGroup

Group ThreeOrMoreFloorElevator
{ Only set these properties if your elevator has three or more floors. }
  Message Property FloorNames Auto
EndGroup

Group OperationCustomization
  Bool Property IsOperational = True Auto conditional
  { Non-operational elevators won't accept travel requests, and their doors won't open based on Actor proximity. }
EndGroup

Group AutofillProperties collapsedonref
  wwiseevent Property QST_MQ207C_Elevator_Activate_Fail_WEF Auto Const mandatory
  wwiseevent Property OBJ_Elevator_Generic_02_Depart_WEF Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SetFirstFloorName(Message newFloorName)
  FirstFloorName = newFloorName ; #DEBUG_LINE_NO:47
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:49
  If loadElevatorFloors.Length != 2 ; #DEBUG_LINE_NO:51
    Return  ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
  loadElevatorFloors[1].SetElevatorButtonName(newFloorName) ; #DEBUG_LINE_NO:56
EndFunction

Function SetSecondFloorName(Message newFloorName)
  SecondFloorName = newFloorName ; #DEBUG_LINE_NO:60
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:62
  If loadElevatorFloors.Length != 2 ; #DEBUG_LINE_NO:64
    Return  ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  loadElevatorFloors[0].SetElevatorButtonName(newFloorName) ; #DEBUG_LINE_NO:69
EndFunction

Function SetFloorNames(Message newFloorNames)
  FloorNames = newFloorNames ; #DEBUG_LINE_NO:73
EndFunction

Message Function GetButtonMessageForFloor(Int floorIndex)
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:79
  If loadElevatorFloors.Length > 2 ; #DEBUG_LINE_NO:81
    If ChooseFloorMessage == None ; #DEBUG_LINE_NO:82
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Return ChooseFloorMessage ; #DEBUG_LINE_NO:86
  ElseIf floorIndex == 0 ; #DEBUG_LINE_NO:87
    If SecondFloorName == None ; #DEBUG_LINE_NO:88
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Return SecondFloorName ; #DEBUG_LINE_NO:92
  ElseIf floorIndex == 1 ; #DEBUG_LINE_NO:93
    If FirstFloorName == None ; #DEBUG_LINE_NO:94
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Return FirstFloorName ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RequestFloorTravel(Int currentFloor, ObjectReference requester)
  Int requestedFloor = 0 ; #DEBUG_LINE_NO:104
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:106
  ObjectReference[] reversemanagerDoors = new ObjectReference[loadElevatorFloors.Length] ; #DEBUG_LINE_NO:110
  Int I = 0 ; #DEBUG_LINE_NO:112
  While I < reversemanagerDoors.Length ; #DEBUG_LINE_NO:113
    loadelevatorfloorscript loadElevator = loadElevatorFloors[I] ; #DEBUG_LINE_NO:114
    reversemanagerDoors[loadElevatorFloors.Length - I - 1] = loadElevator.GetManagerDoor() ; #DEBUG_LINE_NO:116
    I += 1 ; #DEBUG_LINE_NO:118
  EndWhile ; #DEBUG_LINE_NO:
  If loadElevatorFloors.Length > 2 ; #DEBUG_LINE_NO:121
    If FloorNames == None ; #DEBUG_LINE_NO:122
      Return  ; #DEBUG_LINE_NO:124
    EndIf ; #DEBUG_LINE_NO:
    FloorNames.AttachLoadDoors(reversemanagerDoors) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
  If loadElevatorFloors.Length > 2 ; #DEBUG_LINE_NO:131
    If FloorNames == None ; #DEBUG_LINE_NO:132
      Return  ; #DEBUG_LINE_NO:134
    EndIf ; #DEBUG_LINE_NO:
    Int floorChoice = FloorNames.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:137
    If floorChoice == -1 || floorChoice > loadElevatorFloors.Length - 1 ; #DEBUG_LINE_NO:140
      Return  ; #DEBUG_LINE_NO:141
    EndIf ; #DEBUG_LINE_NO:
    requestedFloor = loadElevatorFloors.Length - 1 - floorChoice ; #DEBUG_LINE_NO:154
  ElseIf currentFloor == 0 ; #DEBUG_LINE_NO:157
    requestedFloor = 1 ; #DEBUG_LINE_NO:158
  ElseIf currentFloor == 1 ; #DEBUG_LINE_NO:159
    requestedFloor = 0 ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
  Self.TravelToFloor(currentFloor, requestedFloor, loadElevatorFloors, requester, False) ; #DEBUG_LINE_NO:163
EndFunction

Function TravelToRandomFloor(ObjectReference requester)
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:167
  Int randomFloorIndex = Utility.RandomInt(0, loadElevatorFloors.Length - 1) ; #DEBUG_LINE_NO:169
  Self.TravelToFloor(-1, randomFloorIndex, loadElevatorFloors, requester, True) ; #DEBUG_LINE_NO:171
EndFunction

Function TravelToFloor(Int currentFloor, Int requestedFloor, loadelevatorfloorscript[] loadElevatorFloors, ObjectReference requester, Bool ignoreFloorRestrictions)
  loadelevatorfloorscript loadElevatorFloor = loadElevatorFloors[requestedFloor] ; #DEBUG_LINE_NO:175
  If requestedFloor == currentFloor ; #DEBUG_LINE_NO:178
    loadElevatorFloor.PlayArrivalSound(False) ; #DEBUG_LINE_NO:179
    Return  ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
  If !loadElevatorFloor.IsAccessible() ; #DEBUG_LINE_NO:184
    QST_MQ207C_Elevator_Activate_Fail_WEF.Play(requester, None, None) ; #DEBUG_LINE_NO:185
    InaccessibleFloorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:186
    Return  ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference managerDoor = loadElevatorFloor.GetManagerDoor() ; #DEBUG_LINE_NO:191
  If managerDoor != None ; #DEBUG_LINE_NO:193
    Key requiredKey = managerDoor.GetKey() ; #DEBUG_LINE_NO:196
    If ignoreFloorRestrictions == False && requiredKey != None && requester.GetItemCount(requiredKey as Form) == 0 ; #DEBUG_LINE_NO:198
      LockedFloorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:199
      Return  ; #DEBUG_LINE_NO:200
    EndIf ; #DEBUG_LINE_NO:
    If OBJ_Elevator_Generic_02_Depart_WEF != None ; #DEBUG_LINE_NO:204
      OBJ_Elevator_Generic_02_Depart_WEF.Play(requester, None, None) ; #DEBUG_LINE_NO:205
    EndIf ; #DEBUG_LINE_NO:
    managerDoor.Activate(requester, False) ; #DEBUG_LINE_NO:210
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetElevatorOperational(Bool operational)
  IsOperational = operational ; #DEBUG_LINE_NO:219
  loadelevatorfloorscript[] loadElevatorFloors = Self.GetLoadElevatorFloors() ; #DEBUG_LINE_NO:221
  Int I = 0 ; #DEBUG_LINE_NO:223
  While I < loadElevatorFloors.Length ; #DEBUG_LINE_NO:224
    loadelevatorfloorscript floorScript = loadElevatorFloors[I] ; #DEBUG_LINE_NO:225
    If operational != floorScript.IsFloorOperational() ; #DEBUG_LINE_NO:227
      floorScript.SetElevatorFloorOperational(operational) ; #DEBUG_LINE_NO:228
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:231
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetElevatorOperational()
  Return IsOperational ; #DEBUG_LINE_NO:236
EndFunction

loadelevatorfloorscript[] Function GetLoadElevatorFloors()
  Return Self.GetLinkedRefChain(None, 100) as loadelevatorfloorscript[] ; #DEBUG_LINE_NO:240
EndFunction
