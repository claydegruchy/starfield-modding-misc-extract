ScriptName POIBB001WeatherScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weather Property wStorm Auto Const mandatory
ObjectReference Property DustMarker Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.Disable(False) ; #DEBUG_LINE_NO:7
  wStorm.SetActive(True, False) ; #DEBUG_LINE_NO:8
  Utility.Wait(40.0) ; #DEBUG_LINE_NO:9
  DustMarker.Enable(False) ; #DEBUG_LINE_NO:10
EndEvent

Event OnUnload()
  Weather.ReleaseOverride() ; #DEBUG_LINE_NO:14
EndEvent
