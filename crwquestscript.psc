ScriptName CRWQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CrewPosition Auto Const mandatory
ReferenceAlias Property CrewName Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Faction Property CurrentCrewFaction Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
Message Property HiredMessage Auto Const mandatory
Message Property FiredMessage Auto Const mandatory

;-- Functions ---------------------------------------

Function CrewHired()
  CrewPosition.ForceRefTo(CrewName.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:15
  CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction, 0) ; #DEBUG_LINE_NO:16
  CrewName.GetActorRef().SetFactionRank(PotentialCrewFaction, -1) ; #DEBUG_LINE_NO:17
  CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction, -1) ; #DEBUG_LINE_NO:18
  HiredMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:19
EndFunction

Function CrewFired()
  CrewPosition.Clear() ; #DEBUG_LINE_NO:26
  CrewName.GetActorRef().SetFactionRank(CurrentCrewFaction, -1) ; #DEBUG_LINE_NO:27
  CrewName.GetActorRef().SetFactionRank(AvailableCrewFaction, 0) ; #DEBUG_LINE_NO:28
  FiredMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:29
EndFunction
