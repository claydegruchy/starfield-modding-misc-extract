ScriptName EnableDisableOnItemRemoved Extends ObjectReference
{ Enables or disables this object's linked ref when an item is removed from this container. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Keyword Property LinkKeyword Auto Const
  { If set, enable or disable the link with this keyword. Defaults to NONE. }
  Bool Property ShouldEnable = True Auto Const
  { Default=TRUE. Should we disable or enable the linked ref? }
  Bool Property doOnce = True Auto Const
  { If set to TRUE (DEFAULT) then this will only run once. }
EndGroup


;-- State -------------------------------------------
State Done

  Event OnActivate(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    If ShouldEnable ; #DEBUG_LINE_NO:
      Self.GetLinkedRef(LinkKeyword).Enable(False) ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.GetLinkedRef(LinkKeyword).Disable(False) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If doOnce == True ; #DEBUG_LINE_NO:
      Self.gotoState("Done") ; #DEBUG_LINE_NO:
      Self.RemoveInventoryEventFilter(None) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event onLoad()
    Self.AddInventoryEventFilter(None) ; #DEBUG_LINE_NO:19
  EndEvent
EndState
