ScriptName DefaultLevelGatedScript Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Mandatory_Properties
  GlobalVariable Property LevelGatedSentryGlobal Auto Const mandatory
  Race Property SentryBotRace Auto Const mandatory
  GlobalVariable Property LevelGatedDeathclawGlobal Auto Const mandatory
  Race Property DeathclawRace Auto Const mandatory
  GlobalVariable Property LevelGatedBehemothGlobal Auto Const mandatory
  Race Property SupermutantBehemothRace Auto Const mandatory
  GlobalVariable Property LevelGatedMirelurkQueenGlobal Auto Const mandatory
  Race Property MirelurkQueenRace Auto Const mandatory
  GlobalVariable Property LevelGatedGenericGlobal Auto Const mandatory
EndGroup

Group Optional_Properties
  Int Property LevelGateOverride = -1 Auto Const
  { If set then everything else is ignored, and if the player's level is equal to
	or greater than this Override Onload() this refrence will enable. }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State WaitingForGate

  Event OnLoad()
    If LevelGateOverride == -1 ; #DEBUG_LINE_NO:28
      Actor selfActor = (Self as ObjectReference) as Actor ; #DEBUG_LINE_NO:29
      If selfActor ; #DEBUG_LINE_NO:31
        If selfActor.GetRace() == SentryBotRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedSentryGlobal.GetValue()) ; #DEBUG_LINE_NO:33
          Self.GoToState("Done") ; #DEBUG_LINE_NO:35
          Self.Enable(False) ; #DEBUG_LINE_NO:36
        ElseIf selfActor.GetRace() == DeathclawRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedDeathclawGlobal.GetValue()) ; #DEBUG_LINE_NO:37
          Self.GoToState("Done") ; #DEBUG_LINE_NO:39
          Self.Enable(False) ; #DEBUG_LINE_NO:40
        ElseIf selfActor.GetRace() == SupermutantBehemothRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedBehemothGlobal.GetValue()) ; #DEBUG_LINE_NO:41
          Self.GoToState("Done") ; #DEBUG_LINE_NO:43
          Self.Enable(False) ; #DEBUG_LINE_NO:44
        ElseIf selfActor.GetRace() == MirelurkQueenRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedMirelurkQueenGlobal.GetValue()) ; #DEBUG_LINE_NO:45
          Self.GoToState("Done") ; #DEBUG_LINE_NO:47
          Self.Enable(False) ; #DEBUG_LINE_NO:48
        ElseIf selfActor.GetRace() != SentryBotRace && selfActor.GetRace() != DeathclawRace && selfActor.GetRace() != SupermutantBehemothRace && selfActor.GetRace() != MirelurkQueenRace && (Game.GetPlayer().GetLevel() as Float >= LevelGatedGenericGlobal.GetValue()) ; #DEBUG_LINE_NO:49
          Self.GoToState("Done") ; #DEBUG_LINE_NO:51
          Self.Enable(False) ; #DEBUG_LINE_NO:52
        EndIf ; #DEBUG_LINE_NO:
      ElseIf Game.GetPlayer().GetLevel() as Float >= LevelGatedGenericGlobal.GetValue() ; #DEBUG_LINE_NO:56
        Self.GoToState("Done") ; #DEBUG_LINE_NO:58
        Self.Enable(False) ; #DEBUG_LINE_NO:59
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Game.GetPlayer().GetLevel() >= LevelGateOverride ; #DEBUG_LINE_NO:64
      Self.GoToState("Done") ; #DEBUG_LINE_NO:66
      Self.Enable(False) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
