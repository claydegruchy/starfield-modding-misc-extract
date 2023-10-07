ScriptName CompanionAffinityScript Extends Actor

;-- Structs -----------------------------------------
Struct AngerEvent
  affinityevent EventCausingAnger
  GlobalVariable AngerLevel
  { filter for: COM_AngerLevel }
  GlobalVariable AngerReason
  { filter for: COM_AngerReason }
EndStruct


;-- Variables ---------------------------------------
com_companionquestscript COM_CompanionQuest

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
EndGroup

Group Properties
  companionaffinityscript:angerevent[] Property AngerEventData Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  COM_CompanionQuest = ((Self as Actor) as companionactorscript).COM_CompanionQuest ; #DEBUG_LINE_NO:24
EndEvent

Event OnAffinityEvent(affinityevent akAffinityEvent, ActorValue akActorValue, GlobalVariable akReactionValue, ObjectReference akTarget)
  companionaffinityscript:angerevent[] angerTriggeringEvents = AngerEventData.GetMatchingStructs("EventCausingAnger", akAffinityEvent, 0, -1) ;*** WARNING: Experimental syntax, may be incorrect: GetMatchingStructs  ; #DEBUG_LINE_NO:32
  If angerTriggeringEvents.Length > 0 ; #DEBUG_LINE_NO:34
    companionaffinityscript:angerevent angerTriggeringEvent = angerTriggeringEvents[0] ; #DEBUG_LINE_NO:35
    COM_CompanionQuest.SetAngerLevel(angerTriggeringEvent.AngerLevel, angerTriggeringEvent.AngerReason) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  SQ_Companions.SQ_Traits.HandleAffinityEvent(Self as Actor, akAffinityEvent, akActorValue, akReactionValue, akTarget) ; #DEBUG_LINE_NO:40
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:48
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:52
EndFunction
