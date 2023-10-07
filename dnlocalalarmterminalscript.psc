ScriptName DNLocalAlarmTerminalScript Extends TerminalMenu
{ Native terminal script for terminals that control DNLocalAlarmScript alarm systems. }

;-- Variables ---------------------------------------
Int menuItemID_Disarm = 1 Const

;-- Properties --------------------------------------
Keyword Property DNLocalAlarmTerminalLinkKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(DNLocalAlarmTerminalLinkKeyword, 100) ; #DEBUG_LINE_NO:11
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(DNLocalAlarmTerminalLinkKeyword, None) ; #DEBUG_LINE_NO:12
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:13
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as dnlocalalarmscript[]) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:16
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as dnlocalalarmscript[]) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, TerminalMenu akTerminalBase, dnlocalalarmscript[] alarmArray)
  If auiMenuItemID == menuItemID_Disarm ; #DEBUG_LINE_NO:22
    Int I = 0 ; #DEBUG_LINE_NO:23
    While I < alarmArray.Length ; #DEBUG_LINE_NO:25
      alarmArray[I].Disarm() ; #DEBUG_LINE_NO:27
      I += 1 ; #DEBUG_LINE_NO:28
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
