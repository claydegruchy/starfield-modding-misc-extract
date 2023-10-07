ScriptName RI01_TBEmployeeAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If OwningQuest.GetStageDone(iPreReqStage) ; #DEBUG_LINE_NO:9
    OwningQuest.SetStage(iStageToSet) ; #DEBUG_LINE_NO:10
    Self.Clear() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
