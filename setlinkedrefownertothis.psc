ScriptName SetLinkedRefOwnerToThis Extends Actor Const
{ Sets this actor's LinkedRef to be owned by this actor. }

;-- Functions ---------------------------------------

Event OnCellAttach()
  ObjectReference linkedRef = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:6
  Actor actorSelf = Self as Actor ; #DEBUG_LINE_NO:7
  linkedRef.SetActorRefOwner(actorSelf, False) ; #DEBUG_LINE_NO:8
  actorSelf = linkedRef.GetActorRefOwner() ; #DEBUG_LINE_NO:9
EndEvent
