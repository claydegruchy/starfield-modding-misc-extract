ScriptName DefaultDisableSelfTrigger Extends ObjectReference
{ Default script that simply activates itself once when player enters trigger, can optionally triggered by specific refs, aliases, or factions. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property PlayerOnly = True Auto Const
{ Only Player Triggers?  Default: TRUE
Must be FALSE if you put anything in the arrays. }
Int Property PlayerMinLevel Auto Const
{ Optional: If set, player must be >= PlayerMinLevel to activate this }
ObjectReference[] Property TriggeredByReferences Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these references.
If ALL arrays are empty then stage is set if Triggered by anybody. }
ReferenceAlias[] Property TriggeredByAliases Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these aliases.
If ALL arrays are empty then stage is set if Triggered by anybody. }
Faction[] Property TriggeredByFactions Auto Const
{ OPTIONAL: Activation will occur if Triggered by any of these factions.
If ALL arrays are empty then stage is set if Triggered by anybody. }

;-- State -------------------------------------------
State DoneWaiting

  Event onBeginState(String asOldState)
    Self.Disable(False) ; #DEBUG_LINE_NO:63
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event onTriggerEnter(ObjectReference triggerRef)
    If PlayerOnly ; #DEBUG_LINE_NO:30
      If triggerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:31
        If PlayerMinLevel == 0 || Game.GetPlayer().getLevel() >= PlayerMinLevel ; #DEBUG_LINE_NO:32
          Self.GoToState("DoneWaiting") ; #DEBUG_LINE_NO:34
          Self.activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:35
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    ElseIf TriggeredByReferences.Length > 0 || TriggeredByAliases.Length > 0 || TriggeredByFactions.Length > 0 ; #DEBUG_LINE_NO:39
      Self.GoToState("DoneWaiting") ; #DEBUG_LINE_NO:41
      Self.activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:42
    ElseIf commonarrayfunctions.CheckObjectReferenceAgainstArray(triggerRef, TriggeredByReferences, False) || commonarrayfunctions.CheckObjectReferenceAgainstReferenceAliasArray(triggerRef, TriggeredByAliases, False) || commonarrayfunctions.CheckActorAgainstFactionArray(triggerRef as Actor, TriggeredByFactions, False) ; #DEBUG_LINE_NO:44
      If PlayerMinLevel == 0 || Game.GetPlayer().getLevel() >= PlayerMinLevel ; #DEBUG_LINE_NO:45
        Self.GoToState("DoneWaiting") ; #DEBUG_LINE_NO:47
        Self.activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:48
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
