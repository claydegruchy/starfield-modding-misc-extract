ScriptName UC09SceneTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PreReqStage = 310 Auto Const
{ Only check this trigger once this stage is set }
ReferenceAlias Property Abello Auto Const mandatory
{ Ref alias for President Abello }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:11
  If OQ.GetStageDone(PreReqStage) && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:12
    Abello.GetActorRef().Activate(PlayACT as ObjectReference, False) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
