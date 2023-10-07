ScriptName Fragments:Quests:QF_FFNewAtlantis01_0024C3A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueUCNewAtlantisSpaceportIntro_001_Scene Auto Const mandatory
Scene Property FFNewAtlantis01_001_Scene Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property FFNewAtlantis01Misc Auto Const mandatory
ReferenceAlias Property Alias_RepresentativeChisolm Auto Const mandatory
ReferenceAlias Property Alias_OfficerWilkes Auto Const mandatory
ReferenceAlias Property Alias_Guard01 Auto Const mandatory
ReferenceAlias Property Alias_Radcliff Auto Const mandatory
Quest Property UC04 Auto Const mandatory
ReferenceAlias Property Alias_RadcliffChairMeetingRoom Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
ReferenceAlias Property Alias_Trigger Auto Const mandatory
GlobalVariable Property CreditsRewardMinorExtortion Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor ChisolmRef = Alias_RepresentativeChisolm.GetActorRef() ; #DEBUG_LINE_NO:7
  Actor GuardRef = Alias_Guard01.GetActorRef() ; #DEBUG_LINE_NO:8
  ChisolmRef.EnableNoWait(False) ; #DEBUG_LINE_NO:10
  GuardRef.MoveTo(ChisolmRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  GuardRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:12
  Alias_OfficerWilkes.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0002_Item_00()
  ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef() ; #DEBUG_LINE_NO:21
  ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef() ; #DEBUG_LINE_NO:22
  If Self.IsObjectiveDisplayed(5) || Self.IsObjectiveDisplayed(10) || !Self.GetStageDone(10) ; #DEBUG_LINE_NO:24
    WilkesRef.DisableNoWait(False) ; #DEBUG_LINE_NO:25
    ChisolmRef.DisableNoWait(False) ; #DEBUG_LINE_NO:26
    Alias_Trigger.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0003_Item_00()
  ObjectReference ChisolmRef = Alias_RepresentativeChisolm.GetRef() ; #DEBUG_LINE_NO:36
  ObjectReference WilkesRef = Alias_OfficerWilkes.GetRef() ; #DEBUG_LINE_NO:37
  If Self.IsObjectiveDisplayed(5) || Self.IsObjectiveDisplayed(10) || !Self.GetStageDone(10) ; #DEBUG_LINE_NO:39
    WilkesRef.EnableNoWait(False) ; #DEBUG_LINE_NO:40
    ChisolmRef.EnableNoWait(False) ; #DEBUG_LINE_NO:41
    Alias_Trigger.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  Alias_RepresentativeChisolm.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:51
  Alias_OfficerWilkes.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:52
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:53
  Self.Stop() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:62
  Alias_RepresentativeChisolm.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:63
  Self.Stop() ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0006_Item_00()
  Self.SetObjectiveCompleted(5, False) ; #DEBUG_LINE_NO:72
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:73
  Self.SetObjectiveDisplayed(5, True, True) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0010_Item_00()
  FFNewAtlantis01_001_Scene.Start() ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(5, True) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Guard01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:98
  Alias_OfficerWilkes.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:99
  Self.SetObjectiveDisplayed(5, True, False) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0030_Item_00()
  FFNewAtlantis01Misc.SetStage(100) ; #DEBUG_LINE_NO:110
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:111
  Alias_Radcliff.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0032_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, 50, False) ; #DEBUG_LINE_NO:120
  Self.SetStage(30) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0034_Item_00()
  Self.SetStage(30) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0036_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, CreditsRewardMinorExtortion.GetValueInt(), False) ; #DEBUG_LINE_NO:137
  Self.SetStage(30) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(10, False, False) ; #DEBUG_LINE_NO:146
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0060_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False) ; #DEBUG_LINE_NO:155
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:179
  Alias_RepresentativeChisolm.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_RepresentativeChisolm.GetRef().MoveTo(Alias_RadcliffChairMeetingRoom.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:188
  Alias_OfficerWilkes.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:189
  Self.Stop() ; #DEBUG_LINE_NO:190
EndFunction
