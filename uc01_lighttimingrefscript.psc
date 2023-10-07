ScriptName UC01_LightTimingRefScript Extends ObjectReference Const

;-- Variables ---------------------------------------
Int iShutOffWaitID = 2 Const
Int iTurnOnWaitID = 1 Const

;-- Properties --------------------------------------
Float Property WaitTime = 0.0 Auto Const
{ How long to wait after inital triggering before turning on this lights linked light }
Float Property ShutoffDelayTime = 0.0 Auto Const
{ How long to wait before triggering the shutoff impluse }
Keyword Property UC01_Spotlight_Keyword Auto Const
{ Keyword to control spotlight in conjuction with mural emissive turning on/off }
wwiseevent Property QST_UC01_Lights_Power_On_WEF Auto Const mandatory
{ Sound to play when a light turns on }
wwiseevent Property QST_UC01_Lights_Power_Off_WEF Auto Const mandatory
{ Sound to play when a light turns off }

;-- Functions ---------------------------------------

Function StartLightTimer(Bool bShutoff)
  If !bShutoff ; #DEBUG_LINE_NO:24
    Self.StartTimer(WaitTime, iTurnOnWaitID) ; #DEBUG_LINE_NO:25
  Else ; #DEBUG_LINE_NO:
    Self.StartTimer(ShutoffDelayTime, iShutOffWaitID) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function TriggerLightUpdate(Bool bShutoff)
  UC01_LightTimingRefScript NextLight = Self.GetLinkedRef(None) as UC01_LightTimingRefScript ; #DEBUG_LINE_NO:35
  ObjectReference Spotlight = Self.GetLinkedRef(UC01_Spotlight_Keyword) ; #DEBUG_LINE_NO:36
  If bShutoff ; #DEBUG_LINE_NO:38
    Self.CancelTimer(iTurnOnWaitID) ; #DEBUG_LINE_NO:39
    Self.PlayAnimation("Play02") ; #DEBUG_LINE_NO:40
    If Spotlight != None ; #DEBUG_LINE_NO:41
      Spotlight.Disable(False) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
    QST_UC01_Lights_Power_Off_WEF.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:44
    If NextLight ; #DEBUG_LINE_NO:45
      NextLight.TriggerLightUpdate(True) ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.PlayAnimation("Play01") ; #DEBUG_LINE_NO:50
    If Spotlight != None ; #DEBUG_LINE_NO:51
      Spotlight.Enable(False) ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
    QST_UC01_Lights_Power_On_WEF.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:54
    If NextLight ; #DEBUG_LINE_NO:55
      NextLight.StartLightTimer(False) ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTurnOnWaitID ; #DEBUG_LINE_NO:64
    Self.TriggerLightUpdate(False) ; #DEBUG_LINE_NO:65
  ElseIf aiTimerID == iShutOffWaitID ; #DEBUG_LINE_NO:66
    Self.TriggerLightUpdate(True) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:75
EndFunction
