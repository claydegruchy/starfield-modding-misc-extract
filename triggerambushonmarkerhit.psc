ScriptName TriggerAmbushOnMarkerHit Extends ObjectReference

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DMP_AmbushMarker Auto Const mandatory
{ Keyword used to find the critter linked to this ambush marker }
Keyword Property LinkAmbushTrigger Auto Const mandatory
{ Keyword to find the trigger linked to the ambushing critter }

;-- Functions ---------------------------------------

Function ProcessHit()
  ObjectReference[] LinkedNPCs = Self.GetRefsLinkedToMe(DMP_AmbushMarker, None) ; #DEBUG_LINE_NO:37
  Int iLength = LinkedNPCs.Length ; #DEBUG_LINE_NO:38
  Bool AmbushNPCFound = False ; #DEBUG_LINE_NO:40
  Actor NPCRef = None ; #DEBUG_LINE_NO:41
  If iLength > 0 && !AmbushNPCFound ; #DEBUG_LINE_NO:43
    Int I = 0 ; #DEBUG_LINE_NO:44
    NPCRef = LinkedNPCs[I] as Actor ; #DEBUG_LINE_NO:45
    If NPCRef != None ; #DEBUG_LINE_NO:48
      AmbushNPCFound = True ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If AmbushNPCFound ; #DEBUG_LINE_NO:53
    defaultrefambushtrigger2 TriggerRef = NPCRef.GetLinkedRef(LinkAmbushTrigger) as defaultrefambushtrigger2 ; #DEBUG_LINE_NO:54
    If TriggerRef != None ; #DEBUG_LINE_NO:56
      TriggerRef.TriggerAmbush() ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.GotoState("Triggered") ; #DEBUG_LINE_NO:63
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:70
EndFunction

;-- State -------------------------------------------
State Triggered

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.ProcessHit() ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    Self.UnregisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:11
  EndEvent
EndState
