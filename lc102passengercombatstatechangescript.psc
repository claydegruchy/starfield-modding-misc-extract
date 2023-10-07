ScriptName LC102PassengerCombatStateChangeScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- State -------------------------------------------
State Done

  Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnCombatStateChanged(ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
    Self.GotoState("Done") ; #DEBUG_LINE_NO:8
    Quest owningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
    owningQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:10
  EndEvent
EndState
