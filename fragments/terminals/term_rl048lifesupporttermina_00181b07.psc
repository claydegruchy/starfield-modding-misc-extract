ScriptName Fragments:Terminals:TERM_RL048LifeSupportTermina_00181B07 Extends Terminal Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const
Keyword Property LinkCustom02 Auto Const
Quest Property DR018_EavesdroppingScene01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Terminal_02(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom01).Unlock(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Terminal_03(ObjectReference akTerminalRef)
  akTerminalRef.GetLinkedRef(LinkCustom02).Unlock(False) ; #DEBUG_LINE_NO:17
  Utility.wait(1.0) ; #DEBUG_LINE_NO:18
  akTerminalRef.GetLinkedRef(LinkCustom02).SetOpen(True) ; #DEBUG_LINE_NO:19
  Utility.wait(2.0) ; #DEBUG_LINE_NO:20
  DR018_EavesdroppingScene01.SetStage(20) ; #DEBUG_LINE_NO:21
EndFunction
