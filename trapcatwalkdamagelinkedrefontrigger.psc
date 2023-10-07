ScriptName TrapCatwalkDamageLinkedRefonTrigger Extends ObjectReference Const
{ Damages linked object when trigger is entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Float Property damageAmount = 200.0 Auto Const
wwiseevent Property WwiseEvent_TRP_Catwalk_Creak_OneShot Auto Const
Float Property TimeToBreak = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  WwiseEvent_TRP_Catwalk_Creak_OneShot.Play(Self.GetLinkedRef(None), None, None) ; #DEBUG_LINE_NO:9
  Self.StartTimer(TimeToBreak, 0) ; #DEBUG_LINE_NO:11
EndEvent

Event OnTimer(Int aiTimerID)
  Self.GetLinkedRef(None).DamageObject(damageAmount) ; #DEBUG_LINE_NO:15
  Self.disable(False) ; #DEBUG_LINE_NO:16
EndEvent
