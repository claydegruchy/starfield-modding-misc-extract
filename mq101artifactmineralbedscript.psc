ScriptName MQ101ArtifactMineralBedScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
ObjectReference[] TriggeredRefArray
Int TriggeredRefArrayIndex = -1

;-- Properties --------------------------------------
ReferenceAlias Property ArtifactDeposit Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage >= 3 ; #DEBUG_LINE_NO:10
    If TriggeredRefArray == None ; #DEBUG_LINE_NO:12
      TriggeredRefArray = new ObjectReference[Self.GetCount()] ; #DEBUG_LINE_NO:14
      TriggeredRefArrayIndex = 0 ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
    If TriggeredRefArray.find(akSenderRef, 0) < 0 ; #DEBUG_LINE_NO:17
      TriggeredRefArray[TriggeredRefArrayIndex] = akSenderRef ; #DEBUG_LINE_NO:19
      TriggeredRefArrayIndex += 1 ; #DEBUG_LINE_NO:20
    EndIf ; #DEBUG_LINE_NO:
    If TriggeredRefArrayIndex >= TriggeredRefArray.Length ; #DEBUG_LINE_NO:23
      Self.GetOwningQuest().SetStage(42) ; #DEBUG_LINE_NO:24
      (ArtifactDeposit.GetRef() as buriedartifact).PickupEnabled = True ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
