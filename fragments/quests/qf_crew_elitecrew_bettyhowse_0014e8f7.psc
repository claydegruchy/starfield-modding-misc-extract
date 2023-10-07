ScriptName Fragments:Quests:QF_CREW_EliteCrew_BettyHowse_0014E8F7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Betty Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property BettyEncounterQuest Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  (Betty.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:12
  Betty.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:21
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:22
  Betty.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:26
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:36
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:39
    kmyQuest.Recruited() ; #DEBUG_LINE_NO:40
    Self.SetStage(50) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0045_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:50
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:51
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:63
  BettyEncounterQuest.SetStage(30) ; #DEBUG_LINE_NO:68
  If BettyEncounterQuest.GetStageDone(40) ; #DEBUG_LINE_NO:69
    BettyEncounterQuest.SetStage(2000) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:82
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:83
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:86
EndFunction
