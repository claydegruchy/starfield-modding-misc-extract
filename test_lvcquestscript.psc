ScriptName TEST_LVCQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property DistanceTestMarker Auto Const mandatory
{ Marker used for the multiple distance tests }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingA_Success Auto Const mandatory
{ Sounds used for the furthest distance event }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingB_Success Auto Const mandatory
{ Sounds used for the middle distance event }
wwiseevent Property WwiseEvent_AMBArtifactPuzzleRingC_Success Auto Const mandatory
{ Sounds used for the closest distance event }
inputenablelayer Property TestEnableLayer Auto
{ Enable player used for testing }

;-- Functions ---------------------------------------

Function RegisterForDistanceTestEvents()
  ObjectReference myRef = DistanceTestMarker.GetRef() ; #DEBUG_LINE_NO:19
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:20
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 20.0, 0) ; #DEBUG_LINE_NO:22
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 15.0, 1) ; #DEBUG_LINE_NO:23
  Self.RegisterForDistanceLessThanEvent(PlayerRef as ScriptObject, myRef as ScriptObject, 10.0, 2) ; #DEBUG_LINE_NO:24
EndFunction

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  ObjectReference myRef = DistanceTestMarker.GetRef() ; #DEBUG_LINE_NO:28
  If akObj1 == myRef || akObj2 == myRef ; #DEBUG_LINE_NO:29
    If aiEventID == 0 ; #DEBUG_LINE_NO:30
      WwiseEvent_AMBArtifactPuzzleRingA_Success.Play(myRef, None, None) ; #DEBUG_LINE_NO:31
    ElseIf aiEventID == 1 ; #DEBUG_LINE_NO:32
      WwiseEvent_AMBArtifactPuzzleRingB_Success.Play(myRef, None, None) ; #DEBUG_LINE_NO:33
    ElseIf aiEventID == 2 ; #DEBUG_LINE_NO:34
      WwiseEvent_AMBArtifactPuzzleRingC_Success.Play(myRef, None, None) ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DEBUGPrintBiomeActorBase(Actor akTargetCreature)
  ActorBase TargetBase = None ; #DEBUG_LINE_NO:41
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:50
EndFunction
