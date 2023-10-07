ScriptName TestSnapInteractionPlayerScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Self.GetOwningQuest().SetStage(10) ; #DEBUG_LINE_NO:4
EndEvent
