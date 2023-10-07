ScriptName MS04PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Book Property Slate1 Auto Const
Book Property Slate02 Auto Const
FormList Property MS04SlateFilter Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(MS04SlateFilter as Form) ; #DEBUG_LINE_NO:8
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == Slate1 as Form ; #DEBUG_LINE_NO:15
    Self.GetOwningQuest().SetStage(355) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  If akBaseItem == Slate02 as Form ; #DEBUG_LINE_NO:20
    Self.GetOwningQuest().SetStage(360) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
