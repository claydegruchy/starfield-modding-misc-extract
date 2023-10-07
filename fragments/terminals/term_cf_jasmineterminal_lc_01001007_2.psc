ScriptName Fragments:Terminals:TERM_CF_JasmineTerminal_LC_01001007_2 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkTerminalRobot Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[] ; #DEBUG_LINE_NO:8
  Int I = 0 ; #DEBUG_LINE_NO:9
  While I < linkedRobots.Length ; #DEBUG_LINE_NO:10
    linkedRobots[I].SetUnconscious(True) ; #DEBUG_LINE_NO:11
    I += 1 ; #DEBUG_LINE_NO:12
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[] ; #DEBUG_LINE_NO:22
  Int I = 0 ; #DEBUG_LINE_NO:23
  While I < linkedRobots.Length ; #DEBUG_LINE_NO:24
    linkedRobots[I].RemoveFromAllFactions() ; #DEBUG_LINE_NO:25
    linkedRobots[I].AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:26
    linkedRobots[I].SetUnconscious(False) ; #DEBUG_LINE_NO:27
    I += 1 ; #DEBUG_LINE_NO:28
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
