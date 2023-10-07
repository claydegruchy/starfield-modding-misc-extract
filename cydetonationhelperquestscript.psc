ScriptName CYDetonationHelperQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_DetonationCount Auto Const mandatory
GlobalVariable Property CY_DetonationStartOfDay Auto Const mandatory
GlobalVariable Property CY_DetonationEndOfDay Auto Const mandatory
GlobalVariable Property CY_AnnouncementStartOfDay Auto Const mandatory
GlobalVariable Property CY_AnnouncementEndOfDay Auto Const mandatory
Quest Property DialogueCydonia_Detonation Auto Const mandatory
Quest Property DialogueCydonia_Announcement Auto Const mandatory
Quest Property DialogueCydonia Auto Const mandatory
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
Keyword Property DialogueCydoniaAnnouncementQuestStartKeyword Auto Const mandatory
LocationAlias Property Cydonia Auto Const mandatory
Int Property DetonationTimerID = 0 Auto Const
Float Property DetonationMinTimerLength = 300.0 Auto Const
Float Property DetonationMaxTimerLength = 900.0 Auto Const
Int Property AnnouncementTimerID = 1 Auto Const
Float Property AnnouncementMinTimerLength = 120.0 Auto Const
Float Property AnnouncementMaxTimerLength = 300.0 Auto Const
Int Property EstablishingSceneDoneStage = 15 Auto Const

;-- Functions ---------------------------------------

Function StartDetonationTimer()
  Float fTimer = Utility.RandomFloat(DetonationMinTimerLength, DetonationMaxTimerLength) ; #DEBUG_LINE_NO:23
  Self.StartTimer(fTimer, DetonationTimerID) ; #DEBUG_LINE_NO:24
EndFunction

Function StartAnnouncementTimer()
  Float fTimer = Utility.RandomFloat(AnnouncementMinTimerLength, AnnouncementMaxTimerLength) ; #DEBUG_LINE_NO:28
  Self.StartTimer(fTimer, AnnouncementTimerID) ; #DEBUG_LINE_NO:29
EndFunction

Function StartDetonationSequence()
  If DialogueCydonia_Announcement.IsRunning() ; #DEBUG_LINE_NO:36
    Float fTimer = Utility.RandomFloat(60.0, 120.0) ; #DEBUG_LINE_NO:37
    Self.StartTimer(fTimer, DetonationTimerID) ; #DEBUG_LINE_NO:38
  Else ; #DEBUG_LINE_NO:
    If CY_DetonationCount.GetValue() >= 1.0 && !DialogueCydonia_Detonation.IsRunning() ; #DEBUG_LINE_NO:40
      If Game.GetLocalTime() >= CY_DetonationStartOfDay.GetValue() && Game.GetLocalTime() <= CY_DetonationEndOfDay.GetValue() ; #DEBUG_LINE_NO:41
        If Game.GetPlayer().IsInLocation(Cydonia.GetLocation()) ; #DEBUG_LINE_NO:42
          DialogueCydoniaDetonationQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:43
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.StartDetonationTimer() ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartAnnouncementSequence()
  If DialogueCydonia_Detonation.IsRunning() ; #DEBUG_LINE_NO:55
    Float fTimer = Utility.RandomFloat(60.0, 120.0) ; #DEBUG_LINE_NO:56
    Self.StartTimer(fTimer, AnnouncementTimerID) ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    If !DialogueCydonia_Announcement.IsRunning() ; #DEBUG_LINE_NO:59
      If Game.GetLocalTime() >= CY_AnnouncementStartOfDay.GetValue() && Game.GetLocalTime() <= CY_AnnouncementEndOfDay.GetValue() ; #DEBUG_LINE_NO:60
        Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:61
        If myPlayer.IsInLocation(Cydonia.GetLocation()) && myPlayer.IsInInterior() ; #DEBUG_LINE_NO:62
          DialogueCydoniaAnnouncementQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:63
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.StartAnnouncementTimer() ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnQuestInit()
  Self.StartDetonationTimer() ; #DEBUG_LINE_NO:73
  Self.StartAnnouncementTimer() ; #DEBUG_LINE_NO:74
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == DetonationTimerID ; #DEBUG_LINE_NO:78
    Self.StartDetonationSequence() ; #DEBUG_LINE_NO:79
  ElseIf aiTimerID == AnnouncementTimerID ; #DEBUG_LINE_NO:80
    If DialogueCydonia.GetStageDone(EstablishingSceneDoneStage) ; #DEBUG_LINE_NO:81
      Self.StartAnnouncementSequence() ; #DEBUG_LINE_NO:82
    Else ; #DEBUG_LINE_NO:
      Float fTimer = Utility.RandomFloat(60.0, 120.0) ; #DEBUG_LINE_NO:84
      Self.StartTimer(fTimer, AnnouncementTimerID) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
