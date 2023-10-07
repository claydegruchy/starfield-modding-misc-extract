ScriptName Fragments:Quests:QF_CREW_EliteCrew_AutumnMacM_0019C209 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Autumn Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property FC08 Auto Const
Perk Property Crew_PistolCertification Auto Const
Perk Property Crew_Botany Auto Const
Perk Property Crew_Ship_Payloads Auto Const
Perk Property Crew_Sharpshooting Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Autumn.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:8
  FC08.SetStage(1000) ; #DEBUG_LINE_NO:11
  FC08.Stop() ; #DEBUG_LINE_NO:12
  Self.SetStage(1) ; #DEBUG_LINE_NO:15
  Self.SetStage(50) ; #DEBUG_LINE_NO:16
  (Autumn.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:19
  Autumn.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:29
  Autumn.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:35
  Autumn.GetActorRef().AddPerk(Crew_PistolCertification, False) ; #DEBUG_LINE_NO:36
  Autumn.GetActorRef().AddPerk(Crew_PistolCertification, False) ; #DEBUG_LINE_NO:37
  Autumn.GetActorRef().AddPerk(Crew_Botany, False) ; #DEBUG_LINE_NO:38
  Autumn.GetActorRef().AddPerk(Crew_Sharpshooting, False) ; #DEBUG_LINE_NO:39
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:48
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:49
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:82
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:83
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:94
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:95
  Self.SetStage(450) ; #DEBUG_LINE_NO:98
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:99
EndFunction
