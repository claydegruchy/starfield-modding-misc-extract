ScriptName TestHardReversalScript2 Extends ObjectReference
{ sets an actor value on actor that enters }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property myAV Auto Const mandatory
{ First Actor Value to set. }
Float Property myAV_Value Auto Const mandatory
{ First Actor Value's new value. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
    Actor myActor = akActionRef as Actor ; #DEBUG_LINE_NO:14
    myActor.SetValue(myAV, myAV_Value) ; #DEBUG_LINE_NO:15
    myActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
