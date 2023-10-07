ScriptName DR029ElevatorAvoidanceScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:4
    movingplatformmasterscript movingPlatform = Self.GetLinkedRef(None) as movingplatformmasterscript ; #DEBUG_LINE_NO:5
    If movingPlatform != None ; #DEBUG_LINE_NO:7
      If movingPlatform.IsInteriorDoorClosing() ; #DEBUG_LINE_NO:8
        Float doorOpenSeconds = movingPlatform.GetDoorOpenSeconds() ; #DEBUG_LINE_NO:9
        Utility.Wait(doorOpenSeconds) ; #DEBUG_LINE_NO:11
      EndIf ; #DEBUG_LINE_NO:
      If movingPlatform.IsMoving() && movingPlatform.GetCurrentDirection() < 0 ; #DEBUG_LINE_NO:14
        movingPlatform.CancelTravelAndReturnToOriginFloor() ; #DEBUG_LINE_NO:15
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
