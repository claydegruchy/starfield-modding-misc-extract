ScriptName RETriggerSecondaryScript Extends ObjectReference
{ use for triggers linked to other RETriggers
mainly useful for triggers which use OnTrigger to fire }

;-- Variables ---------------------------------------
String LocalScriptName = "RETriggerSecondaryScript"
retriggerscript myLinkedTrigger

;-- Functions ---------------------------------------

Event OnCellLoad()
  myLinkedTrigger = Self.GetLinkedRef(None) as retriggerscript ; #DEBUG_LINE_NO:11
  If myLinkedTrigger as Bool && myLinkedTrigger.TriggerOnLoad ; #DEBUG_LINE_NO:13
    myLinkedTrigger.OnCellLoad() ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  myLinkedTrigger = Self.GetLinkedRef(None) as retriggerscript ; #DEBUG_LINE_NO:21
  If akActionRef != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:23
    Return  ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  If myLinkedTrigger as Bool && !myLinkedTrigger.TriggerOnLoad ; #DEBUG_LINE_NO:27
    myLinkedTrigger.OnTriggerEnter(akActionRef) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:39
  If myLinkedTrigger ; #DEBUG_LINE_NO:40
    myLinkedTrigger.Trace(CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    Debug.Trace((CallingObject as String + " ") + asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  asTextToPrint = "[" + LocalScriptName + "] " + asTextToPrint ; #DEBUG_LINE_NO:48
  If myLinkedTrigger ; #DEBUG_LINE_NO:49
    myLinkedTrigger.warning(CallingObject, asTextToPrint, False, 2, False, True, True) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction
