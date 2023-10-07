ScriptName RyujinPlayerChairAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iStageToSet Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:8
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:9
  If akActionRef == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:11
    If !PlayerRef.IsInCombat() && OwningQuest.GetStageDone(iPreReqStage) ; #DEBUG_LINE_NO:12
      OwningQuest.SetStage(iStageToSet) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
