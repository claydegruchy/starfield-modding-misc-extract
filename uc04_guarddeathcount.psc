ScriptName UC04_GuardDeathCount Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to track if the attack if still currently active }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If UC04_AttackActive.GetValue() >= 1.0 ; #DEBUG_LINE_NO:7
    (Self.GetOwningQuest() as uc04_questscript).IncrementGuardDeathCount() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
