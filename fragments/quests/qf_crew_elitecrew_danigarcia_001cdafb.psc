ScriptName Fragments:Quests:QF_CREW_EliteCrew_DaniGarcia_001CDAFB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Dani Auto Const
Faction Property PotentialCrewFaction Auto Const
MiscObject Property Credits Auto Const
GlobalVariable Property CREW_DaniGarciaCreditAmount Auto Const mandatory
GlobalVariable Property Crew_RecruitCost_TextReplacementValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  (Dani.GetActorRef() as elitecrewdebugscript).DebugMakeActiveEliteCrew() ; #DEBUG_LINE_NO:12
  Dani.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Dani.GetActorRef().SetFactionRank(PotentialCrewFaction, 1) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:30
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:31
  kmyQuest.RecruitedUnasssigned() ; #DEBUG_LINE_NO:34
  CREW_DaniGarciaCreditAmount.SetValue(Crew_RecruitCost_TextReplacementValue.GetValueInt() as Float) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:44
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:45
  kmyQuest.SetCostMultAndUpdateCost(0.5) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:56
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:57
  kmyQuest.SetCostMultAndUpdateCost(1.0) ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:69
  crew_elitecrewquestscript kmyQuest = __temp as crew_elitecrewquestscript ; #DEBUG_LINE_NO:70
  kmyQuest.StartBackstoryTimer() ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().AddItem(Credits as Form, CREW_DaniGarciaCreditAmount.GetValueInt(), False) ; #DEBUG_LINE_NO:82
EndFunction
