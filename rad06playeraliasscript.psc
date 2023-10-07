ScriptName RAD06PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property ResourceToLookFor Auto
Int Property QuantityToLookFor Auto

;-- Functions ---------------------------------------

Function RefreshFilter()
  Self.AddInventoryEventFilter(ResourceToLookFor as Form) ; #DEBUG_LINE_NO:7
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == ResourceToLookFor as Form ; #DEBUG_LINE_NO:12
    If Self.GetRef().GetItemCount(ResourceToLookFor as Form) >= QuantityToLookFor ; #DEBUG_LINE_NO:13
      Self.GetOwningQuest().SetStage(200) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
