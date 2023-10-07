ScriptName SQ_Airlock_QuestScript Extends Quest
{ handles adding/removing actors to a ref collection meaning they are "inside" an airlocked location.Achievements_TrackedStatsScript }

;-- Variables ---------------------------------------
Bool registeredForPlayerEvent

;-- Properties --------------------------------------
Group Autofill
  RefCollectionAlias Property Alias_InsideActors Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function RegisterForOnPlayerFollowerWarp()
  registeredForPlayerEvent = True ; #DEBUG_LINE_NO:17
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerFollowerWarp") ; #DEBUG_LINE_NO:19
EndFunction

Event Actor.OnPlayerFollowerWarp(Actor akSender, ObjectReference akFollower)
  If Alias_InsideActors.Find(Game.GetPlayer() as ObjectReference) < 0 ; #DEBUG_LINE_NO:26
    Alias_InsideActors.RemoveRef(akFollower) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetActorInside(Actor ActorToSet, Bool SetInside)
  If SetInside ; #DEBUG_LINE_NO:35
    Alias_InsideActors.AddRef(ActorToSet as ObjectReference) ; #DEBUG_LINE_NO:36
  Else ; #DEBUG_LINE_NO:
    Alias_InsideActors.RemoveRef(ActorToSet as ObjectReference) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If registeredForPlayerEvent == False ; #DEBUG_LINE_NO:41
    Self.RegisterForOnPlayerFollowerWarp() ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetActorsInside(Actor[] ActorsToSet, Bool SetInside)
  Int I = 0 ; #DEBUG_LINE_NO:49
  While I < ActorsToSet.Length ; #DEBUG_LINE_NO:50
    If ActorsToSet[I] ; #DEBUG_LINE_NO:51
      Self.SetActorInside(ActorsToSet[I], SetInside) ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:54
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:63
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:67
EndFunction
