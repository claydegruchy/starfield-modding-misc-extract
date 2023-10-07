ScriptName Fragments:Quests:QF_CREW_EliteCrew_OtherPlaye_00187431 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property OtherYou Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ401b Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  OtherYou.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:8
  MQ401b.SetStage(110) ; #DEBUG_LINE_NO:11
  MQ401b.Stop() ; #DEBUG_LINE_NO:12
  Self.SetStage(1) ; #DEBUG_LINE_NO:15
  Self.SetStage(50) ; #DEBUG_LINE_NO:16
  (OtherYou.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:19
  OtherYou.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:29
  OtherYou.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:33
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:43
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:54
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:55
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:58
EndFunction
