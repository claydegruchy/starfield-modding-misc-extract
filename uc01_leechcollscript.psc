ScriptName UC01_LeechCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
{ Stage to set once this collecting is cleared }

;-- Functions ---------------------------------------

Event OnObjectDestroyed(ObjectReference akSenderRef, ObjectReference akReference)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:7
  Int iCount = Self.GetCount() ; #DEBUG_LINE_NO:8
  If iCount <= 0 ; #DEBUG_LINE_NO:10
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
