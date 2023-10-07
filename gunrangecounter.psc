ScriptName GunRangeCounter Extends ObjectReference
{ Receives info from GunRangeTarget }

;-- Variables ---------------------------------------
Int CurrentScore
Int competitionTimerID = 1 Const
Float fStartTime

;-- Properties --------------------------------------
Group Required_Properties
  Int Property ScoreLimit = -1 Auto Const
  { Score to reach }
  Float Property TimeLimit = 10.0 Auto Const
  { Time limit in seconds }
EndGroup

Group Optional_Properties
  Quest Property QuestToSet Auto Const
  { Quest containing the Stage to set }
  Int Property StageToActivateButton = -1 Auto Const
  { Stage to Set }
  Int Property StageToStartCompetition = -1 Auto Const
  { Stage to Set }
  Int Property StageToSetSuccess = -1 Auto Const
  { Stage to Set }
  Int Property StageToSetFail = -1 Auto Const
  { Stage to Set }
  ObjectReference Property ScoreText Auto
  { Debug text to show score }
  ObjectReference Property TimerText Auto
  { Debug text to show timer }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If QuestToSet.GetCurrentStageID() == StageToActivateButton ; #DEBUG_LINE_NO:49
    QuestToSet.SetStage(StageToStartCompetition) ; #DEBUG_LINE_NO:53
    CurrentScore = 0 ; #DEBUG_LINE_NO:56
    Self.GoToState("AllowCounting") ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function GunRangeCompetition(Int ScorePerHit)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State AllowCounting

  Function GunRangeCompetition(Int ScorePerHit)
    CurrentScore += ScorePerHit ; #DEBUG_LINE_NO:
  EndFunction

  Event OnTimer(Int aiTimerID)
    If aiTimerID == competitionTimerID ; #DEBUG_LINE_NO:
      Int timeDisplay = (TimeLimit - Utility.GetCurrentRealTime() - fStartTime) as Int ; #DEBUG_LINE_NO:
      timeDisplay = Math.Ceiling(timeDisplay as Float) ; #DEBUG_LINE_NO:
      If Utility.GetCurrentRealTime() - fStartTime > TimeLimit ; #DEBUG_LINE_NO:
        If CurrentScore < ScoreLimit ; #DEBUG_LINE_NO:
          If QuestToSet != None ; #DEBUG_LINE_NO:
            QuestToSet.SetStage(StageToSetFail) ; #DEBUG_LINE_NO:
          EndIf ; #DEBUG_LINE_NO:
        ElseIf QuestToSet != None ; #DEBUG_LINE_NO:
          QuestToSet.SetStage(StageToSetSuccess) ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        Self.GoToState("StopCounting") ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.StartTimer(0.5, competitionTimerID) ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    fStartTime = Utility.GetCurrentRealTime() ; #DEBUG_LINE_NO:65
    Self.StartTimer(0.5, competitionTimerID) ; #DEBUG_LINE_NO:66
  EndEvent
EndState

;-- State -------------------------------------------
State StopCounting
EndState
