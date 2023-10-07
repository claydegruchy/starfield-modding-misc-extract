ScriptName DefaultCounterIncrementOnDeath Extends Actor default
{ Once this actor dies it increments the counter on it's LinkedRef's DefaultCounter script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Keyword Property LinkedRefKeyword Auto Const mandatory
  { The keyword of the LinkedRef to the Counter. Defaults to the unnamed linkedref. }
  Bool Property CheckForOnDyingInstead = False Auto Const
  { If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
EndGroup


;-- State -------------------------------------------
State AlreadyDied
EndState

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDying(ObjectReference akKiller)
    If CheckForOnDyingInstead ; #DEBUG_LINE_NO:
      Self.GoToState("AlreadyDied") ; #DEBUG_LINE_NO:
      (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Increment() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDeath(ObjectReference akKiller)
    If !CheckForOnDyingInstead ; #DEBUG_LINE_NO:15
      Self.GoToState("AlreadyDied") ; #DEBUG_LINE_NO:16
      (Self.GetLinkedRef(LinkedRefKeyword) as defaultcounter).Increment() ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
