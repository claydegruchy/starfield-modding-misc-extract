ScriptName Fragments:Quests:QF_FFNeonZ02_000A316E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DataSlate Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property FFNeonZ02_SpeechChallengeQuest Auto Const mandatory
Quest Property FFNeonGuardPointer_Z02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:7
  If Self.GetStageDone(10) ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:18
  If Self.GetStageDone(5) ; #DEBUG_LINE_NO:19
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:20
  ElseIf Self.GetStageDone(30) ; #DEBUG_LINE_NO:21
    Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:22
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  FFNeonZ02_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:26
  FFNeonGuardPointer_Z02.SetStage(200) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:37
  If !Self.GetStageDone(5) ; #DEBUG_LINE_NO:38
    Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0035_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:57
  Self.SetStage(70) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:66
  Self.SetStage(70) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveSkipped(5) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveSkipped(30) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:86
  FFNeonZ02_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueFCNeon.SetStage(140) ; #DEBUG_LINE_NO:95
  Self.Stop() ; #DEBUG_LINE_NO:96
EndFunction
