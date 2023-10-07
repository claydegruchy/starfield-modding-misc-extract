ScriptName Fragments:Terminals:TERM_LC030_Lock_GuardPostCom_001F91F6 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property LC030 Auto Const mandatory
Quest Property CF03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  LC030.SetStage(411) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  LC030.SetStage(412) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  LC030.SetStage(413) ; #DEBUG_LINE_NO:23
  CF03.SetStage(176) ; #DEBUG_LINE_NO:24
EndFunction
