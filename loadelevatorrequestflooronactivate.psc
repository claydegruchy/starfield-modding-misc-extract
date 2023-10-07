ScriptName LoadElevatorRequestFloorOnActivate Extends ObjectReference

;-- Variables ---------------------------------------
Int currentFloorIndex = -1
loadelevatormanagerscript loadElevatorManager

;-- Functions ---------------------------------------

Function AssignLoadElevatorData(Int newCurrentFloorIndex, loadelevatormanagerscript newLoadElevatorManager)
  currentFloorIndex = newCurrentFloorIndex ; #DEBUG_LINE_NO:12
  loadElevatorManager = newLoadElevatorManager ; #DEBUG_LINE_NO:13
EndFunction

Function AssignButtonName(Message buttonNameMessage)
  Self.SetOverrideName(buttonNameMessage) ; #DEBUG_LINE_NO:17
EndFunction

;-- State -------------------------------------------
State RequestingFloorTravel

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayerToRequestFloorTravel

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("RequestingFloorTravel") ; #DEBUG_LINE_NO:23
    If currentFloorIndex != -1 && loadElevatorManager != None && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:25
      If loadElevatorManager == None ; #DEBUG_LINE_NO:26
         ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        loadElevatorManager.RequestFloorTravel(currentFloorIndex, akActionRef) ; #DEBUG_LINE_NO:29
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("WaitingForPlayerToRequestFloorTravel") ; #DEBUG_LINE_NO:33
  EndEvent
EndState
