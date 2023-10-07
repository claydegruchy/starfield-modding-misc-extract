ScriptName Drug02_CraftAmpScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Form Property FormToCheck Auto Const
Int Property StageToSet Auto Const
researchproject Property Drug_Research_T1_Amp Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnPlayerCraftItem") ; #DEBUG_LINE_NO:4
  Self.RegisterForRemoteEvent(Self as ScriptObject, "OnPlayerCompleteResearch") ; #DEBUG_LINE_NO:5
EndEvent

Event OnPlayerCraftItem(ObjectReference akBench, Location akLocation, Form akCreatedItem)
  If akCreatedItem == FormToCheck ; #DEBUG_LINE_NO:12
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerCompleteResearch(ObjectReference akBench, Location akLocation, researchproject akCompletedProject)
  If akCompletedProject == Drug_Research_T1_Amp ; #DEBUG_LINE_NO:21
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent
