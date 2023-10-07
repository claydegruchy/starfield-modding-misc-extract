ScriptName DefaultKillActorRefOnTriggerEnter Extends ObjectReference Const
{ Kills the selected reference when it enters this trigger, then disables/deletes the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property ActorReferenceToKill Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == ActorReferenceToKill ; #DEBUG_LINE_NO:7
    (akActionRef as Actor).Kill(None) ; #DEBUG_LINE_NO:8
    Self.Disable(False) ; #DEBUG_LINE_NO:9
    Self.Delete() ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
