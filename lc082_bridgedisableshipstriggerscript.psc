ScriptName LC082_BridgeDisableShipsTriggerScript Extends ObjectReference
{ Script for the LC082 Bridge Trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  lc082_vigilancequestscript Property LC082 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  LC082.SetEscortShipsEnabled(False) ; #DEBUG_LINE_NO:12
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  LC082.SetEscortShipsEnabled(True) ; #DEBUG_LINE_NO:16
EndEvent
