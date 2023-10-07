ScriptName Fragments:Quests:QF_DialogueNeonConvo_Securit_0034D426 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueNeonConvo_SecurityCheckpoint Auto Const mandatory
ReferenceAlias Property Alias_ScanSceneEnabler Auto Const mandatory
ReferenceAlias Property Alias_CheckpointController Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  If Alias_ScanSceneEnabler.GetRef().IsDisabled() == True ; #DEBUG_LINE_NO:7
    Alias_ScanSceneEnabler.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
    Alias_CheckpointController.GetRef().Enable(False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  DialogueNeonConvo_SecurityCheckpoint.Start() ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.Reset() ; #DEBUG_LINE_NO:28
EndFunction
