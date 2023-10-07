ScriptName Fragments:Quests:QF_CREW_EliteCrew_Lin_001A8D9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Lin Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ104B Auto Const mandatory
Perk Property Crew_Outpost_Management Auto Const
Perk Property Crew_WeightLifting Auto Const
Perk Property Crew_Demolitions Auto Const
ReferenceAlias Property Alias_LinNoSupervisor Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ104B.SetStage(110) ; #DEBUG_LINE_NO:8
  MQ104B.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Lin.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Lin.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Lin.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:31
  Lin.GetActorRef().AddPerk(Crew_Demolitions, False) ; #DEBUG_LINE_NO:32
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False) ; #DEBUG_LINE_NO:33
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False) ; #DEBUG_LINE_NO:34
  Lin.GetActorRef().AddPerk(Crew_Outpost_Management, False) ; #DEBUG_LINE_NO:35
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ104B.SetStage(112) ; #DEBUG_LINE_NO:44
  Alias_LinNoSupervisor.ForceRefTo(Lin.GetRef()) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:54
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:55
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:66
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:67
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:70
EndFunction
