ScriptName FloraOnHarvestScript Extends ObjectReference Const
{ set a global or quest stage when flora is harvested }

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

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:17
    If GlobalToSet as Bool && GlobalToSet.GetValue() != ValueToSet ; #DEBUG_LINE_NO:18
      GlobalToSet.SetValue(ValueToSet) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
    If (QuestToSetStage as Bool && StageToSet > -1) && QuestToSetStage.GetStageDone(StageToSet) == False ; #DEBUG_LINE_NO:22
      QuestToSetStage.SetStage(StageToSet) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
