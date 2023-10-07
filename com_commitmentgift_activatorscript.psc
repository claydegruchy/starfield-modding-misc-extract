ScriptName COM_CommitmentGift_ActivatorScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CommitmentGiftEnabled Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If CommitmentGiftEnabled.GetValue() == 1.0 ; #DEBUG_LINE_NO:6
    Self.Enable(False) ; #DEBUG_LINE_NO:8
  Else ; #DEBUG_LINE_NO:
    Self.Disable(False) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:19
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:24
EndFunction
