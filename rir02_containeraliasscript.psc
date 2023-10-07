ScriptName RIR02_ContainerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR02_ConfidentialFiles Auto Const mandatory
Int Property iPlantFilesStage = 200 Auto Const
Int Property iReturnToImogeneStage = 300 Auto Const
Int Property iCompletionStage = 10000 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(RIR02_ConfidentialFiles as Form) ; #DEBUG_LINE_NO:10
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:15
  If !MyQuest.GetStageDone(iReturnToImogeneStage) ; #DEBUG_LINE_NO:18
    MyQuest.SetStage(iReturnToImogeneStage) ; #DEBUG_LINE_NO:20
  Else ; #DEBUG_LINE_NO:
    MyQuest.SetObjectiveCompleted(iPlantFilesStage, True) ; #DEBUG_LINE_NO:23
    MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage, True, False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:31
  If !MyQuest.GetStageDone(iCompletionStage) ; #DEBUG_LINE_NO:33
    MyQuest.SetObjectiveDisplayed(iReturnToImogeneStage, False, False) ; #DEBUG_LINE_NO:35
    MyQuest.SetObjectiveCompleted(iPlantFilesStage, False) ; #DEBUG_LINE_NO:36
    MyQuest.SetObjectiveDisplayed(iPlantFilesStage, True, True) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
