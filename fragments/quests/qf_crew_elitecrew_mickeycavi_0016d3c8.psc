ScriptName Fragments:Quests:QF_CREW_EliteCrew_MickeyCavi_0016D3C8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Mickey Auto Const
Faction Property PotentialCrewFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  (Mickey.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:12
  Mickey.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Mickey.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:30
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:31
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:43
  kmyQuest.SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:54
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:55
  kmyQuest.SetCostMultAndUpdateCost(1.0) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:68
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:71
EndFunction
