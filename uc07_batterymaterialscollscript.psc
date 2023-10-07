ScriptName UC07_BatteryMaterialsCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property UC07_BatteryComponent Auto Const mandatory
{ Keyword used to designate this is one of the quest item battery components }
RefCollectionAlias Property BatteryContainers Auto Const mandatory
{ Ref collection that contains all the battery component containers }
Int Property PrereqStage = 105 Auto Const
{ Prereq stage used to know it's okay to start tracking container changed events }

;-- Functions ---------------------------------------

Event OnQuickContainerOpened(ObjectReference akSenderRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:14
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0 ; #DEBUG_LINE_NO:15
      BatteryContainers.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:17
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:23
    If akSenderRef.GetItemCount(UC07_BatteryComponent as Form) <= 0 ; #DEBUG_LINE_NO:24
      BatteryContainers.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnContainerChanged(ObjectReference akSenderRef, ObjectReference akNewContainer, ObjectReference akOldContainer)
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:34
    If akOldContainer.GetItemCount(UC07_BatteryComponent as Form) <= 0 ; #DEBUG_LINE_NO:35
      BatteryContainers.RemoveRef(akOldContainer) ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:46
EndFunction
