ScriptName MS01BreadcrumbMarkerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property DistanceTargerAlias Auto Const
Int Property PrereqStage Auto Const
Float Property DistanceToTrigger Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  If PrereqStage > 0 ; #DEBUG_LINE_NO:6
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:9
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, DistanceTargerAlias as ScriptObject, DistanceToTrigger, 0) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:18
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, DistanceTargerAlias as ScriptObject, DistanceToTrigger, 0) ; #DEBUG_LINE_NO:19
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  Self.GetRef().Disable(False) ; #DEBUG_LINE_NO:27
EndEvent
