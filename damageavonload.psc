ScriptName damageAVonLoad Extends ObjectReference Const
{ NOTE - Not ready for primetime.  Right now this just cripples both legs on load... }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property LeftMobilityCondition Auto Const
ActorValue Property RightMobilityCondition Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.damageValue(LeftMobilityCondition, 100.0) ; #DEBUG_LINE_NO:9
  Self.damageValue(RightMobilityCondition, 100.0) ; #DEBUG_LINE_NO:10
EndEvent
