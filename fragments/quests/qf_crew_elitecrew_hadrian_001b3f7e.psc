ScriptName Fragments:Quests:QF_CREW_EliteCrew_Hadrian_001B3F7E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PotentialCrewFaction Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory
Quest Property DialogueRedDevilsHQ Auto Const
Perk Property Crew_BurnTolerance Auto Const
Perk Property Crew_PainTolerance Auto Const
Perk Property Crew_Xenosociology Auto Const
Keyword Property SQ_Followers_SandboxWhilePlayerLoiters_Allowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  DialogueRedDevilsHQ.SetStage(120) ; #DEBUG_LINE_NO:8
  Self.SetStage(1) ; #DEBUG_LINE_NO:11
  Self.SetStage(50) ; #DEBUG_LINE_NO:12
  (Alias_Hadrian.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:15
  Alias_Hadrian.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:24
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:25
  Alias_Hadrian.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:30
  Alias_Hadrian.GetActorRef().AddPerk(Crew_BurnTolerance, False) ; #DEBUG_LINE_NO:34
  Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance, False) ; #DEBUG_LINE_NO:35
  Alias_Hadrian.GetActorRef().AddPerk(Crew_PainTolerance, False) ; #DEBUG_LINE_NO:36
  Alias_Hadrian.GetActorRef().AddPerk(Crew_Xenosociology, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:38
  Alias_Hadrian.GetRef().AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0050_Item_00()
  UCR04_MiscPointer.SetStage(1000) ; #DEBUG_LINE_NO:50
  ObjectReference HadREF = Alias_Hadrian.GetRef() ; #DEBUG_LINE_NO:53
  If !HadREF.HasKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed) ; #DEBUG_LINE_NO:54
    HadREF.AddKeyword(SQ_Followers_SandboxWhilePlayerLoiters_Allowed) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:64
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:65
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetStage(410) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:84
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:85
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:88
EndFunction
