ScriptName RI07_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer MeetingLayer
inputenablelayer NeurosurgeryLayer

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const
Int Property iTurnOffStage Auto Const

;-- Functions ---------------------------------------

Function FreezeControls()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:7
  NeurosurgeryLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:8
  NeurosurgeryLayer.DisablePlayerControls(True, True, False, True, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:9
EndFunction

Function UnfreezeControls()
  NeurosurgeryLayer = None ; #DEBUG_LINE_NO:16
EndFunction

Function FreezeControlsMeeting()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:24
  MeetingLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:25
  MeetingLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function UnfreezeControlsMeeting()
  MeetingLayer = None ; #DEBUG_LINE_NO:32
EndFunction

Function StartDeMarcusTimer()
  Self.StartTimer(60.0, 1) ; #DEBUG_LINE_NO:40
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 && !Self.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:44
    Self.SetStage(iStageToSet) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent
