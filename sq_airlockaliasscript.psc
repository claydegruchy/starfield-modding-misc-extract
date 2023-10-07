ScriptName SQ_AirlockAliasScript Extends RefCollectionAlias Const

;-- Functions ---------------------------------------

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:11
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:19
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:23
EndFunction
