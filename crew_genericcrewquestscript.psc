ScriptName Crew_GenericCrewQuestScript Extends Crew_RecruitQuestScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  Keyword Property LinkGenericCrewSpawnMarker Auto Const mandatory
  { The keyword to use to find the linked spawn marker that spawned this Generic Crew. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Alias_CrewMember as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:9
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  CrewMemberRef = Alias_CrewMember.GetActorReference() ; #DEBUG_LINE_NO:13
  If Game.GetPlayer().HasPerk(Trait_Taskmaster) ; #DEBUG_LINE_NO:15
    Self.SetCostMultAndUpdateCost(CostMult_Taskmaster) ; #DEBUG_LINE_NO:16
  Else ; #DEBUG_LINE_NO:
    Self.UpdateCost() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Recruited()
  If CrewMemberRef ; #DEBUG_LINE_NO:24
    crewspawnerscript crewSpawner = CrewMemberRef.GetLinkedRef(LinkGenericCrewSpawnMarker) as crewspawnerscript ; #DEBUG_LINE_NO:27
    If crewSpawner ; #DEBUG_LINE_NO:28
      crewSpawner.RemoveFromSpawnedCrewArray(CrewMemberRef) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Parent.Recruited() ; #DEBUG_LINE_NO:34
EndFunction
