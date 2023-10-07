ScriptName DefaultContainerAddRefsOnLoad Extends ObjectReference default
{ On cell load, find all of the refs linked to or from this container with LinkAddItem, and add those items to the container. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  Keyword Property LinkAddItem Auto Const mandatory
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCellLoad()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:10
    ObjectReference[] linkedRefs = Self.GetLinkedRefChain(LinkAddItem, 100) ; #DEBUG_LINE_NO:11
    Int I = 0 ; #DEBUG_LINE_NO:12
    While I < linkedRefs.Length ; #DEBUG_LINE_NO:13
      Self.AddItem(linkedRefs[I] as Form, 1, False) ; #DEBUG_LINE_NO:14
      I += 1 ; #DEBUG_LINE_NO:15
    EndWhile ; #DEBUG_LINE_NO:
    ObjectReference[] refsLinkedToMe = Self.GetRefsLinkedToMe(LinkAddItem, None) ; #DEBUG_LINE_NO:17
    I = 0 ; #DEBUG_LINE_NO:18
    While I < refsLinkedToMe.Length ; #DEBUG_LINE_NO:19
      Self.AddItem(refsLinkedToMe[I] as Form, 1, False) ; #DEBUG_LINE_NO:20
      I += 1 ; #DEBUG_LINE_NO:21
    EndWhile ; #DEBUG_LINE_NO:
  EndEvent
EndState
