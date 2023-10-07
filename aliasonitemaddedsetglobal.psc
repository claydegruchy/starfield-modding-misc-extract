ScriptName AliasOnItemAddedSetGlobal Extends ReferenceAlias
{ set a global or quest stage when item is added }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property GlobalToSet Auto Const
{ optional: global to set when flora is harvested }
Float Property ValueToSet = 1.0 Auto Const
{ value to set GlobalToSet to }
Quest Property QuestToSetStage Auto Const
{ optional: quest to set a stage on when flora is harvested }
Int Property StageToSet = -1 Auto Const
{ stage to set on QuestToSetStage }
FormList Property UniqueResourcesOrganicList Auto Const mandatory

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If GlobalToSet as Bool && GlobalToSet.GetValue() != ValueToSet ; #DEBUG_LINE_NO:17
    GlobalToSet.SetValue(ValueToSet) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  If (QuestToSetStage as Bool && StageToSet > -1) && QuestToSetStage.GetStageDone(StageToSet) == False ; #DEBUG_LINE_NO:21
    QuestToSetStage.SetStage(StageToSet) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
