ScriptName SQ_Companions_ActiveCompanionScript Extends ReferenceAlias
{ script for whatever companion is currently in ActiveCompanion alias }

;-- Variables ---------------------------------------
Int Skill_LeadershipRecoveryTimerID = 1 Const
Int TimerID_TravelAffinityCoolDown = 2 Const
Bool TravelAffinityCoolDownDone = True

;-- Properties --------------------------------------
Group Perks
  Perk Property Skill_Leadership Auto Const mandatory
  Float Property Skill_Leadership_Rank4_CompanionRecoverChance = 0.5 Auto Const
  { chance (0.0 - 1.0) to recover from bleedout (once per combat) }
  Bool Property Skill_Leadership_HasRecovered Auto hidden
  { set to true when companion recovers - set back to false when combat ends }
  Quest Property PlayerSkills Auto Const mandatory
  { used to check stage for Leadership rank 4 }
  Int Property Skill_Leadership_Rank4Stage = 1504 Auto Const
  { stage to check for Leadership rank 4, since we don't have a papyrus function for that }
  Float Property Skill_LeadershipRecoveryDelay = 10.0 Auto Const
  { seconds between going into bleedout and recovering }
EndGroup

Group Travel_Affinity
  GlobalVariable Property COM_AffinityTravelBonus_PreMQ Auto Const mandatory
  { Autofill }
  GlobalVariable Property COM_AffinityTravelBonus_PostMQ Auto Const mandatory
  { Autofill }
  GlobalVariable Property COM_AffinityTravelCoolDown Auto Const mandatory
  { Autofill }
  Quest Property MQ302B Auto Const mandatory
  { Autofill }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Skill_Leadership_HasRecovered = False ; #DEBUG_LINE_NO:83
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == Skill_LeadershipRecoveryTimerID ; #DEBUG_LINE_NO:87
    Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:88
    If actorRef.IsBleedingOut() ; #DEBUG_LINE_NO:89
      actorRef.RestoreValue(Game.GetHealthAV(), 999.0) ; #DEBUG_LINE_NO:92
      Utility.wait(5.0) ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
    Self.gotoState("recoveryAllowed") ; #DEBUG_LINE_NO:96
  ElseIf aiTimerID == TimerID_TravelAffinityCoolDown ; #DEBUG_LINE_NO:97
    TravelAffinityCoolDownDone = True ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  Self.AwardAffinityTravelBonus() ; #DEBUG_LINE_NO:106
EndEvent

Function AwardAffinityTravelBonus()
  If TravelAffinityCoolDownDone ; #DEBUG_LINE_NO:111
    Int amountToAdd = 0 ; #DEBUG_LINE_NO:112
    If MQ302B.IsCompleted() ; #DEBUG_LINE_NO:114
      amountToAdd = COM_AffinityTravelBonus_PostMQ.GetValueInt() ; #DEBUG_LINE_NO:115
    Else ; #DEBUG_LINE_NO:
      amountToAdd = COM_AffinityTravelBonus_PreMQ.GetValueInt() ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
    (Self.GetActorReference() as companionactorscript).AddAffinity(amountToAdd) ; #DEBUG_LINE_NO:122
    Self.StartTimer_AffinityTravelCoolDown(False) ; #DEBUG_LINE_NO:123
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartTimer_AffinityTravelCoolDown(Bool ExpireTimer)
  TravelAffinityCoolDownDone = False ; #DEBUG_LINE_NO:129
  Float duration = 0.0 ; #DEBUG_LINE_NO:132
  If ExpireTimer == False ; #DEBUG_LINE_NO:133
    duration = COM_AffinityTravelCoolDown.GetValue() ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Self.StartTimer(duration, TimerID_TravelAffinityCoolDown) ; #DEBUG_LINE_NO:140
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:148
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:152
EndFunction

;-- State -------------------------------------------
State noRecovery
EndState

;-- State -------------------------------------------
Auto State recoveryAllowed

  Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
    If aeCombatState == 0 ; #DEBUG_LINE_NO:
      Skill_Leadership_HasRecovered = False ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnEnterBleedout()
    If Skill_Leadership_HasRecovered == False ; #DEBUG_LINE_NO:46
      If PlayerSkills.GetStageDone(Skill_Leadership_Rank4Stage) ; #DEBUG_LINE_NO:47
        Actor actorRef = Self.GetActorRef() ; #DEBUG_LINE_NO:49
        Float recoverRoll = Utility.RandomFloat(0.0, 1.0) ; #DEBUG_LINE_NO:51
        If recoverRoll <= Skill_Leadership_Rank4_CompanionRecoverChance ; #DEBUG_LINE_NO:54
          Skill_Leadership_HasRecovered = True ; #DEBUG_LINE_NO:57
          Self.gotoState("noRecovery") ; #DEBUG_LINE_NO:58
          Self.StartTimer(Skill_LeadershipRecoveryDelay, Skill_LeadershipRecoveryTimerID) ; #DEBUG_LINE_NO:59
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
