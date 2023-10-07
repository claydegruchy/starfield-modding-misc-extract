ScriptName OE_KT_FoodGiftFilter Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  FormList Property ItemFilter Auto Const mandatory
  Int Property StageToSet Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(ItemFilter as Form) ; #DEBUG_LINE_NO:9
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akSourceContainer == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent
