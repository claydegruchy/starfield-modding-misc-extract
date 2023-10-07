ScriptName TestZachGenericLoreTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
FormList Property TestZachGenericLoreFormList Auto Const mandatory
TerminalMenu Property TestZachGenericLoreTerminal_SingleEntry_CF01_Genesis Auto Const mandatory
Message Property testZachGenericLoreMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Form[] textReplacementArray = new Form[0] ; #DEBUG_LINE_NO:16
  Self.AddDynamicMenuItem(akTerminalRef, 0, 1, textReplacementArray) ; #DEBUG_LINE_NO:20
  Self.AddDynamicBodyTextItem(akTerminalRef, 0, 1, textReplacementArray) ; #DEBUG_LINE_NO:21
EndEvent
