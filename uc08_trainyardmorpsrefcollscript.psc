ScriptName UC08_TrainyardMorpsRefCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 381 Auto Const
{ Looking for this stage before we start setting anything }
Int Property StagetoSet = 382 Auto Const
{ Set this stage once this ref collection is empty. It's possible this could get emptied before the prereq is set. That handling is managed on stage 381. }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:10
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
  If OQ.GetStageDone(PrereqStage) && Self.GetCount() <= 0 ; #DEBUG_LINE_NO:13
    OQ.SetStage(StagetoSet) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent
