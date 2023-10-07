ScriptName DefaultSetWeatherWhileInTriggerScript Extends ObjectReference default
{ Set the weather that should display while the player is in this trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weather Property WeatherToSetActive Auto Const mandatory
{ Defaults to CommonwealthClear }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  WeatherToSetActive.SetActive(True, False) ; #DEBUG_LINE_NO:8
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  Weather.ReleaseOverride() ; #DEBUG_LINE_NO:12
EndEvent
