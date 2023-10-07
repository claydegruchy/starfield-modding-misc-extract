ScriptName LC082_BrigTriggerRefScript Extends ObjectReference
{ Script for the LC082 Brig Trigger. Periodically EVP's the actors in the Brig to get them into position for dialogue. }

;-- Variables ---------------------------------------
Int CONST_BrigTriggerDelay = 5 Const

;-- Properties --------------------------------------
Group AutofillProperties
  lc082_brigquestscript Property LC082 Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.StartTimer(0.0, 0) ; #DEBUG_LINE_NO:12
EndEvent

Event OnTimer(Int timerID)
  If Self.IsInTrigger(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:16
    LC082.EVPPrisoners() ; #DEBUG_LINE_NO:17
    Self.StartTimer(CONST_BrigTriggerDelay as Float, 0) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent
