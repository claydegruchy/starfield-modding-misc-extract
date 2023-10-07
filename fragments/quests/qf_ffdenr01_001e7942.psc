ScriptName Fragments:Quests:QF_FFDenR01_001E7942 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FFDenR01_Poster Auto Const mandatory
ReferenceAlias Property Alias_Poster01Activator Auto Const mandatory
ReferenceAlias Property Alias_Poster02Activator Auto Const mandatory
ReferenceAlias Property Alias_DenPosters Auto Const mandatory
ReferenceAlias Property Alias_Poster03Activator Auto Const mandatory
ReferenceAlias Property Alias_Poster01Static Auto Const mandatory
ReferenceAlias Property Alias_Poster02Static Auto Const mandatory
ReferenceAlias Property Alias_Poster03Static Auto Const mandatory
LocationAlias Property Alias_NewAtlantisLocation Auto Const mandatory
LocationAlias Property Alias_TargetLocation Auto Const mandatory
GlobalVariable Property pFFDenR01_Completions Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc03 Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc01 Auto Const mandatory
ReferenceAlias Property Alias_Poster01Misc02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(15) ; #DEBUG_LINE_NO:15
    Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:18
  Alias_DenPosters.GetReference().Enable(False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:28
  Game.GetPlayer().AddItem(Alias_Poster01Misc01.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:29
  Game.GetPlayer().AddItem(Alias_Poster01Misc02.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:30
  Game.GetPlayer().AddItem(Alias_Poster01Misc03.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:31
  Alias_Poster01Activator.GetReference().Enable(False) ; #DEBUG_LINE_NO:32
  Alias_Poster02Activator.GetReference().Enable(False) ; #DEBUG_LINE_NO:33
  Alias_Poster03Activator.GetReference().Enable(False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0041_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:51
  Alias_Poster01Activator.GetReference().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:52
  If Self.GetStageDone(42) && Self.GetStageDone(43) ; #DEBUG_LINE_NO:53
    Self.SetStage(100) ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0042_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc02.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:63
  Alias_Poster02Activator.GetReference().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:64
  If Self.GetStageDone(41) && Self.GetStageDone(43) ; #DEBUG_LINE_NO:65
    Self.SetStage(100) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0043_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Poster01Misc03.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:75
  Alias_Poster03Activator.GetReference().GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:76
  If Self.GetStageDone(41) && Self.GetStageDone(42) ; #DEBUG_LINE_NO:77
    Self.SetStage(100) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:87
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Poster01Static.GetReference().Disable(False) ; #DEBUG_LINE_NO:97
  Alias_Poster02Static.GetReference().Disable(False) ; #DEBUG_LINE_NO:98
  Alias_Poster03Static.GetReference().Disable(False) ; #DEBUG_LINE_NO:99
  pFFDenR01_Completions.SetValue((pFFDenR01_Completions.GetValue() as Int + 1) as Float) ; #DEBUG_LINE_NO:101
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:103
  Self.Stop() ; #DEBUG_LINE_NO:104
EndFunction
