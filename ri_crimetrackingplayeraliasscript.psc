ScriptName RI_CrimeTrackingPlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property RadiantLocation Auto Const mandatory
Int Property iStartTrackingStage Auto Const mandatory
Int Property iStopTrackingStage Auto Const mandatory
Int Property iPreReqTrackingStage Auto Const mandatory
Keyword Property ActorTypeHuman Auto Const mandatory
Perk Property RI_BountyTrackingPerk Auto Const mandatory

;-- Functions ---------------------------------------

Event OnKill(ObjectReference akVictim)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:12
  If MyQuest.GetStageDone(iStartTrackingStage) ; #DEBUG_LINE_NO:14
    If akVictim.GetCurrentLocation() == RadiantLocation.GetLocation() && akVictim.HasKeyword(ActorTypeHuman) ; #DEBUG_LINE_NO:16
      (MyQuest as ri_crimetrackingquestscript).iBodyCount = (MyQuest as ri_crimetrackingquestscript).iBodyCount + 1 ; #DEBUG_LINE_NO:18
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerArrested(ObjectReference akGuard, Location akLocation, Int aeCrimeType)
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:26
  If MyQuest.GetStageDone(iStartTrackingStage) ; #DEBUG_LINE_NO:28
    If akLocation == RadiantLocation.GetLocation() ; #DEBUG_LINE_NO:29
      (MyQuest as ri_crimetrackingquestscript).iTimesArrested = (MyQuest as ri_crimetrackingquestscript).iTimesArrested + 1 ; #DEBUG_LINE_NO:30
      If aeCrimeType <= 1 ; #DEBUG_LINE_NO:32
        (MyQuest as ri_crimetrackingquestscript).iTheftArrest = (MyQuest as ri_crimetrackingquestscript).iTheftArrest + 1 ; #DEBUG_LINE_NO:34
      ElseIf aeCrimeType == 3 ; #DEBUG_LINE_NO:35
        (MyQuest as ri_crimetrackingquestscript).iAttemptedMurderArrest = (MyQuest as ri_crimetrackingquestscript).iAttemptedMurderArrest + 1 ; #DEBUG_LINE_NO:37
      ElseIf aeCrimeType == 4 ; #DEBUG_LINE_NO:38
        (MyQuest as ri_crimetrackingquestscript).iMurderArrest = (MyQuest as ri_crimetrackingquestscript).iMurderArrest + 1 ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Location LocationToCheck = RadiantLocation.GetLocation() ; #DEBUG_LINE_NO:51
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:52
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:53
  If MyQuest.GetStageDone(iPreReqTrackingStage) ; #DEBUG_LINE_NO:55
    If akNewLoc == LocationToCheck ; #DEBUG_LINE_NO:57
      Game.GetPlayer().AddPerk(RI_BountyTrackingPerk, False) ; #DEBUG_LINE_NO:59
    EndIf ; #DEBUG_LINE_NO:
    If akOldLoc == LocationToCheck ; #DEBUG_LINE_NO:61
      PlayerRef.RemovePerk(RI_BountyTrackingPerk) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
