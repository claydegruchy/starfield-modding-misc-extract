ScriptName OE_KT_IncomingStormTerminalScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property OE_KT_IncomingStormGenA_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenB_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormGenC_Global Auto Const mandatory
GlobalVariable Property OE_KT_IncomingStormTotalMoves_Global Auto Const mandatory

;-- Functions ---------------------------------------

Function PuzzleStart()
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global) ; #DEBUG_LINE_NO:15
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global) ; #DEBUG_LINE_NO:16
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global) ; #DEBUG_LINE_NO:17
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global) ; #DEBUG_LINE_NO:18
EndFunction

Function CheckPuzzle()
  OE_KT_IncomingStormTotalMoves_Global.Mod(-1.0) ; #DEBUG_LINE_NO:24
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenA_Global) ; #DEBUG_LINE_NO:26
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenB_Global) ; #DEBUG_LINE_NO:27
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormGenC_Global) ; #DEBUG_LINE_NO:28
  Self.UpdateCurrentInstanceGlobal(OE_KT_IncomingStormTotalMoves_Global) ; #DEBUG_LINE_NO:29
  If OE_KT_IncomingStormGenA_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenB_Global.GetValueInt() > 100 || OE_KT_IncomingStormGenC_Global.GetValueInt() > 100 ; #DEBUG_LINE_NO:32
    Self.SetStage(300) ; #DEBUG_LINE_NO:33
  ElseIf OE_KT_IncomingStormTotalMoves_Global.GetValueInt() == 0 ; #DEBUG_LINE_NO:34
    If OE_KT_IncomingStormGenA_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenB_Global.GetValueInt() == 60 && OE_KT_IncomingStormGenC_Global.GetValueInt() == 60 ; #DEBUG_LINE_NO:37
      Self.SetStage(200) ; #DEBUG_LINE_NO:38
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(300) ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
