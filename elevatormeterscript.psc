ScriptName ElevatorMeterScript Extends ObjectReference Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property StartOn = False Auto Const
{ ONLY FOR LOAD ELEVATORS!  If this meter is above the EXTERIOR door then this should be set to TRUE }
Bool Property StartMoving = False Auto Const
{ ONLY FOR LOAD ELEVATORS!  If this meter is above the INTERIOR door then this should be set to TRUE }

;-- Functions ---------------------------------------

Event OnCellLoad()
  If StartOn ; #DEBUG_LINE_NO:12
    Self.WaitFor3DLoad() ; #DEBUG_LINE_NO:13
    Self.PlayAnimation("StartOn") ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  If StartMoving ; #DEBUG_LINE_NO:17
    Self.WaitFor3DLoad() ; #DEBUG_LINE_NO:18
    Self.PlayAnimation("Play01") ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
