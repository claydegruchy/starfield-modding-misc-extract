ScriptName Fragments:Quests:QF_FFNewAtlantis04_00091CF5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ring Auto Const mandatory
ReferenceAlias Property Alias_Thief Auto Const mandatory
Quest Property FFNewAtlantis05 Auto Const mandatory
Quest Property FFNewAtlantis04_SpeechChallengeQuest Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
ReferenceAlias Property Alias_NPC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  FFNewAtlantis04_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0004_Item_00()
  FFNewAtlantis04_SpeechChallengeQuest.Start() ; #DEBUG_LINE_NO:15
  Alias_NPC.ForceRefTo(Alias_Thief.GetRef()) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis02Misc.SetStage(20) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:42
  Alias_Thief.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:52
  Alias_Thief.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0040_Item_00()
  Game.GetPlayer().AddItem(Alias_Ring.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:61
  Alias_Thief.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:62
  Self.SetStage(50) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Ring.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:88
  Alias_Thief.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:89
  FFNewAtlantis04_SpeechChallengeQuest.Stop() ; #DEBUG_LINE_NO:90
  FFNewAtlantis05.Start() ; #DEBUG_LINE_NO:91
  Self.Stop() ; #DEBUG_LINE_NO:92
EndFunction
