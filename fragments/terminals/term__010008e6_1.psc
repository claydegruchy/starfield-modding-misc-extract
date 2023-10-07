ScriptName Fragments:Terminals:TERM__010008E6_1 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
ActorValue Property LC012_CreatureAttack Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100) ; #DEBUG_LINE_NO:7
  Int I = 0 ; #DEBUG_LINE_NO:8
  While I < linkedSecurityDoors.Length ; #DEBUG_LINE_NO:9
    linkedSecurityDoors[I].SetOpen(True) ; #DEBUG_LINE_NO:10
    linkedSecurityDoors[I].SetLockLevel(253) ; #DEBUG_LINE_NO:11
    I += 1 ; #DEBUG_LINE_NO:12
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] linkedCreatures = akTerminalRef.GetLinkedRefChain(LinkCustom01, 100) ; #DEBUG_LINE_NO:14
  Int j = 0 ; #DEBUG_LINE_NO:15
  While j < linkedCreatures.Length ; #DEBUG_LINE_NO:16
    linkedCreatures[j].SetValue(LC012_CreatureAttack, 1.0) ; #DEBUG_LINE_NO:17
    j += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(LC012_CreatureAttack, 1.0) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  ObjectReference[] linkedSecurityDoors = akTerminalRef.GetLinkedRefChain(LinkTerminalSecurityDoor, 100) ; #DEBUG_LINE_NO:28
  Int I = 0 ; #DEBUG_LINE_NO:29
  While I < linkedSecurityDoors.Length ; #DEBUG_LINE_NO:30
    linkedSecurityDoors[I].SetOpen(False) ; #DEBUG_LINE_NO:31
    linkedSecurityDoors[I].SetLockLevel(253) ; #DEBUG_LINE_NO:32
    I += 1 ; #DEBUG_LINE_NO:33
  EndWhile ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(LC012_CreatureAttack, 0.0) ; #DEBUG_LINE_NO:35
EndFunction
