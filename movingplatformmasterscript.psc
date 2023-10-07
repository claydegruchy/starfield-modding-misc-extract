ScriptName MovingPlatformMasterScript Extends ObjectReference

;-- Variables ---------------------------------------
ObjectReference[] callButtons
Int currentFloorIndex
Int currentNodeMarkerIndex
wwiseevent currentTravelStartEvent
wwiseevent currentTravelStopEvent
Float doorOpenSeconds = 1.5
Int[] floorIndicesByCallButtonIndex
Bool initialized = False
ObjectReference interiorButtonDown
ObjectReference interiorButtonUp
ObjectReference interiorDoor
Bool interiorDoorIsClosing
Int maxFloorIndex
ObjectReference movingPlatformBase
Bool movingPlatformIsMoving
Int[] nodeMarkerIndicesByFloorIndex
ObjectReference[] nodeMarkers
Int targetFloorIndex
Int targetNodeMarkerIndex
Int travelSoundInstanceID = -1
Int travelStepValue
Int travelStopSoundInstanceID = -1

;-- Properties --------------------------------------
Group requiredProperties
  Float Property TravelSpeed = 1.0 Auto Const
  Int Property StartingFloor = 0 Auto Const
  { Starting from "0" being the first floor. }
EndGroup

Group optionalProperties
  Bool Property animateAccessoryReferences = False Auto Const
  Keyword Property accessoruReferenceKeyword Auto Const
EndGroup

