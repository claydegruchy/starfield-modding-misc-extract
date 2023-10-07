ScriptName FFCydoniaR02PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR02_EquipmentNeededCount Auto Const mandatory
Int Property TurnInStage = 300 Auto Const
Weapon Property Eon Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerForItemTracking()
  Self.AddInventoryEventFilter(Eon as Form) ; #DEBUG_LINE_NO:8
  Self.ItemCheck() ; #DEBUG_LINE_NO:9
EndFunction

Function ItemCheck()
  If Self.GetRef().GetItemCount(Eon as Form) as Float >= FFCydoniaR02_EquipmentNeededCount.GetValue() ; #DEBUG_LINE_NO:13
    Self.GetowningQuest().SetStage(TurnInStage) ; #DEBUG_LINE_NO:14
    Self.RemoveInventoryEventFilter(Eon as Form) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If (akBaseItem == Eon as Form) && !Self.GetowningQuest().GetStageDone(TurnInStage) ; #DEBUG_LINE_NO:20
    Self.ItemCheck() ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasInit()
  Self.RegisterPlayerForItemTracking() ; #DEBUG_LINE_NO:26
EndEvent
