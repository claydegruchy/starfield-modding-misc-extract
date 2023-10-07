ScriptName CityCYRunaway01GuardScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bLoaded = False

;-- Properties --------------------------------------
Int Property LobbyTriggerStage = 470 Auto Const

;-- Functions ---------------------------------------

Function GuardAlarm()
  If Self.GetOwningQuest().GetStageDone(LobbyTriggerStage) ; #DEBUG_LINE_NO:10
    Self.GetActorRef().SendTrespassAlarm(Game.GetPlayer()) ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(2.0, 0) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnLoad()
  If bLoaded == False ; #DEBUG_LINE_NO:19
    Self.GuardAlarm() ; #DEBUG_LINE_NO:20
    bLoaded = True ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerId)
  Self.GuardAlarm() ; #DEBUG_LINE_NO:26
EndEvent
