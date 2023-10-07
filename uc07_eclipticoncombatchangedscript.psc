ScriptName UC07_EclipticOnCombatChangedScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 300 Auto Const
{ This stage must be set before we start caring about these events }
Int Property StagetoSet = 610 Auto Const
{ Stage to set when the player or Kaiser aggro's these NPCs }
ReferenceAlias Property Kaiser Auto Const mandatory

;-- Functions ---------------------------------------

Event OnCombatListAdded(ObjectReference akSenderRef, Actor akTarget)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:13
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(StagetoSet) && (akTarget == Game.GetPlayer() || akTarget == Kaiser.GetActorRef()) ; #DEBUG_LINE_NO:15
    OQ.SetStage(StagetoSet) ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:25
EndFunction
