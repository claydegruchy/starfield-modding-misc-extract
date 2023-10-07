ScriptName Fragments:Quests:QF_CREW_EliteCrew_MoaraOtero_001A430D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Moara Auto Const
Faction Property PotentialCrewFaction Auto Const
Quest Property MQ102 Auto Const
Perk Property CREW_Ship_Weapons_EM Auto Const
Perk Property Crew_Marksmanship Auto Const
Perk Property CREW_Ship_Weapons_Missile Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ102.SetStage(2000) ; #DEBUG_LINE_NO:8
  MQ102.Stop() ; #DEBUG_LINE_NO:9
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  (Moara.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:16
  Moara.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:26
  Actor MoaraRef = Moara.GetActorRef() ; #DEBUG_LINE_NO:31
  MoaraRef.SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:33
  MoaraRef.AddPerk(CREW_Ship_Weapons_EM, False) ; #DEBUG_LINE_NO:34
  MoaraRef.AddPerk(Crew_Marksmanship, False) ; #DEBUG_LINE_NO:35
  MoaraRef.AddPerk(CREW_Ship_Weapons_EM, False) ; #DEBUG_LINE_NO:36
  MoaraRef.AddPerk(Crew_Marksmanship, False) ; #DEBUG_LINE_NO:37
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:46
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:47
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(800) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:85
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:86
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:89
EndFunction
