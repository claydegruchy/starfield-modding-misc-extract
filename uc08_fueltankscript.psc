ScriptName UC08_FuelTankScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 590 Auto Const
{ Stage to set when the proper switch is thrown }
Int Property PrereqStage = 570 Auto Const
{ Only set the stage if we're at the right part of the quest }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(StageToSet) ; #DEBUG_LINE_NO:12
    OQ.SetStage(StageToSet) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
