ScriptName MQ101ArtifactDepositScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQ101ArtifactMineralBedMSG Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:6
  If Self.GetRef().GetCurrentDestructionStage() < 3 ; #DEBUG_LINE_NO:9
    MQ101ArtifactMineralBedMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:10
  Else ; #DEBUG_LINE_NO:
    MyQuest.SetStage(50) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:18
  If aiCurrentStage >= 3 ; #DEBUG_LINE_NO:20
    MyQuest.SetStage(51) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
