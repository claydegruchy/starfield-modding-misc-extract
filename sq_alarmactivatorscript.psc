ScriptName SQ_AlarmActivatorScript Extends ObjectReference conditional
{ script for the alarm activator; allows native terminals control }

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlarmDisabledGuard

;-- Properties --------------------------------------
Keyword Property SQ_AlarmStoryEvent Auto Const mandatory
{ send story event on load }
Message Property SQ_AlarmActivatorDisabledMessage Auto Const mandatory
{ message when alarm is disabled }
Message Property SQ_AlarmActivatorBlockedMessage Auto Const mandatory
{ message when alarm is disabled }
Bool Property AlarmDisabled = False Auto conditional
{ TRUE if alarm is disabled }
wwiseevent Property AlarmSoundEvent Auto Const
{ Alarm sound that should start playing when the alarm is turned on. }
Keyword Property LinkCustom01 Auto Const
{ Link to Optional sound source for the alarm sound }
sq_alarmscript Property myAlarmQuest Auto hidden

;-- Functions ---------------------------------------

Event OnLoad()
  Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:27
  Self.StartAlarmQuest() ; #DEBUG_LINE_NO:28
EndEvent

Function TurnOnAlarm(Bool turnOn)
  Self.SetOpen(turnOn) ; #DEBUG_LINE_NO:35
  If myAlarmQuest == None || myAlarmQuest.IsRunning() == False ; #DEBUG_LINE_NO:36
    If AlarmSoundEvent ; #DEBUG_LINE_NO:37
      If Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:38
        AlarmSoundEvent.Play(Self.GetLinkedRef(LinkCustom01), None, None) ; #DEBUG_LINE_NO:40
      Else ; #DEBUG_LINE_NO:
        AlarmSoundEvent.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:43
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.StartAlarmQuest() ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  If myAlarmQuest ; #DEBUG_LINE_NO:48
    myAlarmQuest.SetAlarmed(turnOn) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DisableAlarm(Bool DisableAlarm)
  Guard AlarmDisabledGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:55
    AlarmDisabled = DisableAlarm ; #DEBUG_LINE_NO:56
    If DisableAlarm ; #DEBUG_LINE_NO:57
      Self.TurnOnAlarm(False) ; #DEBUG_LINE_NO:58
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetAlarmDisabled()
  Guard AlarmDisabledGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:97
    Return AlarmDisabled ; #DEBUG_LINE_NO:98
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function StartAlarmQuest()
  Quest[] alarmQuests = SQ_AlarmStoryEvent.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, 0, 0) ; #DEBUG_LINE_NO:103
  If alarmQuests.Length > 0 ; #DEBUG_LINE_NO:104
    myAlarmQuest = alarmQuests[0] as sq_alarmscript ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

;-- State -------------------------------------------
State busy

  Event OnActivate(ObjectReference akActionRef)
    Bool disabled = Self.GetAlarmDisabled() ; #DEBUG_LINE_NO:89
    If (akActionRef != Game.GetPlayer() as ObjectReference) && disabled == False ; #DEBUG_LINE_NO:90
      Self.TurnOnAlarm(True) ; #DEBUG_LINE_NO:91
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State ready

  Event OnActivate(ObjectReference akActionRef)
    Bool disabled = Self.GetAlarmDisabled() ; #DEBUG_LINE_NO:66
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:67
      Self.gotostate("busy") ; #DEBUG_LINE_NO:68
      If disabled ; #DEBUG_LINE_NO:69
        SQ_AlarmActivatorDisabledMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:71
      ElseIf Self.GetOpenState() >= 3 ; #DEBUG_LINE_NO:72
        SQ_AlarmActivatorBlockedMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:74
      Else ; #DEBUG_LINE_NO:
        Self.TurnOnAlarm(False) ; #DEBUG_LINE_NO:77
      EndIf ; #DEBUG_LINE_NO:
      Self.gotostate("ready") ; #DEBUG_LINE_NO:79
    ElseIf disabled == False ; #DEBUG_LINE_NO:80
      Self.TurnOnAlarm(True) ; #DEBUG_LINE_NO:81
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
