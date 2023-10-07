ScriptName Fragments:Quests:QF_CREW_EliteCrew_OmariHassa_001594BF Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Omari Auto Const
Faction Property PotentialCrewFaction Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  (Omari.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:12
  Omari.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Omari.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:22
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

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:75
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:76
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:79
EndFunction
