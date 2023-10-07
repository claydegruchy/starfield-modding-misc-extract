ScriptName Home_SetStageOnUnlock_CollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property CompletionStage = 1000 Auto Const
{ Stage to set when any door to this home has been unlocked }
Bool Property WatchForLockStateChange = True Auto Const
{ If TRUE, this quest will complete when any of the home's doors unlock.
If FALSE, this quest will complete when any of the doors are activated by the player }

;-- Functions ---------------------------------------

Event OnLockStateChanged(ObjectReference akSenderRef)
  If WatchForLockStateChange ; #DEBUG_LINE_NO:12
    If !akSenderRef.IsLocked() ; #DEBUG_LINE_NO:13
      Self.GetOwningQuest().SetStage(CompletionStage) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If !WatchForLockStateChange ; #DEBUG_LINE_NO:20
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:21
      Self.GetOwningQuest().SetStage(CompletionStage) ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:31
EndFunction
