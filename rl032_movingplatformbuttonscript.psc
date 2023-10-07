ScriptName RL032_MovingPlatformButtonScript Extends ObjectReference

;-- Variables ---------------------------------------
movingplatformmasterscript movingPlatformMasterScriptRef

;-- Properties --------------------------------------
Int Property CurrentFloor = 1 Auto

;-- Functions ---------------------------------------

Event OnCellLoad()
  movingPlatformMasterScriptRef = Self.GetLinkedRef(None) as movingplatformmasterscript ; #DEBUG_LINE_NO:8
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If movingPlatformMasterScriptRef.IsMoving() ; #DEBUG_LINE_NO:12
    Return  ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  If CurrentFloor == 1 ; #DEBUG_LINE_NO:16
    CurrentFloor = 0 ; #DEBUG_LINE_NO:17
    movingPlatformMasterScriptRef.ProcessFloorTravelRequest(0) ; #DEBUG_LINE_NO:18
  ElseIf CurrentFloor == 0 ; #DEBUG_LINE_NO:19
    CurrentFloor = 1 ; #DEBUG_LINE_NO:20
    movingPlatformMasterScriptRef.ProcessFloorTravelRequest(1) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
