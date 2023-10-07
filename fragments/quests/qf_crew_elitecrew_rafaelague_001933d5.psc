ScriptName Fragments:Quests:QF_CREW_EliteCrew_RafaelAgue_001933D5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Rafael Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ207C Auto Const
Quest Property MQ207C_RafaelPostquest Auto Const mandatory
Perk Property Crew_Outpost_Engineering Auto Const
Perk Property CREW_Ship_StarshipEngineering Auto Const
Perk Property Crew_Outpost_AneutronicFusion Auto Const
Perk Property Crew_Scavenging Auto Const
Perk Property Crew_Outpost_Management Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Rafael.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:8
  MQ207C.SetStage(929) ; #DEBUG_LINE_NO:11
  MQ207C.Stop() ; #DEBUG_LINE_NO:12
  Self.SetStage(1) ; #DEBUG_LINE_NO:15
  Self.SetStage(50) ; #DEBUG_LINE_NO:16
  (Rafael.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:19
  Rafael.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:29
  Actor RafaelRef = Rafael.GetActorRef() ; #DEBUG_LINE_NO:34
  RafaelRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:36
  RafaelRef.Enable(False) ; #DEBUG_LINE_NO:37
  RafaelRef.AddPerk(Crew_Outpost_Engineering, False) ; #DEBUG_LINE_NO:38
  RafaelRef.AddPerk(CREW_Ship_StarshipEngineering, False) ; #DEBUG_LINE_NO:39
  RafaelRef.AddPerk(CREW_Ship_StarshipEngineering, False) ; #DEBUG_LINE_NO:40
  RafaelRef.AddPerk(Crew_Outpost_Management, False) ; #DEBUG_LINE_NO:41
  RafaelRef.SetEssential(True) ; #DEBUG_LINE_NO:42
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ207C_RafaelPostquest.SetStage(220) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:63
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:74
  Self.SetStage(700) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:83
  Self.SetStage(700) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:92
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:93
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:96
EndFunction
