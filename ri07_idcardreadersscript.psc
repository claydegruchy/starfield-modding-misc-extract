ScriptName RI07_IDCardReadersScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterForCustomEvent((akSenderRef as idcardreader) as ScriptObject, "idcardreader_IDReaderActivatedFailure") ; #DEBUG_LINE_NO:8
EndEvent

Event IDCardReader.IDReaderActivatedFailure(idcardreader akSender, Var[] kargs)
  Quest CurrentQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:13
  If CurrentQuest.GetStageDone(iPreReqStage) && !CurrentQuest.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:15
    CurrentQuest.SetStage(iStageToSet) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent
