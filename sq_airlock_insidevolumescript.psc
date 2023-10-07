ScriptName SQ_Airlock_InsideVolumeScript Extends ObjectReference
{ script on trigger volumes that is placed inside exterior interiors
which puts calls a function that puts actors in an "inside" refcollection }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_airlock_questscript Property SQ_Airlock Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor triggeringActor = akActionRef as Actor ; #DEBUG_LINE_NO:18
  If triggeringActor ; #DEBUG_LINE_NO:20
    SQ_Airlock.SetActorInside(triggeringActor, True) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:38
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:42
EndFunction
