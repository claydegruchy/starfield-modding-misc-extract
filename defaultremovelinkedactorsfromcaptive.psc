ScriptName DefaultRemoveLinkedActorsFromCaptive Extends ObjectReference hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property RemoveLinkedCaptiveKeyword Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitingForTrigger

  Event OnTriggerEnter(ObjectReference akActionRef)
    Self.GoToState("Done") ; #DEBUG_LINE_NO:9
    Actor[] CaptiveActors = None ; #DEBUG_LINE_NO:10
    CaptiveActors = Self.GetActorsLinkedToMe(RemoveLinkedCaptiveKeyword, None) ; #DEBUG_LINE_NO:12
    Int maxSize = CaptiveActors.Length ; #DEBUG_LINE_NO:14
    Int count = 0 ; #DEBUG_LINE_NO:15
    While count < maxSize ; #DEBUG_LINE_NO:16
      Actor CaptiveActor = CaptiveActors[count] ; #DEBUG_LINE_NO:17
      CaptiveActor.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:18
      CaptiveActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:19
      count += 1 ; #DEBUG_LINE_NO:20
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
