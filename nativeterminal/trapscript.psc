ScriptName NativeTerminal:TrapScript Extends TerminalMenu
{ handles traps via native terminal }

;-- Variables ---------------------------------------
Bool anyActive = False

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalTrap_AnyActive Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalTrap Auto Const mandatory
Int Property menuItemID_TurnOn = 1 Auto Const
Int Property menuItemID_TurnOff = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:21
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  trapbase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap, 100) as trapbase[] ; #DEBUG_LINE_NO:27
  trapbase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap, None) as trapbase[] ; #DEBUG_LINE_NO:28
  anyActive = False ; #DEBUG_LINE_NO:31
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:33
    Self.UpdateTerminalVariablesForArray(linkedRefChain) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:36
    Self.UpdateTerminalVariablesForArray(linkedRefChildren) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalTrap_AnyActive, (anyActive as Int) as Float) ; #DEBUG_LINE_NO:42
EndFunction

Function UpdateTerminalVariablesForArray(trapbase[] trapArray)
  Int I = 0 ; #DEBUG_LINE_NO:47
  While I < trapArray.Length ; #DEBUG_LINE_NO:48
    trapbase theTrap = trapArray[I] ; #DEBUG_LINE_NO:49
    If theTrap.bActive ; #DEBUG_LINE_NO:51
      anyActive = True ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:54
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  trapbase[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalTrap, 100) as trapbase[] ; #DEBUG_LINE_NO:61
  trapbase[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalTrap, None) as trapbase[] ; #DEBUG_LINE_NO:62
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:63
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:66
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef) ; #DEBUG_LINE_NO:67
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, trapbase[] trapArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_TurnOn ; #DEBUG_LINE_NO:72
    Int I = 0 ; #DEBUG_LINE_NO:73
    While I < trapArray.Length ; #DEBUG_LINE_NO:74
      trapArray[I].SetActive(True) ; #DEBUG_LINE_NO:75
      I += 1 ; #DEBUG_LINE_NO:76
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:79
  ElseIf auiMenuItemID == menuItemID_TurnOff ; #DEBUG_LINE_NO:80
    Int i = 0 ; #DEBUG_LINE_NO:81
    While i < trapArray.Length ; #DEBUG_LINE_NO:82
      trapArray[i].SetActive(False) ; #DEBUG_LINE_NO:83
      i += 1 ; #DEBUG_LINE_NO:84
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction
