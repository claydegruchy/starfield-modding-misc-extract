ScriptName UC05_CollPowerSwitchScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property AllPowerBackOnStage = 600 Auto Const
{ All power's back on. Set the player up to head downstairs }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:7
  If Self.GetCount() == 0 ; #DEBUG_LINE_NO:9
    Self.GetOwningQuest().SetStage(AllPowerBackOnStage) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
