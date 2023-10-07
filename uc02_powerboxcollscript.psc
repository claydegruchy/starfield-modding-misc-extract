ScriptName UC02_PowerBoxCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ShutdownStage = 650 Auto Const
{ If this stage has been set, ignore the additional pulls }
Int Property PrereqStage = 601 Auto Const
{ Only start pulling ref's out of this collection once the prereq stage has been set }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  uc02_questscript OQ = Self.GetOwningQuest() as uc02_questscript ; #DEBUG_LINE_NO:10
  If OQ.GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:12
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:13
    If !OQ.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:15
      OQ.UpdatePowerBoxCount(akSenderRef, Self as RefCollectionAlias) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
