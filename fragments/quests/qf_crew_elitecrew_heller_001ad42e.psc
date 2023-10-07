ScriptName Fragments:Quests:QF_CREW_EliteCrew_Heller_001AD42E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Heller Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
Quest Property MQ104B Auto Const mandatory
Perk Property Crew_Geology Auto Const
Perk Property Crew_Outpost_Engineering Auto Const
Perk Property Crew_Outpost_Management Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ104B.SetStage(130) ; #DEBUG_LINE_NO:8
  MQ104B.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Alias_Heller.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Alias_Heller.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Actor HellerRef = Alias_Heller.GetActorRef() ; #DEBUG_LINE_NO:31
  HellerRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:32
  HellerRef.AddPerk(Crew_Geology, False) ; #DEBUG_LINE_NO:33
  HellerRef.AddPerk(Crew_Outpost_Engineering, False) ; #DEBUG_LINE_NO:34
  HellerRef.AddPerk(Crew_Outpost_Engineering, False) ; #DEBUG_LINE_NO:35
  HellerRef.AddPerk(Crew_Outpost_Engineering, False) ; #DEBUG_LINE_NO:36
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0050_Item_00()
  MQ104B.SetStage(125) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0050_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:53
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:54
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:65
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:66
  Self.SetStage(200) ; #DEBUG_LINE_NO:69
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:70
EndFunction
