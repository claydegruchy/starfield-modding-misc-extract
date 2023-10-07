ScriptName UC04_KilledByPlayerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property UC04_AttackActive Auto Const mandatory
{ Global used to track if the attack if still currently active }
Int Property StagetoSet = 730 Auto Const
{ Stage to set if this NPC was killed by the player }

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akSenderRef, ObjectReference akKiller)
  If UC04_AttackActive.GetValue() >= 1.0 ; #DEBUG_LINE_NO:11
    If akKiller == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
      Self.GetOwningQuest().SetStage(StagetoSet) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:24
EndFunction
