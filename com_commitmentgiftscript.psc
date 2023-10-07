ScriptName COM_CommitmentGiftScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CommitmentGiftEnabled Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  If akNewContainer == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:8
    CommitmentGiftEnabled.SetValue(1.0) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
  If akOldContainer == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:12
    (SQ_Companions as sq_companionsscript).CommitmentGifts.RemoveRef(Self as ObjectReference) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:23
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:28
EndFunction
