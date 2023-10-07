ScriptName SQ_PreventRecalcScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Refs Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Function AddRef(ObjectReference RefToAdd)
  If Self.IsRunning() == False ; #DEBUG_LINE_NO:7
    Self.Start() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  Refs.AddRef(RefToAdd) ; #DEBUG_LINE_NO:13
EndFunction

Function RemoveRef(ObjectReference RefToRemove)
  Refs.RemoveRef(RefToRemove) ; #DEBUG_LINE_NO:17
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:24
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:28
EndFunction
