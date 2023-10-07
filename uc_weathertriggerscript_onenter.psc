ScriptName UC_WeatherTriggerScript_OnEnter Extends ObjectReference Const
{ Set or force a weather on the player when this trigger is entered by the player }

;-- Variables ---------------------------------------
Int iTimerID = 1 Const
Int iTimerLoop = 10 Const

;-- Properties --------------------------------------
Group Required_Properties
  Weather Property TargetWeather Auto Const mandatory
  { The weather we want to turn on }
EndGroup

Group Optional_Properties
  Bool Property SetAsOverride = False Auto Const
  { If TRUE, this weather will remain in place until the player leaves this planet OR this trigger unloads }
  Bool Property UseAcceleratedTransition = False Auto Const
  { If TRUE, the game will attempt to transition to this weather in its accelerated state }
  Int Property ShutdownStage = -1 Auto Const
  { If this stage has been set, clean up this weather }
  Quest Property ShutdownQuest Auto Const
  { The quest to check to see if we should shut down this weather }
EndGroup


;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:28
    Self.StartWeatherChange() ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Self.CleanupWeather() ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartWeatherChange()
  If ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:36
    If Weather.GetCurrentWeather() != TargetWeather ; #DEBUG_LINE_NO:37
      TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(iTimerLoop as Float, iTimerID) ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    Self.CleanupWeather() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CleanupWeather()
  If SetAsOverride ; #DEBUG_LINE_NO:48
    Weather.ReleaseOverride() ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckCleanupCriteria()
  If Self.IsInTrigger(Game.GetPlayer() as ObjectReference) && (ShutdownStage == -1 || !ShutdownQuest.GetStageDone(ShutdownStage)) ; #DEBUG_LINE_NO:55
    Self.StartWeatherChange() ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    Self.CleanupWeather() ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:65
    Self.CheckCleanupCriteria() ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:74
EndFunction
