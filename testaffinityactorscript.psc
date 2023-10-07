ScriptName TestAffinityActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
affinityevent Property TestAENoel2 Auto Const
wwiseevent Property testSoundEvent Auto Const

;-- Functions ---------------------------------------

Event OnAffinityEvent(affinityevent MyAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  TestAENoel2.Send(None) ; #DEBUG_LINE_NO:9
EndEvent
