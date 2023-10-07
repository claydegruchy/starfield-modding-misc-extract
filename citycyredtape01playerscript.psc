ScriptName CityCYRedTape01PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property InorgCommonIron Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForResourceTracking(Bool bRegister)
  If bRegister ; #DEBUG_LINE_NO:8
    Self.AddInventoryEventFilter(InorgCommonIron as Form) ; #DEBUG_LINE_NO:9
    Self.RunCheckResources() ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    Self.RemoveInventoryEventFilter(InorgCommonIron as Form) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RunCheckResources()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:19
  citycyredtape01questscript myQIScript = myQuest as citycyredtape01questscript ; #DEBUG_LINE_NO:20
  myQIScript.ResourceCheck() ; #DEBUG_LINE_NO:21
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Self.RunCheckResources() ; #DEBUG_LINE_NO:30
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Self.RunCheckResources() ; #DEBUG_LINE_NO:35
EndEvent
