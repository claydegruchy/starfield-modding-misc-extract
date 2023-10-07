ScriptName UC01_CuttableWallCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property TargetDestructionState = 1 Auto Const
{ If the object has switched to this state, disable its linked ref }
Int Property StageToSet = 345 Auto Const
{ Once this collection has been emptied, set this stage }

;-- Functions ---------------------------------------

Event OnDestructionStageChanged(ObjectReference akSenderRef, Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage == TargetDestructionState ; #DEBUG_LINE_NO:11
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:12
    If Self.GetCount() <= 0 ; #DEBUG_LINE_NO:14
      Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:24
EndFunction
