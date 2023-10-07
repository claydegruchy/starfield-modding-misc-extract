ScriptName CityCYRedTape01ApplyTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
TerminalMenu Property SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis Auto Const mandatory
Int Property PlayerNameBodyTextIndex = 0 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  akTerminalRef.AddTextReplacementData("PlayerLabel", Game.GetPlayer().GetBaseObject()) ; #DEBUG_LINE_NO:8
  terminalscript myTerminalRef = akTerminalRef as terminalscript ; #DEBUG_LINE_NO:9
  Form[] textReplacementArray = new Form[0] ; #DEBUG_LINE_NO:10
  textReplacementArray.add(Game.GetPlayer() as Form, 1) ; #DEBUG_LINE_NO:11
  SY_Deimos_SalesSubTerminal_Assistant_Submit_Genesis.AddDynamicBodyTextItem(myTerminalRef as ObjectReference, PlayerNameBodyTextIndex, 1, textReplacementArray) ; #DEBUG_LINE_NO:12
EndEvent
