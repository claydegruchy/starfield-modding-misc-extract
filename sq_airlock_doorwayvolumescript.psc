ScriptName SQ_Airlock_DoorwayVolumeScript Extends ObjectReference Const
{ script attached to trigger volume placed between airlock doors which it is linkedref to,
and watches for states of to add/remove actors to a refcollection managing their "inside" state }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_airlock_questscript Property SQ_Airlock Auto Const mandatory
  Keyword Property SQ_Airlock_Link_Door_Inside Auto Const mandatory
  Keyword Property SQ_Airlock_Link_Door_Outside Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  ObjectReference InsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Inside) ; #DEBUG_LINE_NO:15
  ObjectReference OutsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Outside) ; #DEBUG_LINE_NO:16
  Self.RegisterForRemoteEvent(InsideDoor as ScriptObject, "OnClose") ; #DEBUG_LINE_NO:22
  Self.RegisterForRemoteEvent(OutsideDoor as ScriptObject, "OnClose") ; #DEBUG_LINE_NO:23
  OutsideDoor.SetOpen(False) ; #DEBUG_LINE_NO:26
EndEvent

Event OnUnload()
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:33
EndEvent

Event ObjectReference.OnClose(ObjectReference akSender, ObjectReference akActionRef)
  Actor[] actorsInTrigger = Self.GetAllRefsInTrigger() as Actor[] ; #DEBUG_LINE_NO:39
  ObjectReference InsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Inside) ; #DEBUG_LINE_NO:42
  ObjectReference OutsideDoor = Self.GetLinkedRef(SQ_Airlock_Link_Door_Outside) ; #DEBUG_LINE_NO:43
  If akSender == OutsideDoor ; #DEBUG_LINE_NO:46
    SQ_Airlock.SetActorsInside(actorsInTrigger, True) ; #DEBUG_LINE_NO:47
  ElseIf akSender == InsideDoor ; #DEBUG_LINE_NO:48
    SQ_Airlock.SetActorsInside(actorsInTrigger, False) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:57
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:61
EndFunction
