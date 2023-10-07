ScriptName UC04_TableGoodiesCollScript Extends RefCollectionAlias

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:5
EndEvent
