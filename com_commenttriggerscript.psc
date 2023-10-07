ScriptName COM_CommentTriggerScript Extends ObjectReference
{ Companion entering this trigger will send an AffinityEvent.
If there is a linked ref attached to this trigger, the companion will attempt to walk to it before sending the AffinityEvent.
If there is a linked ref attached to this trigger, that will be the Target of the AffinityEvent. }

;-- Variables ---------------------------------------
Int[] DoneIDs
companionactorscript TriggeringCompanionRef

;-- Properties --------------------------------------
Group autofill collapsedonref
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { autofill }
EndGroup

Group Advanced collapsedonref
  Keyword Property COM_CommentTriggerStart Auto Const mandatory
  { autotfill (if using default); they keyword that starts the quest that packages the Companion to walk to the thing to comment on (if linked ref to this trigger)
if you want to use a specifc quest for something custom, you can replace this property with another keyword to start that quest. It will need the COM_CommentTriggerQuestScript to call back to this trigger. }
EndGroup

Group Properties
  Bool Property OncePerCompanion = True Auto Const
  { if true (default), this is triggered only once per companion }
  conditionform Property COM_CND_Comment_CommentsAllowed Auto Const mandatory
  { Condition form used when multiple companions are following to prevent comment stomping }
  affinityevent Property AffinityEventToSend Auto Const mandatory
  { This is the affinity event to send. 

Primarily it will be used for it's data such as Topic To Say data
But also consider using the data for "Allow Repeated Event," and "Cool Down Days."
Use random info stacks and "say once" info flags if you want to have randomized or finite things to say in conjunction with allow repeated and cool days. }
EndGroup


;-- Functions ---------------------------------------

Event OnUnload()
  Self.UnregisterForAllEvents() ; #DEBUG_LINE_NO:37
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If OncePerCompanion && DoneIDs == None ; #DEBUG_LINE_NO:42
    DoneIDs = new Int[0] ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
  TriggeringCompanionRef = akActionRef as companionactorscript ; #DEBUG_LINE_NO:46
  If TriggeringCompanionRef as Bool && COM_CND_Comment_CommentsAllowed.IsTrue(TriggeringCompanionRef as ObjectReference, None) ; #DEBUG_LINE_NO:48
    Bool alreadyTriggered = False ; #DEBUG_LINE_NO:50
    Int companionID = -1 ; #DEBUG_LINE_NO:51
    If OncePerCompanion ; #DEBUG_LINE_NO:52
      companionID = TriggeringCompanionRef.GetCompanionIDValueInt() ; #DEBUG_LINE_NO:53
      alreadyTriggered = DoneIDs.find(companionID, 0) > -1 ; #DEBUG_LINE_NO:54
    EndIf ; #DEBUG_LINE_NO:
    If OncePerCompanion == False || alreadyTriggered == False ; #DEBUG_LINE_NO:57
      If Self.IsCompanionOrPlayerInCombat() ; #DEBUG_LINE_NO:59
        Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:61
        Self.RegisterForRemoteEvent(TriggeringCompanionRef as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:62
      Else ; #DEBUG_LINE_NO:
        Self.StartCommentSceneQuest() ; #DEBUG_LINE_NO:65
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If TriggeringCompanionRef as Bool && Self.IsCompanionOrPlayerInCombat() == False ; #DEBUG_LINE_NO:80
    If Self.IsInTrigger(TriggeringCompanionRef as ObjectReference) ; #DEBUG_LINE_NO:83
      Self.StartCommentSceneQuest() ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function IsCompanionOrPlayerInCombat()
  Bool triggeringCompanionIsInCombat = TriggeringCompanionRef as Bool && TriggeringCompanionRef.IsInCombat() ; #DEBUG_LINE_NO:93
  Bool playerIsInCombat = Game.GetPlayer().IsInCombat() ; #DEBUG_LINE_NO:94
  Bool returnVal = triggeringCompanionIsInCombat || playerIsInCombat ; #DEBUG_LINE_NO:95
  Return returnVal ; #DEBUG_LINE_NO:97
EndFunction

Function StartCommentSceneQuest()
  If TriggeringCompanionRef ; #DEBUG_LINE_NO:102
    If ((SQ_Companions as Quest) as companionaffinityeventsscript).IsNearImportantScene(True, True) == False ; #DEBUG_LINE_NO:105
      If OncePerCompanion ; #DEBUG_LINE_NO:107
        DoneIDs.add(TriggeringCompanionRef.GetCompanionIDValueInt(), 1) ; #DEBUG_LINE_NO:108
      EndIf ; #DEBUG_LINE_NO:
      Quest[] startedQuests = COM_CommentTriggerStart.SendStoryEventAndWait(None, Self as ObjectReference, TriggeringCompanionRef as ObjectReference, 0, 0) ; #DEBUG_LINE_NO:115
      Bool successfullyStartedQuest = startedQuests.Length > 0 ; #DEBUG_LINE_NO:116
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  TriggeringCompanionRef = None ; #DEBUG_LINE_NO:124
EndFunction

Function SendAffinityEvent(companionactorscript CompanionActorRef, ObjectReference TargetRef)
  AffinityEventToSend.Send(TargetRef) ; #DEBUG_LINE_NO:130
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:137
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:142
EndFunction
