ScriptName Fragments:Quests:QF_FFNeonZ01_000B2A73 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Stratos Auto Const mandatory
Quest Property FFNeonZ01_SpeechChallengeQuest Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
GlobalVariable Property CreditAmount Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property FFNeonZ01_BribeLarge Auto Const mandatory
Potion Property Drug_Aurora Auto Const mandatory
Quest Property FFNeonGuardPointer_Z01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0004_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, FFNeonZ01_BribeLarge.GetValueInt(), False, None) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, CreditAmount.GetValueInt(), False, None) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0008_Item_00()
  Game.GetPlayer().RemoveItem(Drug_Aurora as Form, 1, False, None) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:31
  Alias_Stratos.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:32
  FFNeonZ01_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:33
  FFNeonGuardPointer_Z01.SetStage(200) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0011_Item_00()
  If !Self.GetStageDone(30) ; #DEBUG_LINE_NO:44
    Self.SetObjectiveSkipped(30) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:55
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().AddItem(Alias_Slate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:73
  If !Self.GetStageDone(30) ; #DEBUG_LINE_NO:74
    Self.SetObjectiveSkipped(30) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:85
  Game.GetPlayer().RemoveItem(Alias_Slate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:86
  FFNeonZ01_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:87
  DialogueFCNeon.SetStage(120) ; #DEBUG_LINE_NO:88
  Self.Stop() ; #DEBUG_LINE_NO:89
EndFunction
