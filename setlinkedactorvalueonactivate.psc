ScriptName SetLinkedActorValueOnActivate Extends ObjectReference Const
{ Sets a specific actor value on the linked reference chain to a specific value on activate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActorValueToSet Auto Const mandatory
Keyword Property LinkCustom01 Auto Const
Float Property NewValue = 1.0 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference[] linkedrefs = Self.GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:9
  Int index = 0 ; #DEBUG_LINE_NO:10
  While index < linkedrefs.Length ; #DEBUG_LINE_NO:11
    ObjectReference target = linkedrefs[index] ; #DEBUG_LINE_NO:12
    target.SetValue(ActorValueToSet, NewValue) ; #DEBUG_LINE_NO:13
    (target as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:14
    index += 1 ; #DEBUG_LINE_NO:15
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
