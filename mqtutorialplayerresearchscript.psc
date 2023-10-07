ScriptName MQTutorialPlayerResearchScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property StageToSet = 100 Auto Const

;-- Functions ---------------------------------------

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, researchproject akCompletedProject)
  Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:6
EndEvent
