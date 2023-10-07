ScriptName UC01_VanguardTerminalScript Extends TerminalMenu Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC01_UCCrimeGold_VanguardTerminal Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  UC01_UCCrimeGold_VanguardTerminal.SetValue(CrimeFactionUC.GetCrimeGold() as Float) ; #DEBUG_LINE_NO:8
  akTerminalRef.AddTextReplacementValue("CrimeGold", UC01_UCCrimeGold_VanguardTerminal.GetValueInt() as Float) ; #DEBUG_LINE_NO:9
  akTerminalRef.AddTextReplacementData("PlayerName", Game.GetPlayer() as Form) ; #DEBUG_LINE_NO:10
  akTerminalRef.AddTextReplacementData("ShipName", PlayerShip.GetRef() as Form) ; #DEBUG_LINE_NO:11
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:18
EndFunction
