ScriptName FABStartSceneScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property TargetAlias Auto Const mandatory
{ The alias we're interested in }
Float Property TargetDistance Auto Const mandatory
{ The needed distance between this and the target }
Int Property StageToSet = -1 Auto Const mandatory
{ Stage to Set }
Int Property ShutdownStage = -1 Auto Const
{ If this stage is set, skip this scene }
Scene Property SceneToStart Auto Const
{ Scene to fire }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:19
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If ShutdownStage <= -1 || !Self.GetOwningQuest().GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:23
    If StageToSet > -1 ; #DEBUG_LINE_NO:24
      Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:25
      SceneToStart.Start() ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
