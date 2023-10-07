ScriptName UC03_AliasMoveRefOnUnload Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage01 = 500 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage01 = 505 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker01 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }
Int Property PrereqStage02 = 100 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage02 = 105 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker02 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }
Int Property PrereqStage03 = 350 Auto Const
{ Don't attempt to move the NPC until this stage has been set }
Int Property ShutdownStage03 = 355 Auto Const
{ Once this teleport has happened, set this stage so it doesn't happen again }
ObjectReference Property TeleportMarker03 Auto Const mandatory
{ The marker to which the ref should be teleported once she unloads }

;-- Functions ---------------------------------------

Event OnUnload()
  ObjectReference myRef = Self.GetRef() ; #DEBUG_LINE_NO:32
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:33
  If !OQ.GetStageDone(ShutdownStage01) && OQ.GetStageDone(PrereqStage01) ; #DEBUG_LINE_NO:34
    OQ.SetStage(ShutdownStage01) ; #DEBUG_LINE_NO:36
    myRef.MoveTo(TeleportMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
  ElseIf !OQ.GetStageDone(ShutdownStage02) && OQ.GetStageDone(PrereqStage02) ; #DEBUG_LINE_NO:38
    OQ.SetStage(ShutdownStage02) ; #DEBUG_LINE_NO:40
    myRef.MoveTo(TeleportMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
  ElseIf !OQ.GetStageDone(ShutdownStage03) && OQ.GetStageDone(PrereqStage03) ; #DEBUG_LINE_NO:42
    OQ.SetStage(ShutdownStage03) ; #DEBUG_LINE_NO:44
    myRef.MoveTo(TeleportMarker03, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:53
EndFunction
