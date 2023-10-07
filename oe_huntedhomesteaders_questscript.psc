ScriptName OE_HuntedHomesteaders_QuestScript Extends Quest

;-- Variables ---------------------------------------
Int WaitTimerID = 1
Float WaitTimerLength = 0.0

;-- Properties --------------------------------------
Group QuestProperties
  Int Property StageToSet = 300 Auto Const
  { This is the stage that will be set when the timer ends. }
  Float Property TimeToSpawn = 15.0 Auto
  { In Seconds -- the minimum time that must pass before the creatures spawn. }
  Float Property MaxTimeToSpawn = 35.0 Auto
  { In seconds, the maxinum amount of time to wait for the Predators to spawn. }
EndGroup


;-- Functions ---------------------------------------

Function StartWaitTimer()
  WaitTimerLength = Utility.RandomFloat(TimeToSpawn, MaxTimeToSpawn) * 0.0167 ; #DEBUG_LINE_NO:17
  Self.StartTimerGametime(WaitTimerLength, WaitTimerID) ; #DEBUG_LINE_NO:18
EndFunction

Function StopWaitTimer()
  Self.CancelTimerGameTime(WaitTimerID) ; #DEBUG_LINE_NO:22
EndFunction

Event OnTimerGameTime(Int aiTimerId)
  If aiTimerId == WaitTimerID ; #DEBUG_LINE_NO:26
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndEvent
