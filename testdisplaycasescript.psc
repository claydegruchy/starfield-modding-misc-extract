ScriptName TestDisplayCaseScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function testGetItemCount()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  Self.AddInventoryEventFilter(None) ; #DEBUG_LINE_NO:4
EndEvent
