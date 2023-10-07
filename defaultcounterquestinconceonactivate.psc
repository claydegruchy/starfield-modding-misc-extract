ScriptName DefaultCounterQuestIncOnceOnActivate Extends ReferenceAlias default hidden
{ Once this ALIAS is activated (by the PLAYER) it increments the counter on its Quest's DefaultCounterQuest script }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquest).Increment() ; #DEBUG_LINE_NO:14
EndFunction

;-- State -------------------------------------------
State DoneWaiting
EndState

;-- State -------------------------------------------
Auto State WaitForActivate

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:6
      Self.GoToState("DoneWaiting") ; #DEBUG_LINE_NO:7
      Self.Increment() ; #DEBUG_LINE_NO:8
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
