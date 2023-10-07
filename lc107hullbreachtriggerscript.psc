ScriptName LC107HullBreachTriggerScript Extends ObjectReference
{ Script for the Hull Breach Triggers in LC107. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group TriggerProperties
  Float Property MinTimeBeforeSubsequentBreach Auto Const
  Float Property MaxTimeBeforeSubsequentBreach Auto Const
EndGroup


;-- Functions ---------------------------------------

Function TriggerBreaches()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Function TriggerBreaches()
    Self.GoToState("Done") ; #DEBUG_LINE_NO:
    lc107hullbreachscript[] linkedBreaches = Self.GetLinkedRefChain(None, 100) as lc107hullbreachscript[] ; #DEBUG_LINE_NO:
    Var[] akArgs = new Var[1] ; #DEBUG_LINE_NO:
    akArgs[0] = False as Var ; #DEBUG_LINE_NO:
    Float delayBeforeNextBreach = 0.0 ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:
    While I < linkedBreaches.Length ; #DEBUG_LINE_NO:
      If delayBeforeNextBreach > 0.0 ; #DEBUG_LINE_NO:
        Utility.Wait(delayBeforeNextBreach) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If linkedBreaches[I] != None ; #DEBUG_LINE_NO:
        linkedBreaches[I].CallFunctionNoWait("TriggerBreach", akArgs) ; #DEBUG_LINE_NO:
        If MinTimeBeforeSubsequentBreach > 0.0 ; #DEBUG_LINE_NO:
          delayBeforeNextBreach = Utility.RandomFloat(MinTimeBeforeSubsequentBreach, MaxTimeBeforeSubsequentBreach) ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:
    EndWhile ; #DEBUG_LINE_NO:
  EndFunction

  Event OnTriggerEnter(ObjectReference akTriggerRef)
    Self.TriggerBreaches() ; #DEBUG_LINE_NO:12
  EndEvent
EndState
