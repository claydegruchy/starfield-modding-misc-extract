ScriptName NativeTerminal:DoorScript Extends TerminalMenu
{ handles doors via native terminal }

;-- Variables ---------------------------------------
Bool anyClosed = False
Bool anyLocked = False
Int doorCount = 0
Bool hasDoors = False
Bool hasLoadDoors = False

;-- Properties --------------------------------------
Group autofillProperties
  Keyword Property IsLoadDoor Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_HasDoors Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_HasLoadDoors Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_AnyClosed Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_AnyLocked Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalDoor_Count Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalDoor Auto Const mandatory
Int Property menuItemID_Open01 = 1 Auto Const
Int Property menuItemID_Open02 = 2 Auto Const
Int Property menuItemID_Unlock01 = 3 Auto Const
Int Property menuItemID_Unlock02 = 4 Auto Const
Int Property menuItemID_Close01 = 5 Auto Const
Int Property menuItemID_Close02 = 6 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:44
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100) ; #DEBUG_LINE_NO:50
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor, None) ; #DEBUG_LINE_NO:51
  hasDoors = False ; #DEBUG_LINE_NO:54
  hasLoadDoors = False ; #DEBUG_LINE_NO:55
  anyClosed = False ; #DEBUG_LINE_NO:56
  anyLocked = False ; #DEBUG_LINE_NO:57
  doorCount = 0 ; #DEBUG_LINE_NO:58
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:60
    Self.UpdateTerminalVariablesForArray(linkedRefChain) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:63
    Self.UpdateTerminalVariablesForArray(linkedRefChildren) ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalDoor_HasDoors, (hasDoors as Int) as Float) ; #DEBUG_LINE_NO:73
  akTerminalRef.SetValue(NativeTerminalDoor_HasLoadDoors, (hasLoadDoors as Int) as Float) ; #DEBUG_LINE_NO:74
  akTerminalRef.SetValue(NativeTerminalDoor_AnyClosed, (anyClosed as Int) as Float) ; #DEBUG_LINE_NO:75
  akTerminalRef.SetValue(NativeTerminalDoor_AnyLocked, (anyLocked as Int) as Float) ; #DEBUG_LINE_NO:76
  akTerminalRef.SetValue(NativeTerminalDoor_Count, doorCount as Float) ; #DEBUG_LINE_NO:77
EndFunction

Function UpdateTerminalVariablesForArray(ObjectReference[] doorArray)
  Int I = 0 ; #DEBUG_LINE_NO:83
  While I < doorArray.Length ; #DEBUG_LINE_NO:84
    ObjectReference theDoor = doorArray[I] ; #DEBUG_LINE_NO:85
    doorCount += 1 ; #DEBUG_LINE_NO:86
    If theDoor.HasKeyword(IsLoadDoor) ; #DEBUG_LINE_NO:88
      hasLoadDoors = True ; #DEBUG_LINE_NO:89
    Else ; #DEBUG_LINE_NO:
      hasDoors = True ; #DEBUG_LINE_NO:91
    EndIf ; #DEBUG_LINE_NO:
    If theDoor.GetOpenState() >= 3 ; #DEBUG_LINE_NO:94
      anyClosed = True ; #DEBUG_LINE_NO:95
    EndIf ; #DEBUG_LINE_NO:
    If theDoor.IsLocked() ; #DEBUG_LINE_NO:98
      anyLocked = True ; #DEBUG_LINE_NO:99
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:101
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100) ; #DEBUG_LINE_NO:108
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalDoor, None) ; #DEBUG_LINE_NO:109
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:110
    Self.HandleMenuItem(auiMenuItemID, linkedRefChain, akTerminalRef) ; #DEBUG_LINE_NO:111
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:113
    Self.HandleMenuItem(auiMenuItemID, linkedRefChildren, akTerminalRef) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, ObjectReference[] doorArray, ObjectReference akTerminalRef)
  If auiMenuItemID == menuItemID_Open01 || auiMenuItemID == menuItemID_Open02 ; #DEBUG_LINE_NO:119
    Int I = 0 ; #DEBUG_LINE_NO:120
    While I < doorArray.Length ; #DEBUG_LINE_NO:121
      doorArray[I].SetOpen(True) ; #DEBUG_LINE_NO:122
      doorArray[I].Unlock(False) ; #DEBUG_LINE_NO:123
      I += 1 ; #DEBUG_LINE_NO:124
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:127
  ElseIf auiMenuItemID == menuItemID_Unlock01 || auiMenuItemID == menuItemID_Unlock02 ; #DEBUG_LINE_NO:128
    Int i = 0 ; #DEBUG_LINE_NO:129
    While i < doorArray.Length ; #DEBUG_LINE_NO:130
      doorArray[i].Unlock(False) ; #DEBUG_LINE_NO:131
      i += 1 ; #DEBUG_LINE_NO:132
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:135
  ElseIf auiMenuItemID == menuItemID_Close01 || auiMenuItemID == menuItemID_Close02 ; #DEBUG_LINE_NO:136
    Int i = 0 ; #DEBUG_LINE_NO:137
    While i < doorArray.Length ; #DEBUG_LINE_NO:138
      doorArray[i].SetOpen(False) ; #DEBUG_LINE_NO:139
      i += 1 ; #DEBUG_LINE_NO:140
    EndWhile ; #DEBUG_LINE_NO:
    Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
EndFunction
