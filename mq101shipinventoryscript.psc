ScriptName MQ101ShipInventoryScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int HeliumCount = 10

;-- Properties --------------------------------------
Int Property PrereqStage = 680 Auto Const
Int Property TurnOffStage = 900 Auto Const
Int Property StageToSet = 690 Auto Const
MiscObject Property InorgCommonHelium3 Auto
Int Property HeliumStage = 680 Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(InorgCommonHelium3 as Form) ; #DEBUG_LINE_NO:12
EndEvent

Event OnQuickContainerOpened()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:16
  If myQuest.GetStageDone(PrereqStage) && !myQuest.GetStageDone(TurnOffStage) ; #DEBUG_LINE_NO:17
    myQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:23
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:24
  If akBaseItem == InorgCommonHelium3 as Form ; #DEBUG_LINE_NO:26
    If myRef.GetItemCount(InorgCommonHelium3 as Form) >= HeliumCount ; #DEBUG_LINE_NO:27
      myQuest.SetStage(HeliumStage) ; #DEBUG_LINE_NO:28
      Self.RemoveInventoryEventFilter(InorgCommonHelium3 as Form) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
