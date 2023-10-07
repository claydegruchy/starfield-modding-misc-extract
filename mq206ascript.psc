ScriptName MQ206AScript Extends Quest conditional

;-- Variables ---------------------------------------
Int MemorialTalksTotalBarrett = 11
Int MemorialTalksTotalSam = 12
Int MemorialTalksTotalSarah = 11
Int MemorialTalksTotalStandard = 10

;-- Properties --------------------------------------
inputenablelayer Property MQ206AEnableLayer Auto hidden
ReferenceAlias Property CompanionWhoDies Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
Int Property MemorialTalkDoneStage = 500 Auto Const
Int Property MemorialReadyStage = 20 Auto Const
Int Property MemorialPlayerArrivedStage = 35 Auto Const
Int Property MemorialPlayerSkippedStage = 900 Auto Const
Int Property SonaStage = 1000 Auto Const
GlobalVariable Property MQ206AMemorialDays Auto Const mandatory
GlobalVariable Property GameDaysPassed Auto Const mandatory
Float Property MemorialGameDaysPassed Auto
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
GlobalVariable Property COM_SQ01_SonaLeft Auto Const mandatory
Int Property MemorialTalksCount Auto conditional

;-- Functions ---------------------------------------

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == 10 ; #DEBUG_LINE_NO:28
    If GameDaysPassed.GetValue() >= MemorialGameDaysPassed ; #DEBUG_LINE_NO:30
      Self.SetStage(MemorialReadyStage) ; #DEBUG_LINE_NO:31
    ElseIf Self.ModObjectiveGlobal(-1.0, MQ206AMemorialDays, -1, 0.0, False, True, True, False) ; #DEBUG_LINE_NO:33
      Self.SetStage(MemorialReadyStage) ; #DEBUG_LINE_NO:34
    Else ; #DEBUG_LINE_NO:
      Self.StartTimerGameTime(24.0, 10) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
  ElseIf aiTimerID == 20 ; #DEBUG_LINE_NO:38
    If Self.GetStageDone(MemorialPlayerArrivedStage) == False ; #DEBUG_LINE_NO:40
      Self.SetStage(MemorialPlayerSkippedStage) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CallMemorialTimer()
  Self.StartTimerGameTime(24.0, 20) ; #DEBUG_LINE_NO:48
EndFunction

Function CancelMemorialTimer()
  Self.CancelTimerGameTime(20) ; #DEBUG_LINE_NO:52
EndFunction

Function SetMemorialWaitGameDay()
  MemorialGameDaysPassed = GameDaysPassed.GetValue() + 5.0 ; #DEBUG_LINE_NO:57
  Self.StartTimerGameTime(24.0, 10) ; #DEBUG_LINE_NO:58
EndFunction

Function UpdateGameTimeOnSkip()
  Self.CancelMemorialTimer() ; #DEBUG_LINE_NO:62
  Float SkipTimeFloat = (MemorialGameDaysPassed - GameDaysPassed.GetValue()) * 24.0 ; #DEBUG_LINE_NO:63
  Int SkipTimeInt = Math.Floor(SkipTimeFloat) ; #DEBUG_LINE_NO:64
  Game.PassTime(SkipTimeInt) ; #DEBUG_LINE_NO:65
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:66
  Self.SetStage(19) ; #DEBUG_LINE_NO:67
EndFunction

Function SetMemorialTalksTotal()
  Actor DeadCompanionREF = CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:72
  If DeadCompanionREF == SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:74
    MemorialTalksCount = MemorialTalksTotalSarah ; #DEBUG_LINE_NO:75
    If COM_Quest_SarahMorgan_Q01.GetStageDone(SonaStage) && COM_SQ01_SonaLeft.GetValueInt() >= 1 ; #DEBUG_LINE_NO:77
      MemorialTalksCount += 1 ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
  ElseIf DeadCompanionREF == Barrett.GetActorRef() ; #DEBUG_LINE_NO:80
    MemorialTalksCount = MemorialTalksTotalBarrett ; #DEBUG_LINE_NO:81
  ElseIf DeadCompanionREF == SamCoe.GetActorRef() ; #DEBUG_LINE_NO:82
    MemorialTalksCount = MemorialTalksTotalSam ; #DEBUG_LINE_NO:83
  Else ; #DEBUG_LINE_NO:
    MemorialTalksCount = MemorialTalksTotalStandard ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckMemorialTalks()
  MemorialTalksCount -= 1 ; #DEBUG_LINE_NO:91
  If MemorialTalksCount <= 0 ; #DEBUG_LINE_NO:93
    Self.SetStage(MemorialTalkDoneStage) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
EndFunction
