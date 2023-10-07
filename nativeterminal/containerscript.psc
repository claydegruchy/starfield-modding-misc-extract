ScriptName NativeTerminal:ContainerScript Extends TerminalMenu
{ handles containers via native terminal }

;-- Variables ---------------------------------------
Bool anyLocked = False
Bool anySafe = False
Int containerCount = 0

;-- Properties --------------------------------------
Group autofillProperties
  ActorValue Property NativeTerminalContainer_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalContainer_Count Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalContainer_AnySafe Auto Const mandatory
  { autofill }
  Keyword Property LootSafeKeyword Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalContainer Auto Const mandatory
Int Property menuItemID_Unlock01 = 1 Auto Const
Int Property menuItemID_Unlock02 = 2 Auto Const
Int Property menuItemID_Unlock03 = 3 Auto Const
Int Property menuItemID_Unlock04 = 4 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:34
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer, 100) ; #DEBUG_LINE_NO:40
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer, None) ; #DEBUG_LINE_NO:41
  anyLocked = False ; #DEBUG_LINE_NO:44
  anySafe = False ; #DEBUG_LINE_NO:45
  containerCount = 0 ; #DEBUG_LINE_NO:46
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:48
    Self.UpdateTerminalVariablesForArray(linkedRefChain) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:51
    Self.UpdateTerminalVariablesForArray(linkedRefChildren) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalContainer_AnyLocked, (anyLocked as Int) as Float) ; #DEBUG_LINE_NO:59
  akTerminalRef.SetValue(NativeTerminalContainer_AnySafe, (anySafe as Int) as Float) ; #DEBUG_LINE_NO:60
  akTerminalRef.SetValue(NativeTerminalContainer_Count, containerCount as Float) ; #DEBUG_LINE_NO:61
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] ContainerArray)
  Int I = 0 ; #DEBUG_LINE_NO:66
  While I < ContainerArray.Length ; #DEBUG_LINE_NO:67
    ObjectReference theContainer = ContainerArray[I] ; #DEBUG_LINE_NO:68
    If theContainer.IsLocked() ; #DEBUG_LINE_NO:70
      anyLocked = True ; #DEBUG_LINE_NO:71
    EndIf ; #DEBUG_LINE_NO:
    If theContainer.HasKeyword(LootSafeKeyword) ; #DEBUG_LINE_NO:73
      anySafe = True ; #DEBUG_LINE_NO:74
    EndIf ; #DEBUG_LINE_NO:
    containerCount += 1 ; #DEBUG_LINE_NO:77
    I += 1 ; #DEBUG_LINE_NO:78
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalContainer, 100) ; #DEBUG_LINE_NO:85
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalContainer, None) ; #DEBUG_LINE_NO:86
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:87
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:90
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] refArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02 || auiMenuItemID == menuItemID_Unlock03 || auiMenuItemID == menuItemID_Unlock04 ; #DEBUG_LINE_NO:97
    Int I = 0 ; #DEBUG_LINE_NO:98
    While I < refArray.Length ; #DEBUG_LINE_NO:99
      refArray[I].Unlock(False) ; #DEBUG_LINE_NO:100
      I += 1 ; #DEBUG_LINE_NO:101
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
EndFunction
