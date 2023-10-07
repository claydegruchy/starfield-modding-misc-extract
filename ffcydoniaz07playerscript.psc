ScriptName FFCydoniaZ07PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFCydoniaZ07_HeartOfMarsTitanium Auto Const mandatory
ReferenceAlias Property HeartOfMarsInv Auto Const mandatory

;-- Functions ---------------------------------------

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == FFCydoniaZ07_HeartOfMarsTitanium as Form ; #DEBUG_LINE_NO:8
    HeartOfMarsInv.ForceRefTo(akItemReference) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasInit()
  Self.AddInventoryEventFilter(FFCydoniaZ07_HeartOfMarsTitanium as Form) ; #DEBUG_LINE_NO:15
EndEvent
