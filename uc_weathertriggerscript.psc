ScriptName UC_WeatherTriggerScript Extends ObjectReference Const
{ Set or force a weather on the player when this trigger loads }

;-- Variables ---------------------------------------
Int iTimerID = 1 Const
Int iTimerLoop = 5 Const

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
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If Self.IsEnabled() ; #DEBUG_LINE_NO:21
    Self.StartWeatherChange() ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartWeatherChange()
  If Weather.GetCurrentWeather() != TargetWeather ; #DEBUG_LINE_NO:28
    TargetWeather.SetActive(SetAsOverride, UseAcceleratedTransition) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  Self.StartTimer(iTimerLoop as Float, iTimerID) ; #DEBUG_LINE_NO:32
EndFunction

Function CleanupWeather()
  If SetAsOverride ; #DEBUG_LINE_NO:36
    Weather.ReleaseOverride() ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckCleanupCriteria()
  If !Self.Is3DLoaded() ; #DEBUG_LINE_NO:43
    Self.CleanupWeather() ; #DEBUG_LINE_NO:45
  Else ; #DEBUG_LINE_NO:
    Self.StartWeatherChange() ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTimerID ; #DEBUG_LINE_NO:53
    Self.CheckCleanupCriteria() ; #DEBUG_LINE_NO:54
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:62
EndFunction
