ScriptName NativeTerminal:AlarmScript Extends TerminalMenu
{ handles alarms via native terminal }

;-- Variables ---------------------------------------
Bool anyEnabled = False
Bool anyOn = False

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalAlarm_AnyOn Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalAlarm_AnyEnabled Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalAlarm Auto Const mandatory
Int Property menuItemID_TurnOn = 1 Auto Const
Int Property menuItemID_TurnOff = 2 Auto Const
Int Property menuItemID_Disable = 3 Auto Const
Int Property menuItemID_Enable = 4 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:27
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  sq_alarmactivatorscript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm, 100) as sq_alarmactivatorscript[] ; #DEBUG_LINE_NO:33
  sq_alarmactivatorscript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm, None) as sq_alarmactivatorscript[] ; #DEBUG_LINE_NO:34
  anyOn = False ; #DEBUG_LINE_NO:37
  anyEnabled = False ; #DEBUG_LINE_NO:38
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:40
    Self.UpdateTerminalVariablesForArray(linkedRefChain) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:43
    Self.UpdateTerminalVariablesForArray(linkedRefChildren) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalAlarm_AnyOn, (anyOn as Int) as Float) ; #DEBUG_LINE_NO:50
  akTerminalRef.SetValue(NativeTerminalAlarm_AnyEnabled, (anyEnabled as Int) as Float) ; #DEBUG_LINE_NO:51
EndFunction

Function UpdateTerminalVariablesForArray(sq_alarmactivatorscript[] alarmArray)
  Int I = 0 ; #DEBUG_LINE_NO:57
  While I < alarmArray.Length ; #DEBUG_LINE_NO:58
    sq_alarmactivatorscript theAlarm = alarmArray[I] ; #DEBUG_LINE_NO:59
    If theAlarm.GetAlarmDisabled() == False ; #DEBUG_LINE_NO:61
      anyEnabled = True ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
    If theAlarm.GetOpenState() >= 3 ; #DEBUG_LINE_NO:64
      anyOn = True ; #DEBUG_LINE_NO:65
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:67
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  sq_alarmactivatorscript[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalAlarm, 100) as sq_alarmactivatorscript[] ; #DEBUG_LINE_NO:74
  sq_alarmactivatorscript[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalAlarm, None) as sq_alarmactivatorscript[] ; #DEBUG_LINE_NO:75
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:76
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:79
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, sq_alarmactivatorscript[] alarmArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_TurnOn ; #DEBUG_LINE_NO:85
    Int I = 0 ; #DEBUG_LINE_NO:86
    While I < alarmArray.Length ; #DEBUG_LINE_NO:87
      alarmArray[I].TurnOnAlarm(True) ; #DEBUG_LINE_NO:88
      I += 1 ; #DEBUG_LINE_NO:89
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:92
  ElseIf auiMenuItemID == menuItemID_TurnOff ; #DEBUG_LINE_NO:93
    Int i = 0 ; #DEBUG_LINE_NO:94
    While i < alarmArray.Length ; #DEBUG_LINE_NO:95
      alarmArray[i].TurnOnAlarm(False) ; #DEBUG_LINE_NO:96
      i += 1 ; #DEBUG_LINE_NO:97
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:100
  ElseIf auiMenuItemID == menuItemID_Disable ; #DEBUG_LINE_NO:101
    Int i = 0 ; #DEBUG_LINE_NO:102
    While i < alarmArray.Length ; #DEBUG_LINE_NO:103
      alarmArray[i].DisableAlarm(True) ; #DEBUG_LINE_NO:104
      i += 1 ; #DEBUG_LINE_NO:105
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:108
  ElseIf auiMenuItemID == menuItemID_Enable ; #DEBUG_LINE_NO:109
    Int i = 0 ; #DEBUG_LINE_NO:110
    While i < alarmArray.Length ; #DEBUG_LINE_NO:111
      alarmArray[i].DisableAlarm(False) ; #DEBUG_LINE_NO:112
      i += 1 ; #DEBUG_LINE_NO:113
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
EndFunction
