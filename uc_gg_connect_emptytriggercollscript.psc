ScriptName UC_GG_Connect_EmptyTriggerCollScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 200 Auto Const
{ Only start shutting off trigger once this stage is set }
Int Property ShutdownStage = 350 Auto Const
{ Once this stage is set, we can stop checking (because the player's already found the right one) }
Int Property ObjectiveIndex = 200 Auto Const
{ Objective index we're modifying as each one of these triggers is updated }
GlobalVariable Property UC_GG_Connect_StopsCompleted Auto Const mandatory
{ Global used to track how many triggers the player's entered }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
    Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
    If OQ.GetStageDone(PrereqStage) && !OQ.GetStageDone(ShutdownStage) ; #DEBUG_LINE_NO:19
      Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:20
      OQ.ModObjectiveGlobal(1.0, UC_GG_Connect_StopsCompleted, ObjectiveIndex, -1.0, True, True, True, False) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
