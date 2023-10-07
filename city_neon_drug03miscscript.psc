ScriptName City_Neon_Drug03MiscScript Extends Quest
{ pops objective when Yannick will give you another shift }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property Neon_Drug03_CooldownTimestamp Auto Const mandatory
Int Property ShiftObjective = 10 Auto Const

;-- Functions ---------------------------------------

Function StartShiftTimer()
  Self.SetObjectiveDisplayed(ShiftObjective, False, False) ; #DEBUG_LINE_NO:11
  Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime() + 1.0) ; #DEBUG_LINE_NO:13
  Self.StartTimerGameTime(24.0, 0) ; #DEBUG_LINE_NO:15
EndFunction

Function ClearShiftTimer()
  Self.SetObjectiveCompleted(ShiftObjective, True) ; #DEBUG_LINE_NO:21
  Self.CancelTimerGameTime(0) ; #DEBUG_LINE_NO:23
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  Self.SetObjectiveCompleted(ShiftObjective, False) ; #DEBUG_LINE_NO:28
  Self.SetObjectiveDisplayed(ShiftObjective, True, False) ; #DEBUG_LINE_NO:29
  Neon_Drug03_CooldownTimestamp.SetValue(Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:31
EndEvent