Group audioProperties
  Bool Property UseDirectionalSoundEvents = False Auto Const
  { when false, the 'TravelSoundEvent' will be played, regardless of the platform's movement direction. When true, direction-specific 'Start' and 'Stop' events will be played instead. }
  wwiseevent Property TravelSoundEvent Auto Const
  { This should be a looping sound, which plays while the moving platform is in motion. }
  wwiseevent Property UpwardTravelStartsEvent Auto Const
  { This sound plays once, when the platform begins traveling upwards. }
  wwiseevent Property UpwardTravelStopsEvent Auto Const
  { This sound plays once, when the platform stops traveling upwards. }
  wwiseevent Property DownwardTravelStartsEvent Auto Const
  { This sound plays once, when the platform begins traveling downwards. }
  wwiseevent Property DownwardTravelStopsEvent Auto Const
  { This sound plays once, when the platform stops traveling downwards. }
EndGroup

Group No_Touchy collapsedonref
  Keyword Property MovingPlatform_TranslationHelperKeyword Auto Const
  Keyword Property MovingPlatform_InteriorDoorKeyword Auto Const
  Keyword Property MovingPlatform_InteriorButtonUpKeyword Auto Const
  Keyword Property MovingPlatform_InteriorButtonDownKeyword Auto Const
  Keyword Property MovingPlatform_CallButtonFloorKeyword Auto Const
  LocationRefType Property MovingPlatform_FloorMarkerLocationRefType Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnCellLoad()
  If initialized == False ; #DEBUG_LINE_NO:71
    Self.InitializeMovingPlatform() ; #DEBUG_LINE_NO:72
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForEvents() ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterFromEvents() ; #DEBUG_LINE_NO:79
  wwiseevent.StopInstance(travelSoundInstanceID) ; #DEBUG_LINE_NO:81
  wwiseevent.StopInstance(travelStopSoundInstanceID) ; #DEBUG_LINE_NO:82
EndEvent

Event ObjectReference.OnActivate(ObjectReference akSender, ObjectReference akActionRef)
  If akSender.IsActivationBlocked() ; #DEBUG_LINE_NO:89
    Return  ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
  If movingPlatformIsMoving ; #DEBUG_LINE_NO:94
    Return  ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  If akSender == interiorButtonUp ; #DEBUG_LINE_NO:98
    If currentFloorIndex < maxFloorIndex ; #DEBUG_LINE_NO:99
      Self.ProcessFloorTravelRequest(currentFloorIndex + 1) ; #DEBUG_LINE_NO:100
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akSender == interiorButtonDown ; #DEBUG_LINE_NO:102
    If currentFloorIndex > 0 ; #DEBUG_LINE_NO:103
      Self.ProcessFloorTravelRequest(currentFloorIndex - 1) ; #DEBUG_LINE_NO:104
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Int callButtonIndex = callButtons.find(akSender, 0) ; #DEBUG_LINE_NO:107
    If callButtonIndex > -1 ; #DEBUG_LINE_NO:109
      Int requestedFloorIndex = floorIndicesByCallButtonIndex[callButtonIndex] ; #DEBUG_LINE_NO:110
      If requestedFloorIndex == currentFloorIndex ; #DEBUG_LINE_NO:112
        Self.OpenInteriorDoor() ; #DEBUG_LINE_NO:113
      Else ; #DEBUG_LINE_NO:
        Self.ProcessFloorTravelRequest(requestedFloorIndex) ; #DEBUG_LINE_NO:115
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnTranslationAlmostComplete(ObjectReference akSender)
  If akSender != movingPlatformBase ; #DEBUG_LINE_NO:122
    Return  ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
  If currentNodeMarkerIndex != targetNodeMarkerIndex ; #DEBUG_LINE_NO:126
    Self.TravelToNextNode() ; #DEBUG_LINE_NO:127
  Else ; #DEBUG_LINE_NO:
    Self.CompleteFloorTravel(True) ; #DEBUG_LINE_NO:129
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function InitializeMovingPlatform()
  movingPlatformBase = Self.GetLinkedRef(MovingPlatform_TranslationHelperKeyword) ; #DEBUG_LINE_NO:137
  interiorDoor = Self.GetLinkedRef(MovingPlatform_InteriorDoorKeyword) ; #DEBUG_LINE_NO:140
  interiorButtonUp = Self.GetLinkedRef(MovingPlatform_InteriorButtonUpKeyword) ; #DEBUG_LINE_NO:143
  interiorButtonDown = Self.GetLinkedRef(MovingPlatform_InteriorButtonDownKeyword) ; #DEBUG_LINE_NO:144
  nodeMarkers = Self.GetLinkedRefChain(None, 100) ; #DEBUG_LINE_NO:147
  If nodeMarkers.Length == 0 ; #DEBUG_LINE_NO:149
    Return  ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  nodeMarkerIndicesByFloorIndex = new Int[0] ; #DEBUG_LINE_NO:153
  callButtons = new ObjectReference[0] ; #DEBUG_LINE_NO:154
  floorIndicesByCallButtonIndex = new Int[0] ; #DEBUG_LINE_NO:155
  Int I = 0 ; #DEBUG_LINE_NO:157
  Int currentFloor = -1 ; #DEBUG_LINE_NO:158
  While I < nodeMarkers.Length ; #DEBUG_LINE_NO:159
    ObjectReference nodeMarker = nodeMarkers[I] ; #DEBUG_LINE_NO:160
    If nodeMarker.HasLocRefType(MovingPlatform_FloorMarkerLocationRefType) ; #DEBUG_LINE_NO:163
      currentFloor += 1 ; #DEBUG_LINE_NO:164
      nodeMarkerIndicesByFloorIndex.add(I, 1) ; #DEBUG_LINE_NO:165
      ObjectReference[] callButtonsForFloor = nodeMarker.GetRefsLinkedToMe(MovingPlatform_CallButtonFloorKeyword, None) ; #DEBUG_LINE_NO:168
      Int iCallButton = 0 ; #DEBUG_LINE_NO:170
      While iCallButton < callButtonsForFloor.Length ; #DEBUG_LINE_NO:171
        ObjectReference callButton = callButtonsForFloor[iCallButton] ; #DEBUG_LINE_NO:172
        callButtons.add(callButton, 1) ; #DEBUG_LINE_NO:174
        floorIndicesByCallButtonIndex.add(currentFloor, 1) ; #DEBUG_LINE_NO:175
        iCallButton += 1 ; #DEBUG_LINE_NO:177
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:181
  EndWhile ; #DEBUG_LINE_NO:
  currentFloorIndex = StartingFloor ; #DEBUG_LINE_NO:185
  Int startingFloornodeIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex] ; #DEBUG_LINE_NO:187
  ObjectReference startingNodeMarker = nodeMarkers[startingFloornodeIndex] ; #DEBUG_LINE_NO:188
  movingPlatformBase.MoveTo(startingNodeMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:190
  maxFloorIndex = currentFloor ; #DEBUG_LINE_NO:193
  Self.RegisterForEvents() ; #DEBUG_LINE_NO:196
  initialized = True ; #DEBUG_LINE_NO:199
EndFunction

Function RegisterForEvents()
  If interiorButtonUp ; #DEBUG_LINE_NO:204
    Self.RegisterForRemoteEvent(interiorButtonUp as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  If interiorButtonDown ; #DEBUG_LINE_NO:208
    Self.RegisterForRemoteEvent(interiorButtonDown as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:209
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:213
  While I < callButtons.Length ; #DEBUG_LINE_NO:214
    ObjectReference callButton = callButtons[I] ; #DEBUG_LINE_NO:215
    Self.RegisterForRemoteEvent(callButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:217
    I += 1 ; #DEBUG_LINE_NO:219
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function UnregisterFromEvents()
  If interiorButtonUp ; #DEBUG_LINE_NO:225
    Self.UnregisterForRemoteEvent(interiorButtonUp as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  If interiorButtonDown ; #DEBUG_LINE_NO:229
    Self.UnregisterForRemoteEvent(interiorButtonDown as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:230
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:234
  While I < callButtons.Length ; #DEBUG_LINE_NO:235
    ObjectReference callButton = callButtons[I] ; #DEBUG_LINE_NO:236
    Self.UnregisterForRemoteEvent(callButton as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:238
    I += 1 ; #DEBUG_LINE_NO:240
  EndWhile ; #DEBUG_LINE_NO:
  Self.UnregisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete") ; #DEBUG_LINE_NO:244
EndFunction

Function ProcessFloorTravelRequest(Int requestedFloorIndex)
  movingPlatformIsMoving = True ; #DEBUG_LINE_NO:249
  Self.CloseInteriorDoor() ; #DEBUG_LINE_NO:252
  currentNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[currentFloorIndex] ; #DEBUG_LINE_NO:255
  targetNodeMarkerIndex = nodeMarkerIndicesByFloorIndex[requestedFloorIndex] ; #DEBUG_LINE_NO:256
  targetFloorIndex = requestedFloorIndex ; #DEBUG_LINE_NO:257
  Int nodeDistance = targetNodeMarkerIndex - currentNodeMarkerIndex ; #DEBUG_LINE_NO:259
  travelStepValue = 1 ; #DEBUG_LINE_NO:260
  If nodeDistance < 0 ; #DEBUG_LINE_NO:262
    travelStepValue = -1 ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete") ; #DEBUG_LINE_NO:267
  If UseDirectionalSoundEvents ; #DEBUG_LINE_NO:270
    If travelStepValue > 0 ; #DEBUG_LINE_NO:271
      currentTravelStartEvent = UpwardTravelStartsEvent ; #DEBUG_LINE_NO:273
      currentTravelStopEvent = UpwardTravelStopsEvent ; #DEBUG_LINE_NO:274
    ElseIf travelStepValue < 0 ; #DEBUG_LINE_NO:275
      currentTravelStartEvent = DownwardTravelStartsEvent ; #DEBUG_LINE_NO:277
      currentTravelStopEvent = DownwardTravelStopsEvent ; #DEBUG_LINE_NO:278
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    currentTravelStartEvent = TravelSoundEvent ; #DEBUG_LINE_NO:282
    currentTravelStopEvent = None ; #DEBUG_LINE_NO:283
  EndIf ; #DEBUG_LINE_NO:
  wwiseevent.StopInstance(travelSoundInstanceID) ; #DEBUG_LINE_NO:287
  If currentTravelStartEvent != None ; #DEBUG_LINE_NO:290
    travelSoundInstanceID = currentTravelStartEvent.Play(movingPlatformBase, None, None) ; #DEBUG_LINE_NO:291
  EndIf ; #DEBUG_LINE_NO:
  Self.TravelToNextNode() ; #DEBUG_LINE_NO:295
EndFunction

Function TravelToNextNode()
  Int nextNodeMarkerIndex = currentNodeMarkerIndex + travelStepValue ; #DEBUG_LINE_NO:300
  ObjectReference nextNodeMarker = nodeMarkers[nextNodeMarkerIndex] ; #DEBUG_LINE_NO:301
  currentNodeMarkerIndex = nextNodeMarkerIndex ; #DEBUG_LINE_NO:303
  If animateAccessoryReferences ; #DEBUG_LINE_NO:306
    String accessoryAnimationName = "" ; #DEBUG_LINE_NO:307
    If travelStepValue > 0 ; #DEBUG_LINE_NO:309
      accessoryAnimationName = "Play02" ; #DEBUG_LINE_NO:310
    ElseIf travelStepValue < 0 ; #DEBUG_LINE_NO:311
      accessoryAnimationName = "Play01" ; #DEBUG_LINE_NO:312
    EndIf ; #DEBUG_LINE_NO:
    ObjectReference[] accessoryReferences = Self.GetRefsLinkedToMe(accessoruReferenceKeyword, None) ; #DEBUG_LINE_NO:315
    Int I = 0 ; #DEBUG_LINE_NO:317
    While I < accessoryReferences.Length ; #DEBUG_LINE_NO:318
      ObjectReference accessoryReference = accessoryReferences[I] ; #DEBUG_LINE_NO:319
      accessoryReference.PlayAnimation(accessoryAnimationName) ; #DEBUG_LINE_NO:320
      I += 1 ; #DEBUG_LINE_NO:322
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  movingPlatformBase.TranslateToRef(nextNodeMarker, TravelSpeed, 0.0) ; #DEBUG_LINE_NO:327
EndFunction

Function CancelTravelAndReturnToOriginFloor()
  Int returnFloorIndex = currentFloorIndex ; #DEBUG_LINE_NO:332
  Self.CompleteFloorTravel(False) ; #DEBUG_LINE_NO:334
  Self.ProcessFloorTravelRequest(returnFloorIndex) ; #DEBUG_LINE_NO:336
EndFunction

Function CompleteFloorTravel(Bool OpenInteriorDoor)
  wwiseevent.StopInstance(travelStopSoundInstanceID) ; #DEBUG_LINE_NO:341
  If currentTravelStopEvent != None ; #DEBUG_LINE_NO:343
    travelStopSoundInstanceID = currentTravelStopEvent.Play(movingPlatformBase, None, None) ; #DEBUG_LINE_NO:344
  EndIf ; #DEBUG_LINE_NO:
  Self.UnregisterForRemoteEvent(movingPlatformBase as ScriptObject, "OnTranslationAlmostComplete") ; #DEBUG_LINE_NO:348
  If OpenInteriorDoor ; #DEBUG_LINE_NO:351
    Self.OpenInteriorDoor() ; #DEBUG_LINE_NO:352
  EndIf ; #DEBUG_LINE_NO:
  currentFloorIndex = targetFloorIndex ; #DEBUG_LINE_NO:356
  movingPlatformIsMoving = False ; #DEBUG_LINE_NO:359
EndFunction

Function OpenInteriorDoor()
  Int openState = interiorDoor.GetOpenState() ; #DEBUG_LINE_NO:363
  If openState == 3 ; #DEBUG_LINE_NO:365
    interiorDoor.SetOpen(True) ; #DEBUG_LINE_NO:367
    Utility.Wait(doorOpenSeconds) ; #DEBUG_LINE_NO:368
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CloseInteriorDoor()
  Int openState = interiorDoor.GetOpenState() ; #DEBUG_LINE_NO:373
  If openState == 1 ; #DEBUG_LINE_NO:375
    interiorDoorIsClosing = True ; #DEBUG_LINE_NO:376
    interiorDoor.SetOpen(False) ; #DEBUG_LINE_NO:379
    Utility.Wait(doorOpenSeconds) ; #DEBUG_LINE_NO:380
    interiorDoorIsClosing = False ; #DEBUG_LINE_NO:382
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsInteriorDoorClosing()
  Return interiorDoorIsClosing ; #DEBUG_LINE_NO:387
EndFunction

Float Function GetDoorOpenSeconds()
  Return doorOpenSeconds ; #DEBUG_LINE_NO:391
EndFunction

Bool Function IsMoving()
  Return movingPlatformIsMoving ; #DEBUG_LINE_NO:395
EndFunction

Int Function GetCurrentDirection()
  Return travelStepValue ; #DEBUG_LINE_NO:399
EndFunction
