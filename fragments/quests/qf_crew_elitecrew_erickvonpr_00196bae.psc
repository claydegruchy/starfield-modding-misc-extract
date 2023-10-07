ScriptName Fragments:Quests:QF_CREW_EliteCrew_ErickvonPr_00196BAE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Erick Auto Const
Faction Property PotentialCrewFaction Auto Const
Perk Property CREW_Ship_Piloting Auto Const
Quest Property CityCY_Startup01 Auto Const
Perk Property CREW_Ship_Payloads Auto Const
Perk Property CREW_Ship_Astrodynamics Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  CityCY_Startup01.SetStage(410) ; #DEBUG_LINE_NO:8
  CityCY_Startup01.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Erick.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Erick.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Actor ErickRef = Erick.GetActorRef() ; #DEBUG_LINE_NO:33
  ErickRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:35
  ErickRef.AddPerk(CREW_Ship_Payloads, False) ; #DEBUG_LINE_NO:36
  ErickRef.AddPerk(CREW_Ship_Astrodynamics, False) ; #DEBUG_LINE_NO:37
  ErickRef.AddPerk(CREW_Ship_Astrodynamics, False) ; #DEBUG_LINE_NO:38
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:47
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:48
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0600_Item_00()
  Erick.GetActorRef().AddPerk(CREW_Ship_Piloting, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0700_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:68
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:71
EndFunction
