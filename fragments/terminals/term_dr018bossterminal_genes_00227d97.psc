ScriptName Fragments:Terminals:TERM_DR018BossTerminal_Genes_00227D97 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Scene Property DR018_DoorOpenScene Auto Const
Keyword Property UC_GG_Mark_DoorTerminal_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom01).Unlock(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom02).Unlock(False) ; #DEBUG_LINE_NO:17
  akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen(True) ; #DEBUG_LINE_NO:18
  If !akTerminalRef.HasKeyword(UC_GG_Mark_DoorTerminal_Keyword) ; #DEBUG_LINE_NO:24
    DR018_DoorOpenScene.Start() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction
