ScriptName Fragments:Quests:QF_CREW_EliteCrew_MathisCast_001BF8A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Mathis Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property CF08_Fleet Auto Const
Perk Property Crew_WeightLifting Auto Const
Perk Property Crew_Incapacitation Auto Const
Perk Property Crew_ParticleBeams Auto Const mandatory
Faction Property CrewElite_PersonalCrimeFaction_MathisCastillo Auto Const mandatory
Faction Property CrimeFactionCrimsonFleet Auto Const mandatory
Perk Property Crew_Ballistics Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CF08_Fleet.SetStage(2000) ; #DEBUG_LINE_NO:8
  CF08_Fleet.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Mathis.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Mathis.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Actor MathisRef = Mathis.GetActorRef() ; #DEBUG_LINE_NO:31
  MathisRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:33
  MathisRef.AddPerk(Crew_WeightLifting, False) ; #DEBUG_LINE_NO:34
  MathisRef.AddPerk(Crew_Ballistics, False) ; #DEBUG_LINE_NO:35
  MathisRef.AddPerk(Crew_Incapacitation, False) ; #DEBUG_LINE_NO:36
  MathisRef.AddPerk(Crew_Incapacitation, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:46
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:47
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0050_Item_01()
  Actor MathisRef = Mathis.GetActorRef() ; #DEBUG_LINE_NO:58
  MathisRef.AddtoFaction(CrewElite_PersonalCrimeFaction_MathisCastillo) ; #DEBUG_LINE_NO:60
  MathisRef.RemovefromFaction(CrimeFactionCrimsonFleet) ; #DEBUG_LINE_NO:61
  MathisRef.SetCrimeFaction(CrewElite_PersonalCrimeFaction_MathisCastillo) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:70
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:71
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:74
EndFunction
