ScriptName Fragments:Quests:QF_UCR01_001EBDD5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DebugTarget Auto Const mandatory
GlobalVariable Property UC09_PlayerChoiceResult Auto Const mandatory
GlobalVariable Property UCR01_TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_MarineOfficer Auto Const mandatory
ReferenceAlias Property Alias_Marine Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_TerrorMorphSuperBug Auto Const mandatory
Quest Property UC09 Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
Faction Property UCR01_AcelesTeamEnemy Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphEssential Auto Const mandatory
Quest Property DialogueUCFaction Auto Const mandatory
Topic Property UCR01_MarineOfficer_QuestComplete_Losses Auto Const mandatory
Topic Property UCR01_MarineOfficer_QuestComplete_NoLosses Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphFriendFaction Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ActorValue Property UCR01_QuestComplete Auto Const mandatory
GlobalVariable Property UCR01_AcelesChance Auto Const mandatory
GlobalVariable Property UCR01_ExtraMorphChance Auto Const mandatory
ReferenceAlias Property Alias_ExtraMorph Auto Const mandatory
RefCollectionAlias Property Alias_AllMorphs Auto Const mandatory
RefCollectionAlias Property Alias_TerrormorphFriendCollection Auto Const mandatory
ActorValue Property DMP_ReleaseHoldPosition Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(Alias_DebugTarget.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Utility.RandomFloat(0.0, 100.0) <= UCR01_ExtraMorphChance.GetValue() ; #DEBUG_LINE_NO:16
    Actor ExREF = Alias_ExtraMorph.GetActorRef() ; #DEBUG_LINE_NO:17
    ExREF.SetValue(DMP_ReleaseHoldPosition, 1.0) ; #DEBUG_LINE_NO:18
    Alias_AllMorphs.AddRef(ExREF as ObjectReference) ; #DEBUG_LINE_NO:19
    Alias_TerrormorphFriendCollection.AddRef(ExREF as ObjectReference) ; #DEBUG_LINE_NO:20
    ExREF.Enable(False) ; #DEBUG_LINE_NO:21
    Self.SetStage(105) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
  If UC09_PlayerChoiceResult.GetValue() == 1.0 && UCR01_TimesCompleted.GetValue() >= 1.0 && Utility.RandomFloat(0.0, 100.0) <= UCR01_AcelesChance.GetValue() ; #DEBUG_LINE_NO:26
    Self.SetStage(110) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  Actor SuperREF = Alias_TerrorMorphSuperBug.GetActorRef() ; #DEBUG_LINE_NO:30
  Alias_TerrormorphFriendCollection.AddRef(SuperREF as ObjectReference) ; #DEBUG_LINE_NO:31
  Alias_AllMorphs.AddRef(SuperREF as ObjectReference) ; #DEBUG_LINE_NO:32
  SuperREF.SetValue(DMP_ReleaseHoldPosition, 1.0) ; #DEBUG_LINE_NO:33
  SuperREF.Enable(False) ; #DEBUG_LINE_NO:34
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:35
  If !DialogueUCFaction.GetStageDone(550) ; #DEBUG_LINE_NO:39
    DialogueUCFaction.SetStage(550) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_Aceles.GetRef().Enable(False) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0125_Item_00()
  Alias_TerrormorphFriendCollection.RemoveAll() ; #DEBUG_LINE_NO:57
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:60
    Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0130_Item_00()
  Alias_TerrormorphFriendCollection.RemoveAll() ; #DEBUG_LINE_NO:70
  If Self.GetStageDone(110) ; #DEBUG_LINE_NO:73
    Alias_AllMorphs.AddToFaction(UCR01_AcelesTeamEnemy) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:84
  Alias_TerrorMorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor ACRef = Alias_Aceles.GetActorRef() ; #DEBUG_LINE_NO:94
  ACRef.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:95
  ACRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:96
  Self.SetStage(125) ; #DEBUG_LINE_NO:98
  Alias_TerrorMorph.GetActorRef().AddToFaction(UCR01_AcelesTeamEnemy) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_1000_Item_00()
  UCR01_TimesCompleted.SetValue(UCR01_TimesCompleted.GetValue() + 1.0) ; #DEBUG_LINE_NO:107
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:108
  Actor MarineOffACT = Alias_MarineOfficer.GetActorRef() ; #DEBUG_LINE_NO:111
  If !MarineOffACT.IsDisabled() ; #DEBUG_LINE_NO:112
    Actor TMRef = Alias_TerrorMorph.GetActorRef() ; #DEBUG_LINE_NO:115
    TMRef.SetValue(UCR01_QuestComplete, 1.0) ; #DEBUG_LINE_NO:116
    TMRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:117
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:119
    Alias_MarineOfficer.GetActorRef().StopCombatAlarm() ; #DEBUG_LINE_NO:121
    Alias_Marine.GetActorRef().StopCombatAlarm() ; #DEBUG_LINE_NO:122
    Alias_Aceles.GetActorRef().StopCombatAlarm() ; #DEBUG_LINE_NO:123
    If Self.GetStageDone(175) ; #DEBUG_LINE_NO:125
      MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_Losses, None, False, None) ; #DEBUG_LINE_NO:126
    Else ; #DEBUG_LINE_NO:
      MarineOffACT.Say(UCR01_MarineOfficer_QuestComplete_NoLosses, None, False, None) ; #DEBUG_LINE_NO:128
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:132
  Self.Reset() ; #DEBUG_LINE_NO:133
EndFunction
