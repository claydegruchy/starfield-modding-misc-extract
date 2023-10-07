ScriptName UC08_AB_CollCleanUpScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CleanUpStage = 900 Auto Const
{ Once this stage is set, start cleaning up the NPCs }

;-- Functions ---------------------------------------

Event OnUnload(ObjectReference akSenderRef)
  If Self.GetOwningQuest().GetStageDone(CleanUpStage) ; #DEBUG_LINE_NO:7
    akSenderRef.Disable(False) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
