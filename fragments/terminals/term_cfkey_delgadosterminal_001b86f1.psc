ScriptName Fragments:Terminals:TERM_CFKey_DelgadosTerminal_001B86F1 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkTerminalDoor Auto Const mandatory
Keyword Property LinkTerminalRobot Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Terminal_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100) ; #DEBUG_LINE_NO:8
  Int I = 0 ; #DEBUG_LINE_NO:9
  While I < linkedSecurityDoors.Length ; #DEBUG_LINE_NO:10
    linkedSecurityDoors[I].Unlock(False) ; #DEBUG_LINE_NO:11
    linkedSecurityDoors[I].SetOpen(True) ; #DEBUG_LINE_NO:12
    I += 1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  ObjectReference[] linkedDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalDoor, 100) ; #DEBUG_LINE_NO:23
  Int I = 0 ; #DEBUG_LINE_NO:24
  While I < linkedDoors.Length ; #DEBUG_LINE_NO:25
    linkedDoors[I].Unlock(False) ; #DEBUG_LINE_NO:26
    linkedDoors[I].SetOpen(True) ; #DEBUG_LINE_NO:27
    I += 1 ; #DEBUG_LINE_NO:28
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[] ; #DEBUG_LINE_NO:38
  Int I = 0 ; #DEBUG_LINE_NO:39
  While I < linkedRobots.Length ; #DEBUG_LINE_NO:40
    linkedRobots[I].SetUnconscious(True) ; #DEBUG_LINE_NO:41
    I += 1 ; #DEBUG_LINE_NO:42
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Terminal_04(ObjectReference akTerminalRef)
  Actor[] linkedRobots = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) as Actor[] ; #DEBUG_LINE_NO:52
  Int I = 0 ; #DEBUG_LINE_NO:53
  While I < linkedRobots.Length ; #DEBUG_LINE_NO:54
    linkedRobots[I].AddToFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:55
    linkedRobots[I].RemoveFromFaction(LC043SYFaction) ; #DEBUG_LINE_NO:56
    linkedRobots[I].RemoveFromFaction(LC043SY01Faction) ; #DEBUG_LINE_NO:57
    linkedRobots[I].RemoveFromFaction(LC043SY02Faction) ; #DEBUG_LINE_NO:58
    linkedRobots[I].RemoveFromFaction(LC043SY03Faction) ; #DEBUG_LINE_NO:59
    linkedRobots[I].SetUnconscious(False) ; #DEBUG_LINE_NO:60
    I += 1 ; #DEBUG_LINE_NO:61
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
