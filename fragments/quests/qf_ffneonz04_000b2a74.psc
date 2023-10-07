ScriptName Fragments:Quests:QF_FFNeonZ04_000B2A74 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFNeonZ04_DietrichBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property FFNeonZ04_SpeechChallengeQuest Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property FFNeonGuardPointer_Z04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  If !DialogueFCNeon.GetStageDone(445) ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  FFNeonZ04_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:12
  FFNeonGuardPointer_Z04.SetStage(200) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ04_DietrichBribe.GetValueInt(), False, None) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:31
  If !DialogueFCNeon.GetStageDone(445) ; #DEBUG_LINE_NO:32
    Self.SetObjectiveSkipped(15) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:35
  DialogueFCNeon.SetStage(160) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:44
  FFNeonZ04_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueFCNeon.SetStage(225) ; #DEBUG_LINE_NO:53
  Self.Stop() ; #DEBUG_LINE_NO:54
EndFunction
