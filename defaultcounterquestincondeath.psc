ScriptName DefaultCounterQuestIncOnDeath Extends ReferenceAlias default hidden
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuest script. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property CheckForOnDyingInstead = False Auto Const
  { If true the Increment will happen when this actor recieves the OnDying() event instead, which happens the instant the actor dies, unlike the
	OnDeath() event which can happen several seconds later. }
  Bool Property SupportRespawning = False Auto Const
  { If true then this script will reset after incrementing in order to allow the next respawned actor that fills it to increment upon death as well. }
EndGroup


;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquest).Increment() ; #DEBUG_LINE_NO:38
EndFunction

;-- State -------------------------------------------
State AlreadyDied
EndState

;-- State -------------------------------------------
Auto State WaitingForDeath

  Event OnDying(ObjectReference akKiller)
    If CheckForOnDyingInstead ; #DEBUG_LINE_NO:
      If !SupportRespawning ; #DEBUG_LINE_NO:
        Self.GoToState("AlreadyDied") ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      Self.Increment() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnDeath(ObjectReference akKiller)
    If !CheckForOnDyingInstead ; #DEBUG_LINE_NO:14
      If !SupportRespawning ; #DEBUG_LINE_NO:15
        Self.GoToState("AlreadyDied") ; #DEBUG_LINE_NO:16
      EndIf ; #DEBUG_LINE_NO:
      Self.Increment() ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
