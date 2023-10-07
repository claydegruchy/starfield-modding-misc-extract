ScriptName Fragments:Terminals:TERM_MQ207C_Nishina02_II_Freq Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
mq207cquestscript Property MQ207C Auto Const mandatory
ActorValue Property MQ207C_MasterControlTerminalUniverseValue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_02(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_TerminalMenu_03(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 20) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_TerminalMenu_04(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 22) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_TerminalMenu_05(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 24) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_TerminalMenu_06(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 26) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_TerminalMenu_07(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 28) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_TerminalMenu_08(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 30) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_TerminalMenu_09(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 32) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_TerminalMenu_10(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 34) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_TerminalMenu_11(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 36) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_TerminalMenu_12(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 38) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_TerminalMenu_13(ObjectReference akTerminalRef)
  MQ207C.SetFrequencyOutput(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int, 40) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_TerminalMenu_14(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_TerminalMenu_16(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_TerminalMenu_17(ObjectReference akTerminalRef)
  MQ207C.TryToStartFrequencyCalibration(akTerminalRef.GetValue(MQ207C_MasterControlTerminalUniverseValue) as Int) ; #DEBUG_LINE_NO:134
EndFunction
