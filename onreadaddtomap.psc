ScriptName OnReadAddToMap Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property MapMarker Auto Const

;-- Functions ---------------------------------------

Event OnRead()
  MapMarker.AddToMapScanned(False) ; #DEBUG_LINE_NO:7
EndEvent
