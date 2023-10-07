ScriptName UC07_BatteryContainerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC07_BatteryComponent Auto Const mandatory
{ Keyword used to designate this is one of the quest item battery components }
Int Property PrereqStage = 105 Auto Const
{ Prereq stage used to know it's okay to start tracking container changed events }

;-- Functions ---------------------------------------

Event OnQuickContainerOpened(ObjectReference akSenderRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:11
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0 ; #DEBUG_LINE_NO:12
      Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:20
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0 ; #DEBUG_LINE_NO:21
      Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:32
EndFunction
