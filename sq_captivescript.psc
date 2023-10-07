ScriptName SQ_CaptiveScript Extends Quest
{ sends the CaptiveSetFree event for DefaultCaptiveXXX scripts to respond to. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  affinityevent Property SQ_Captive_Freed Auto Const mandatory
  affinityevent Property SQ_Wounded_Actor_Healed Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  ReferenceAlias Property PrimaryActor Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function SendCaptiveSetFree(Actor captive, Bool playerIsLiberator, Bool showInventory)
  Var[] akArgs = new Var[3] ; #DEBUG_LINE_NO:16
  akArgs[0] = captive as Var ; #DEBUG_LINE_NO:17
  akArgs[1] = playerIsLiberator as Var ; #DEBUG_LINE_NO:18
  akArgs[2] = showInventory as Var ; #DEBUG_LINE_NO:19
  Self.SendCustomEvent("sq_captivescript_CaptiveSetFree", akArgs) ; #DEBUG_LINE_NO:23
  SQ_Captive_Freed.Send(captive as ObjectReference) ; #DEBUG_LINE_NO:25
EndFunction

Function SendWoundedActorHealed(Actor woundedActor, Bool playerIsHealer)
  Var[] akArgs = new Var[3] ; #DEBUG_LINE_NO:30
  akArgs[0] = woundedActor as Var ; #DEBUG_LINE_NO:31
  akArgs[1] = playerIsHealer as Var ; #DEBUG_LINE_NO:32
  Self.SendCustomEvent("sq_captivescript_WoundedActorHealed", akArgs) ; #DEBUG_LINE_NO:35
  SQ_Wounded_Actor_Healed.Send(woundedActor as ObjectReference) ; #DEBUG_LINE_NO:37
EndFunction

Function CaptiveFollowerWaitSceneEnded()
  Actor primaryActorRef = PrimaryActor.GetActorReference() ; #DEBUG_LINE_NO:42
  SQ_Followers.CommandWait(primaryActorRef, None) ; #DEBUG_LINE_NO:45
EndFunction

Function CaptiveFollowerFollowSceneEnded()
  Actor primaryActorRef = PrimaryActor.GetActorReference() ; #DEBUG_LINE_NO:50
  SQ_Followers.CommandFollow(primaryActorRef) ; #DEBUG_LINE_NO:53
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:60
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:64
EndFunction
