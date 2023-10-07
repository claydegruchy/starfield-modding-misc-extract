ScriptName COM_Barrett_EpilogueTimerScript Extends Quest
{ A timer that counts down days after an event and sets a stage }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
Int Property idNumber Auto Const mandatory
Int Property cooldownHours Auto Const mandatory

;-- Functions ---------------------------------------

Function StartCooldownTimer()
  Self.StartTimerGameTime(cooldownHours as Float, idNumber) ; #DEBUG_LINE_NO:12
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == idNumber ; #DEBUG_LINE_NO:16
    Self.SetStage(StageToSet) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent
