ScriptName Fragments:Quests:QF_CREW_EliteCrew_AmeliaEarh_0018E24F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Amelia Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MS02 Auto Const
Perk Property CREW_Ship_Piloting Auto Const
Perk Property Crew_RifleCertification Auto Const
GlobalVariable Property Crew_Elite_CanHireAmelia Auto Const
FormList Property FactionSharedCrimeList_AmeliaOnly Auto Const mandatory
Faction Property CrimeFactionCrucible Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MS02.SetStage(1950) ; #DEBUG_LINE_NO:8
  MS02.SetStage(2000) ; #DEBUG_LINE_NO:9
  MS02.Stop() ; #DEBUG_LINE_NO:10
  Self.SetStage(1) ; #DEBUG_LINE_NO:13
  Self.SetStage(50) ; #DEBUG_LINE_NO:14
  Amelia.GetActorRef().EnableNoWait(False) ; #DEBUG_LINE_NO:17
  Amelia.GetActorRef().MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  (Amelia.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:19
  Amelia.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:29
  Actor AmeliaRef = Amelia.GetActorRef() ; #DEBUG_LINE_NO:35
  AmeliaRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:37
  AmeliaRef.AddPerk(CREW_Ship_Piloting, False) ; #DEBUG_LINE_NO:38
  AmeliaRef.AddPerk(CREW_Ship_Piloting, False) ; #DEBUG_LINE_NO:39
  AmeliaRef.AddPerk(Crew_RifleCertification, False) ; #DEBUG_LINE_NO:40
  AmeliaRef.AddPerk(Crew_RifleCertification, False) ; #DEBUG_LINE_NO:41
  Crew_Elite_CanHireAmelia.Mod(1.0) ; #DEBUG_LINE_NO:42
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:51
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:52
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0050_Item_01()
  FactionSharedCrimeList_AmeliaOnly.AddForm(CrimeFactionCrucible as Form) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:71
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:72
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:83
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:84
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:87
EndFunction
