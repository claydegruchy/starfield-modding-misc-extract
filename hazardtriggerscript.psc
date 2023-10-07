ScriptName HazardTriggerScript Extends ObjectReference Const
{ Script for a hazard-like trigger that casts a spell at any actors in the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property TriggerSpell Auto Const mandatory
{ The spell to cast on any actors in the trigger. }
Float Property TriggerSpellDelay = 1.0 Auto Const
{ DEFAULT: 1. Timer delay between castings of the spell. }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Self.StartTimer(TriggerSpellDelay, 0) ; #DEBUG_LINE_NO:11
EndEvent

Event OnTimer(Int timerID)
  ObjectReference[] triggerRefs = Self.GetAllRefsInTrigger() ; #DEBUG_LINE_NO:15
  If triggerRefs.Length > 0 ; #DEBUG_LINE_NO:16
    Int I = 0 ; #DEBUG_LINE_NO:17
    While I < triggerRefs.Length ; #DEBUG_LINE_NO:18
      TriggerSpell.Cast(Self as ObjectReference, triggerRefs[I]) ; #DEBUG_LINE_NO:19
      I += 1 ; #DEBUG_LINE_NO:20
    EndWhile ; #DEBUG_LINE_NO:
    Self.StartTimer(TriggerSpellDelay, 0) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
