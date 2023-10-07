ScriptName Fragments:Quests:QF_DialogueNeonConvo_Securit_0032C7C0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_ScanSceneTrigger Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneTriggerEnabler Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneTriggerDisabler Auto Const mandatory
Scene Property DialogueNeonConvo_SecurityCheckpointScene Auto Const mandatory
Quest Property DialogueNeonConvo_SecurityCheckpoint_Controller Auto Const mandatory
ReferenceAlias Property Alias_CheckpointController Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_ScanSceneTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueNeonConvo_SecurityCheckpointScene.Start() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_ScanSceneTrigger.GetRef().Disable(False) ; #DEBUG_LINE_NO:23
  Alias_ScanSceneTriggerEnabler.GetRef().Disable(False) ; #DEBUG_LINE_NO:24
  Alias_CheckpointController.GetRef().Disable(False) ; #DEBUG_LINE_NO:25
  DialogueNeonConvo_SecurityCheckpoint_Controller.SetStage(20) ; #DEBUG_LINE_NO:27
  Self.Stop() ; #DEBUG_LINE_NO:29
  Self.Reset() ; #DEBUG_LINE_NO:30
EndFunction
