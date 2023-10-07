ScriptName MS01RefCollectionDestroyed Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akSenderRef, ObjectReference akDestroyer)
  If Self.GetCount() <= 1 ; #DEBUG_LINE_NO:5
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:6
  Else ; #DEBUG_LINE_NO:
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
