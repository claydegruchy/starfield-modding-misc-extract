ScriptName DefaultCounterIncrementOnActivate Extends ObjectReference default
{ Once this is activated (by the PLAYER) it increments the counter on it's LinkedRef's DefaultCounter script. }

;-- Variables ---------------------------------------
Bool decrementNext = False

;-- Properties --------------------------------------
Group Optional_Properties
  Keyword Property LinkedRefKeyword Auto Const
  { The keyword of the LinkedRef to the Counter. Defaults to the unnamed linkedref. }
  Bool Property ShouldToggle Auto Const
  { Optional; defaults to False. Should every other action decrement the counter instead of incrementing it? }
EndGroup


;-- State -------------------------------------------
State DoneWaiting
EndState

;-- State -------------------------------------------
Auto State WaitForActivate

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
      If !ShouldToggle ; #DEBUG_LINE_NO:17
        Self.GoToState("DoneWaiting") ; #DEBUG_LINE_NO:18
      EndIf ; #DEBUG_LINE_NO:
      If ShouldToggle && decrementNext ; #DEBUG_LINE_NO:20
        (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Decrement() ; #DEBUG_LINE_NO:21
      Else ; #DEBUG_LINE_NO:
        (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Increment() ; #DEBUG_LINE_NO:23
      EndIf ; #DEBUG_LINE_NO:
      If ShouldToggle ; #DEBUG_LINE_NO:25
        decrementNext = !decrementNext ; #DEBUG_LINE_NO:26
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
