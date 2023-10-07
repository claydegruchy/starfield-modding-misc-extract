ScriptName SetActorValueOnActivate Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property ActorValueToSet Auto Const mandatory
Keyword Property TargetLinkKeyword Auto Const mandatory

;-- State -------------------------------------------
Auto State Holding

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Moving") ; #DEBUG_LINE_NO:8
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(TargetLinkKeyword, 100) ; #DEBUG_LINE_NO:9
    Int index = 0 ; #DEBUG_LINE_NO:10
    While index < linkedrefs.Length ; #DEBUG_LINE_NO:11
      ObjectReference target = linkedrefs[index] ; #DEBUG_LINE_NO:12
      target.SetValue(ActorValueToSet, 1.0) ; #DEBUG_LINE_NO:13
      (target as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:14
      index += 1 ; #DEBUG_LINE_NO:15
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Moving

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Holding") ; #DEBUG_LINE_NO:22
    ObjectReference[] linkedrefs = Self.GetLinkedRefChain(TargetLinkKeyword, 100) ; #DEBUG_LINE_NO:23
    Int index = 0 ; #DEBUG_LINE_NO:24
    While index < linkedrefs.Length ; #DEBUG_LINE_NO:25
      ObjectReference target = linkedrefs[index] ; #DEBUG_LINE_NO:26
      target.SetValue(ActorValueToSet, 0.0) ; #DEBUG_LINE_NO:27
      (target as Actor).EvaluatePackage(False) ; #DEBUG_LINE_NO:28
      index += 1 ; #DEBUG_LINE_NO:29
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
