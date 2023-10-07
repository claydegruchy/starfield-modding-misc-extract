ScriptName TestJeffBStartCombatScript Extends ObjectReference
{ Tells the linked ref to start combat with his linkedref chain }

;-- Variables ---------------------------------------
Actor myActor

;-- Properties --------------------------------------
Keyword Property myKeyword Auto

;-- State -------------------------------------------
State allDone
EndState

;-- State -------------------------------------------
Auto State waiting

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.getPlayer() as ObjectReference ; #DEBUG_LINE_NO:14
      myActor = Self.getlinkedRef(myKeyword) as Actor ; #DEBUG_LINE_NO:15
      myActor.StartCombat((myActor.getlinkedRef(myKeyword) as Actor) as ObjectReference, False) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
