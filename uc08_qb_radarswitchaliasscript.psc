ScriptName UC08_QB_RadarSwitchAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 160 Auto Const
{ Don't trigger this behavior unless this stage is set }
Int Property ShutdownStage = 900 Auto Const
{ If this stage has been set, the Queen's down and we don't need to do any more with this }
RefCollectionAlias Property SupportCollection Auto Const mandatory
{ The collection holding the support creatures spawned in by this switch }
RefCollectionAlias Property SupportMorphCollection Auto Const mandatory
{ The collection of morphs associated with this switch }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  uc08_queenbattle_questscript OQ = Self.GetOwningQuest() as uc08_queenbattle_questscript ; #DEBUG_LINE_NO:16
  If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:18
    Self.Clear() ; #DEBUG_LINE_NO:19
    ObjectReference BroadcastREF = Self.GetRef().GetLinkedRef(None) ; #DEBUG_LINE_NO:20
    OQ.TriggerRadarBlast(BroadcastREF, SupportMorphCollection, SupportCollection) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
