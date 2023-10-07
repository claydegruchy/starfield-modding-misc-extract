ScriptName Fragments:Quests:QF_CREW_EliteCrew_AdoringFan_000078DE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property AdoringFan Auto Const
Faction Property PotentialCrewFaction Auto Const
Message Property Trait_UH_WarningMessageEssentialEnd Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_AttackedByPlayer Auto Const mandatory
sq_crewscript Property SQ_Crew Auto Const mandatory
Quest Property TraitUnwantedHero Auto Const mandatory
GlobalVariable Property Trait_UH_FanClubFee Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
MiscObject Property ToiletPaperRoll01Empty Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill01 Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill02 Auto Const mandatory
Scene Property CREW_EliteCrew_AdoringFan_Kill03 Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Faction Property CurrentCrewFaction Auto Const mandatory
RefCollectionAlias Property DisembarkingCrew Auto Const mandatory
RefCollectionAlias Property DismissedCrew Auto Const mandatory
RefCollectionAlias Property CrewGoingToOutposts Auto Const mandatory
ActorValue Property CrewReassignDisabled Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitUnwantedHero.SetStage(75) ; #DEBUG_LINE_NO:8
  TraitUnwantedHero.SetStage(80) ; #DEBUG_LINE_NO:9
  TraitUnwantedHero.SetStage(5) ; #DEBUG_LINE_NO:10
  Self.SetStage(1) ; #DEBUG_LINE_NO:12
  Self.SetStage(50) ; #DEBUG_LINE_NO:13
  Actor FanRef = AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:15
  (FanRef as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:17
  FanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0001_Item_00()
  AdoringFan.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:36
  kmyQuest.DismissSceneEnded() ; #DEBUG_LINE_NO:39
  Actor FanRef = AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:41
  FanRef.SetEssential(False) ; #DEBUG_LINE_NO:42
  SQ_Crew.SetRoleUnavailable(FanRef, True) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:51
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:52
  Actor FanRef = AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:55
  kmyQuest.SetCostMultAndUpdateCost(0.0) ; #DEBUG_LINE_NO:57
  kmyQuest.Recruited() ; #DEBUG_LINE_NO:58
  FanRef.SetProtected(False) ; #DEBUG_LINE_NO:59
  FanRef.SetEssential(True) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:68
  PlayerRef.AddItem(ToiletPaperRoll01Empty as Form, 1, False) ; #DEBUG_LINE_NO:70
  PlayerRef.AddItem(Credits as Form, Trait_UH_FanClubFee.GetValueInt(), False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:79
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:80
  kmyQuest.SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:91
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:92
  Self.SetStage(550) ; #DEBUG_LINE_NO:95
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0650_Item_00()
  CREW_EliteCrew_AdoringFan_Kill01.Stop() ; #DEBUG_LINE_NO:104
  CREW_EliteCrew_AdoringFan_Kill02.Stop() ; #DEBUG_LINE_NO:105
  CREW_EliteCrew_AdoringFan_Kill03.Stop() ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0666_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:114
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:115
  Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:118
  kmyQuest.DismissSceneEnded() ; #DEBUG_LINE_NO:120
  Actor FanRef = AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:121
  FanRef.SetEssential(False) ; #DEBUG_LINE_NO:122
  FanRef.SetProtected(True) ; #DEBUG_LINE_NO:123
  FanRef.RemoveFromFaction(AvailableCrewFaction) ; #DEBUG_LINE_NO:124
  FanRef.RemoveFromFaction(CurrentCrewFaction) ; #DEBUG_LINE_NO:125
  FanRef.RemoveFromFaction(PotentialCrewFaction) ; #DEBUG_LINE_NO:126
  SQ_Crew.SetRoleInactive(FanRef, False, True, False) ; #DEBUG_LINE_NO:127
  DisembarkingCrew.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:128
  CrewGoingToOutposts.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:129
  DismissedCrew.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:130
  FanRef.SetValue(CrewReassignDisabled, 1.0) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0667_Item_00()
  Self.SetStage(9999) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:147
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:148
  Trait_UH_WarningMessageEssentialEnd.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:151
  kmyQuest.DismissSceneEnded() ; #DEBUG_LINE_NO:153
  Actor FanRef = AdoringFan.GetActorRef() ; #DEBUG_LINE_NO:154
  FanRef.SetEssential(False) ; #DEBUG_LINE_NO:155
  FanRef.SetProtected(True) ; #DEBUG_LINE_NO:156
  FanRef.RemoveFromFaction(AvailableCrewFaction) ; #DEBUG_LINE_NO:157
  FanRef.RemoveFromFaction(CurrentCrewFaction) ; #DEBUG_LINE_NO:158
  FanRef.RemoveFromFaction(PotentialCrewFaction) ; #DEBUG_LINE_NO:159
  SQ_Crew.SetRoleInactive(FanRef, False, True, False) ; #DEBUG_LINE_NO:160
  DisembarkingCrew.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:161
  CrewGoingToOutposts.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:162
  DismissedCrew.RemoveRef(FanRef as ObjectReference) ; #DEBUG_LINE_NO:163
  FanRef.SetValue(CrewReassignDisabled, 1.0) ; #DEBUG_LINE_NO:164
  FanRef.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:165
EndFunction
