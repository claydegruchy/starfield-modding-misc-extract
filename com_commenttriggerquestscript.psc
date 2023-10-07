ScriptName COM_CommentTriggerQuestScript Extends Quest
{ Used to handle scene driven AffinityEvent sending initiaited by COM_CommentTriggerScript }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property CommentScene Auto Const mandatory
ReferenceAlias Property Alias_Companion Auto Const mandatory
ReferenceAlias Property Alias_CommentTrigger Auto Const mandatory
ReferenceAlias Property Alias_Target Auto Const mandatory

;-- Functions ---------------------------------------

Function SendAffinityEvent()
  companionactorscript CompanionRef = Alias_Companion.GetActorReference() as companionactorscript ; #DEBUG_LINE_NO:11
  com_commenttriggerscript CommentTriggerRef = Alias_CommentTrigger.GetReference() as com_commenttriggerscript ; #DEBUG_LINE_NO:12
  ObjectReference TargetRef = Alias_Target.GetReference() ; #DEBUG_LINE_NO:13
  If CommentTriggerRef as Bool && CompanionRef as Bool ; #DEBUG_LINE_NO:17
    CommentTriggerRef.SendAffinityEvent(CompanionRef, TargetRef) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:28
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:32
EndFunction
