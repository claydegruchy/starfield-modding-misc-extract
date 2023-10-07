ScriptName MQ_TutorialPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property Contraband Auto Const mandatory
Message Property Tutorial_ContrabandMSGBox Auto Const mandatory

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnAliasInit()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
    If akBaseItem.HasKeyword(Contraband) ; #DEBUG_LINE_NO:
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:
      Tutorial_ContrabandMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:
      Self.RemoveAllInventoryEventFilters() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnAliasInit()
    Self.AddInventoryEventFilter(Contraband as Form) ; #DEBUG_LINE_NO:8
  EndEvent
EndState
