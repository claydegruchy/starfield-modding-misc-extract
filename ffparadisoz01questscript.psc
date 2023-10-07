ScriptName FFParadisoZ01QuestScript Extends Quest

;-- Variables ---------------------------------------
Int WaitTimerID = 1

;-- Properties --------------------------------------
Int Property WaitTimerEndStage = 450 Auto Const
ReferenceAlias Property Akachi Auto Const mandatory
ReferenceAlias Property Computer Auto Const mandatory
Float Property WaitTimerLength = 43200.0 Auto

;-- Functions ---------------------------------------

Function ComputerNoActivate()
  Computer.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:11
EndFunction

Function ComputerAllowActivate()
  Computer.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:15
EndFunction

Function StartWaitTimer()
  WaitTimerLength = Utility.GetHoursUntilLocalHour(11.0) ; #DEBUG_LINE_NO:20
  Self.StartTimerGametime(WaitTimerLength, WaitTimerID) ; #DEBUG_LINE_NO:21
EndFunction

Function StopWaitTimer()
  Self.CancelTimerGameTime(WaitTimerID) ; #DEBUG_LINE_NO:25
EndFunction

Event OnTimerGameTime(Int aiTimerId)
  If aiTimerId == WaitTimerID ; #DEBUG_LINE_NO:30
    Self.SetStage(WaitTimerEndStage) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent
