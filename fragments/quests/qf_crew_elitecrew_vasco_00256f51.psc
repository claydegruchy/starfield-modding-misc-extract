ScriptName Fragments:Quests:QF_CREW_EliteCrew_Vasco_00256F51 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Vasco Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ101 Auto Const
Perk Property CREW_Ship_Shields Auto Const
Perk Property CREW_Ship_AneutronicFusion Auto Const
Perk Property Crew_Ship_Weapons_EM Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101.SetStage(312) ; #DEBUG_LINE_NO:8
  MQ101.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Vasco.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Vasco.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Vasco.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:32
  Vasco.GetActorRef().AddPerk(CREW_Ship_AneutronicFusion, False) ; #DEBUG_LINE_NO:33
  Vasco.GetActorRef().AddPerk(CREW_Ship_Shields, False) ; #DEBUG_LINE_NO:34
  Vasco.GetActorRef().AddPerk(CREW_Ship_Shields, False) ; #DEBUG_LINE_NO:35
  Vasco.GetActorRef().AddPerk(Crew_Ship_Weapons_EM, False) ; #DEBUG_LINE_NO:36
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:45
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:46
  kmyQuest.Recruited() ; #DEBUG_LINE_NO:49
EndFunction
