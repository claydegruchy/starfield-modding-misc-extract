ScriptName FFNewHomesteaR02DoorScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStage Auto Const mandatory
ReferenceAlias Property Tourist01 Auto Const mandatory
ReferenceAlias Property Tourist02 Auto Const mandatory
ReferenceAlias Property Tourist03 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Tourist01.GetRef() || akActionRef == Tourist02.GetRef() || akActionRef == Tourist03.GetRef() ; #DEBUG_LINE_NO:9
    Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
    If OwningQuest.GetStageDone(PreReqStage) ; #DEBUG_LINE_NO:11
      akActionRef.Disable(False) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
