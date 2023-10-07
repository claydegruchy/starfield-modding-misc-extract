ScriptName DefaultSetPlayerOnElevator Extends ObjectReference Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property IsPlayerInElevator Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  IsPlayerInElevator.SetValue(1.0) ; #DEBUG_LINE_NO:10
  Actor[] PlayerFollowers = Game.GetPlayerFollowers() ; #DEBUG_LINE_NO:12
  Int CurrentFollowerIndex = 0 ; #DEBUG_LINE_NO:13
  While CurrentFollowerIndex < PlayerFollowers.Length ; #DEBUG_LINE_NO:14
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage(False) ; #DEBUG_LINE_NO:15
    CurrentFollowerIndex += 1 ; #DEBUG_LINE_NO:17
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  IsPlayerInElevator.SetValue(0.0) ; #DEBUG_LINE_NO:27
  Actor[] PlayerFollowers = Game.GetPlayerFollowers() ; #DEBUG_LINE_NO:29
  Int CurrentFollowerIndex = 0 ; #DEBUG_LINE_NO:30
  While CurrentFollowerIndex < PlayerFollowers.Length ; #DEBUG_LINE_NO:31
    PlayerFollowers[CurrentFollowerIndex].EvaluatePackage(False) ; #DEBUG_LINE_NO:32
    CurrentFollowerIndex += 1 ; #DEBUG_LINE_NO:34
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
