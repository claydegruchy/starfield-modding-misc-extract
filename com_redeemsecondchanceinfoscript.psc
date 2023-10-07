ScriptName COM_RedeemSecondChanceInfoScript Extends TopicInfo

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  (Self.GetOwningQuest() as com_companionquestscript).ReedemSecondChance() ; #DEBUG_LINE_NO:7
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:15
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:19
EndFunction
