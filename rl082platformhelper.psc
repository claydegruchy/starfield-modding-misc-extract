ScriptName RL082PlatformHelper Extends ObjectReference
{ Script aniamting packages back and forth in third warehouse area }

;-- Variables ---------------------------------------
Int CraneIinstanceID
Float fposition = 1.0

;-- Properties --------------------------------------
wwiseevent Property WwiseEvent_AMB_RL083_MovingRailHook Auto Const

;-- Functions ---------------------------------------

Event OnCellLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:9
    Self.StartTimer(0.100000001, 0) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  Self.SetAnimationVariableFloat("Speed", Utility.RandomFloat(0.100000001, 0.150000006)) ; #DEBUG_LINE_NO:18
  Self.SetAnimationVariableFloat("Position", fposition) ; #DEBUG_LINE_NO:19
  CraneIinstanceID = WwiseEvent_AMB_RL083_MovingRailHook.Play(Self.GetLinkedRef(None), None, None) ; #DEBUG_LINE_NO:20
  If Self.PlayAnimationAndWait("Play01", "done") ; #DEBUG_LINE_NO:21
    wwiseevent.StopInstance(CraneIinstanceID) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
  If fposition == 1.0 ; #DEBUG_LINE_NO:25
    fposition = 0.0 ; #DEBUG_LINE_NO:26
  Else ; #DEBUG_LINE_NO:
    fposition = 1.0 ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:30
    Self.StartTimer(Utility.RandomFloat(4.0, 7.0), 0) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent
