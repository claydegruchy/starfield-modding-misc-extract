ScriptName NativeTerminal:DisplayCaseScript Extends TerminalMenu
{ handles display cases via native terminal }

;-- Variables ---------------------------------------
Bool anyLocked = False
Bool anyWeaponCase = False
Bool anyWeaponRack = False
Int caseCount = 0

;-- Properties --------------------------------------
Group autofillProperties
  Keyword Property DisplayCaseTypeWeaponCase Auto Const mandatory
  { autofill }
  Keyword Property DisplayCaseTypeWeaponRack Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyWeaponCase Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_AnyWeaponRack Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDisplayCase_Count Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalDisplayCase Auto Const mandatory
Int Property menuItemID_Unlock01 = 1 Auto Const
Int Property menuItemID_Unlock02 = 2 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:39
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase, 100) ; #DEBUG_LINE_NO:45
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase, None) ; #DEBUG_LINE_NO:46
  anyLocked = False ; #DEBUG_LINE_NO:49
  anyWeaponCase = False ; #DEBUG_LINE_NO:50
  anyWeaponRack = False ; #DEBUG_LINE_NO:51
  caseCount = 0 ; #DEBUG_LINE_NO:52
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:54
    Self.UpdateTerminalVariablesForArray(linkedRefChain) ; #DEBUG_LINE_NO:55
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:57
    Self.UpdateTerminalVariablesForArray(linkedRefChildren) ; #DEBUG_LINE_NO:58
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyLocked, (anyLocked as Int) as Float) ; #DEBUG_LINE_NO:66
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponCase, (anyWeaponCase as Int) as Float) ; #DEBUG_LINE_NO:67
  akTerminalRef.SetValue(NativeTerminalDisplayCase_AnyWeaponRack, (anyWeaponRack as Int) as Float) ; #DEBUG_LINE_NO:68
  akTerminalRef.SetValue(NativeTerminalDisplayCase_Count, caseCount as Float) ; #DEBUG_LINE_NO:69
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] displayCaseArray)
  Int I = 0 ; #DEBUG_LINE_NO:74
  While I < displayCaseArray.Length ; #DEBUG_LINE_NO:75
    ObjectReference theCase = displayCaseArray[I] ; #DEBUG_LINE_NO:76
    If theCase.IsLocked() ; #DEBUG_LINE_NO:78
      anyLocked = True ; #DEBUG_LINE_NO:79
    EndIf ; #DEBUG_LINE_NO:
    If theCase.HasKeyword(DisplayCaseTypeWeaponCase) ; #DEBUG_LINE_NO:81
      anyWeaponCase = True ; #DEBUG_LINE_NO:82
    ElseIf theCase.HasKeyword(DisplayCaseTypeWeaponRack) ; #DEBUG_LINE_NO:83
      anyWeaponRack = True ; #DEBUG_LINE_NO:84
    EndIf ; #DEBUG_LINE_NO:
    caseCount += 1 ; #DEBUG_LINE_NO:86
    I += 1 ; #DEBUG_LINE_NO:87
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDisplayCase, 100) ; #DEBUG_LINE_NO:94
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDisplayCase, None) ; #DEBUG_LINE_NO:95
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:96
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:99
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02 ; #DEBUG_LINE_NO:106
    Int I = 0 ; #DEBUG_LINE_NO:107
    While I < refArray.Length ; #DEBUG_LINE_NO:108
      refArray[I].Unlock(False) ; #DEBUG_LINE_NO:109
      refArray[I].SetOpen(True) ; #DEBUG_LINE_NO:110
      I += 1 ; #DEBUG_LINE_NO:111
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndFunction
