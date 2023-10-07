ScriptName Fragments:Quests:QF_CREW_EliteCrew_JessamineG_001D8AE3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Jessamine Auto Const
Faction Property PotentialCrewFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  (Jessamine.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:12
  Jessamine.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Jessamine.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(15) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:40
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:41
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:52
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:53
  kmyQuest.SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:64
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:65
  kmyQuest.SetCostMultAndUpdateCost(1.0) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:77
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:78
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:81
EndFunction
