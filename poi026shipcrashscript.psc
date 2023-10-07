ScriptName POI026ShipCrashScript Extends ObjectReference

;-- Variables ---------------------------------------
Bool activateOnce = False

;-- Properties --------------------------------------
ObjectReference Property ExplosionLocation Auto Const
Explosion Property ExplosionEffect Auto Const
ObjectReference Property EnableMarkerRef Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If (akActionRef == Game.getplayer() as ObjectReference) && activateOnce == False ; #DEBUG_LINE_NO:15
    activateOnce = True ; #DEBUG_LINE_NO:16
    ExplosionLocation.PlaceAtMe(ExplosionEffect as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:18
    EnableMarkerRef.Enable(False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent
