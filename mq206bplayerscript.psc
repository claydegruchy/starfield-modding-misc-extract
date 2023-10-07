ScriptName MQ206BPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property SanctumPlayerSeat Auto Const mandatory
Int Property iPrereqStage = 140 Auto Const
Int Property iSetStage = 150 Auto Const

;-- Functions ---------------------------------------

Event OnSit(ObjectReference akFurniture)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:8
  If akFurniture == SanctumPlayerSeat.GetRef() ; #DEBUG_LINE_NO:9
    If myQuest.GetStageDone(iPrereqStage) ; #DEBUG_LINE_NO:10
      myQuest.SetStage(iSetStage) ; #DEBUG_LINE_NO:11
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
