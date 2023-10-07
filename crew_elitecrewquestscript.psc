ScriptName Crew_EliteCrewQuestScript Extends Crew_RecruitQuestScript

;-- Functions ---------------------------------------

Event OnQuestInit()
  CrewMemberRef = Alias_CrewMember.GetActorReference() ; #DEBUG_LINE_NO:4
  If Game.GetPlayer().HasPerk(Trait_Taskmaster) ; #DEBUG_LINE_NO:6
    Self.SetCostMultAndUpdateCost(CostMult_Taskmaster) ; #DEBUG_LINE_NO:7
  Else ; #DEBUG_LINE_NO:
    Self.UpdateCost() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PickupSceneEnded()
  SQ_Crew.SetEliteCrewActive(CrewMemberRef) ; #DEBUG_LINE_NO:15
EndFunction

Function DismissSceneEnded()
  SQ_Crew.SetEliteCrewInActive(CrewMemberRef, False) ; #DEBUG_LINE_NO:20
EndFunction

Function WaitSceneEnded()
  SQ_Followers.CommandWait(CrewMemberRef, None) ; #DEBUG_LINE_NO:25
EndFunction

Function FollowSceneEnded()
  SQ_Followers.CommandFollow(CrewMemberRef) ; #DEBUG_LINE_NO:30
EndFunction

Function GiveItemSceneEnded()
  (CrewMemberRef as com_crew_giveitemactorscript).GiveItems() ; #DEBUG_LINE_NO:34
EndFunction

Function StartBackstoryTimer()
  Float expiry = Utility.ExpiryDay(SQ_Crew.Crew_Elite_BackstoryFollowup_CooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:38
  CrewMemberRef.SetValue(SQ_Crew.Crew_Elite_BackstoryFollowup_Day, expiry) ; #DEBUG_LINE_NO:39
EndFunction
