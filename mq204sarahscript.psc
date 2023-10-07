ScriptName MQ204SarahScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Int StagePlayerLeftLodge = 420
Int StageToSetLeftLodge = 440

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Quest myMQ204 = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
    If myMQ204.GetStageDone(StagePlayerLeftLodge) ; #DEBUG_LINE_NO:10
      myMQ204.SetStage(StageToSetLeftLodge) ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
