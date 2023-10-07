ScriptName RI05_OnTriggerEnterRefCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet Auto Const mandatory
Int Property PreReqStage Auto Const mandatory
MagicEffect Property ArtifactPowerVoidForm_Effect Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  If (akActionRef == PlayerRef as ObjectReference) && !PlayerRef.HasMagicEffect(ArtifactPowerVoidForm_Effect) ; #DEBUG_LINE_NO:11
    Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:12
    If OwningQuest.GetStageDone(PreReqStage) ; #DEBUG_LINE_NO:13
      OwningQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
