ScriptName SQ_AlarmScript Extends Quest conditional

;-- Variables ---------------------------------------
Bool alarmTriggered = False conditional

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard AlarmTriggeredLock
Guard triggerAlarmLock

;-- Properties --------------------------------------
ReferenceAlias Property AlarmNPC Auto Const mandatory
{ NPC that will try to trigger an alarm }
ReferenceAlias Property Alarm Auto Const mandatory
{ alarm that NPC will try to reach }
RefCollectionAlias Property Alarms Auto Const mandatory
{ collection of all alarms }
RefCollectionAlias Property AlarmNPCs Auto Const mandatory
{ collection of NPCs who could trigger an alarm }
RefCollectionAlias Property AlarmCameras Auto Const mandatory
{ collection of security cameras who could trigger an alarm }
ActorValue Property SQ_Alarmed Auto Const mandatory
{ actor value to set on alarmed NPCs }
ActorValue Property Suspicious Auto Const mandatory
{ actor value to set on alarmed NPCs }
Scene Property SQ_AlarmScene Auto Const mandatory
{ scene to start when an NPC wants to trigger an alarm }
sq_parentscript Property SQ_Parent Auto Const mandatory
{ for custom events }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(AlarmNPCs as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:35
  Self.RegisterForRemoteEvent(AlarmNPCs as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:36
  Self.RegisterForRemoteEvent(Alarms as ScriptObject, "OnOpen") ; #DEBUG_LINE_NO:37
  Self.RegisterForRemoteEvent(Alarms as ScriptObject, "OnClose") ; #DEBUG_LINE_NO:38
  Self.RegisterForRemoteEvent(AlarmCameras as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:39
  Self.RegisterForRemoteEvent(AlarmCameras as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:40
EndEvent

Event OnQuestStarted()
  Int I = 0 ; #DEBUG_LINE_NO:45
  While I < Alarms.GetCount() ; #DEBUG_LINE_NO:46
    sq_alarmactivatorscript theAlarm = Alarms.GetAt(I) as sq_alarmactivatorscript ; #DEBUG_LINE_NO:47
    If theAlarm ; #DEBUG_LINE_NO:48
      theAlarm.myAlarmQuest = Self ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:51
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Function TriggerAlarmAttempt(Actor alarmActor)
  Guard triggerAlarmLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:57
    If (alarmActor as Bool && alarmTriggered == False) && SQ_AlarmScene.IsPlaying() == False ; #DEBUG_LINE_NO:58
      AlarmNPC.ForceRefTo(alarmActor as ObjectReference) ; #DEBUG_LINE_NO:60
      Alarm.ClearAndRefillAlias() ; #DEBUG_LINE_NO:61
      SQ_AlarmScene.Start() ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function TriggerCameraAlarm(Actor alarmCamera)
  Guard triggerAlarmLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:69
    If alarmCamera as Bool && alarmTriggered == False ; #DEBUG_LINE_NO:70
      SQ_AlarmScene.Stop() ; #DEBUG_LINE_NO:72
      AlarmNPC.ForceRefTo(alarmCamera as ObjectReference) ; #DEBUG_LINE_NO:73
      Alarm.ClearAndRefillAlias() ; #DEBUG_LINE_NO:74
      Self.SetAlarmed(True) ; #DEBUG_LINE_NO:76
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function SetAlarmed(Bool bAlarmed)
  Guard AlarmTriggeredLock ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:86
    If bAlarmed != alarmTriggered ; #DEBUG_LINE_NO:88
      alarmTriggered = bAlarmed ; #DEBUG_LINE_NO:89
      If bAlarmed ; #DEBUG_LINE_NO:92
        SQ_Parent.SendAlarmTriggeredOnEvent(Alarm.GetRef(), AlarmNPC.GetActorRef(), Self) ; #DEBUG_LINE_NO:93
      Else ; #DEBUG_LINE_NO:
        SQ_Parent.SendAlarmTriggeredOffEvent(Alarm.GetRef(), Self) ; #DEBUG_LINE_NO:95
      EndIf ; #DEBUG_LINE_NO:
      Int I = 0 ; #DEBUG_LINE_NO:97
      While I < AlarmNPCs.GetCount() ; #DEBUG_LINE_NO:98
        Actor theActor = AlarmNPCs.GetActorAt(I) ; #DEBUG_LINE_NO:99
        If theActor ; #DEBUG_LINE_NO:100
          theActor.SetValue(SQ_Alarmed, (bAlarmed as Int) as Float) ; #DEBUG_LINE_NO:101
          If bAlarmed && theActor.GetValue(Suspicious) < 1.0 ; #DEBUG_LINE_NO:102
            theActor.SetValue(Suspicious, 1.0) ; #DEBUG_LINE_NO:103
          EndIf ; #DEBUG_LINE_NO:
          theActor.EvaluatePackage(False) ; #DEBUG_LINE_NO:105
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:107
      EndWhile ; #DEBUG_LINE_NO:
      I = 0 ; #DEBUG_LINE_NO:110
      While I < Alarms.GetCount() ; #DEBUG_LINE_NO:111
        sq_alarmactivatorscript theAlarm = Alarms.GetAt(I) as sq_alarmactivatorscript ; #DEBUG_LINE_NO:112
        If theAlarm ; #DEBUG_LINE_NO:113
          theAlarm.SetOpen(bAlarmed) ; #DEBUG_LINE_NO:114
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:116
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event RefCollectionAlias.OnOpen(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akActionRef)
  Self.SetAlarmed(True) ; #DEBUG_LINE_NO:126
EndEvent

Event RefCollectionAlias.OnCombatStateChanged(RefCollectionAlias akCollection, ObjectReference akSenderRef, ObjectReference akTarget, Int aeCombatState)
  If aeCombatState == 1 ; #DEBUG_LINE_NO:132
    If akCollection == AlarmNPCs ; #DEBUG_LINE_NO:133
      Self.TriggerAlarmAttempt(akSenderRef as Actor) ; #DEBUG_LINE_NO:134
    ElseIf akCollection == AlarmCameras ; #DEBUG_LINE_NO:135
      Self.TriggerCameraAlarm(akSenderRef as Actor) ; #DEBUG_LINE_NO:136
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event RefCollectionAlias.OnUnload(RefCollectionAlias akCollection, ObjectReference akSenderRef)
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:143
EndEvent

Function CheckForShutdown()
  If Self.IsRunning() ; #DEBUG_LINE_NO:147
    Int deadorunloaded = AlarmNPCs.GetCountDeadOr3DUnloaded() + AlarmCameras.GetCountDeadOr3DUnloaded() ; #DEBUG_LINE_NO:148
    Int total = AlarmNPCs.GetCount() + AlarmCameras.GetCount() ; #DEBUG_LINE_NO:149
    If deadorunloaded >= total ; #DEBUG_LINE_NO:152
      Self.SetAlarmed(False) ; #DEBUG_LINE_NO:154
      Self.Stop() ; #DEBUG_LINE_NO:155
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(10.0, 0) ; #DEBUG_LINE_NO:158
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  Self.CheckForShutdown() ; #DEBUG_LINE_NO:164
EndEvent
