ScriptName MQ101FuelBinScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FuelObject Auto
Int Property FuelNeeded Auto
ActorValue Property SpaceshipGravJumpFuel Auto

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(FuelObject as Form) ; #DEBUG_LINE_NO:8
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == FuelObject as Form ; #DEBUG_LINE_NO:12
    If Self.GetRef().GetItemCount(FuelObject as Form) >= FuelNeeded || (Self.GetRef().GetCurrentShipRef().GetValue(SpaceshipGravJumpFuel) as Int >= FuelNeeded) ; #DEBUG_LINE_NO:14
      Self.GetOwningQuest().SetStage(900) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
