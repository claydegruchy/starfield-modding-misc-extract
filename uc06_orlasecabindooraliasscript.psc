ScriptName UC06_OrlaseCabinDoorAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property UC06_OrlaseCabinKey Auto Const mandatory
{ Item to check if the player has to see if we should set this stage }
Int Property ShutdownStage = 450 Auto Const
{ Player already unlocked the door. Can now ignore setting this stage. }
Int Property StageToSet = 445 Auto Const
{ Stage to set if all criteria's met }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:13
  Actor PlayACT = Game.GetPlayer() ; #DEBUG_LINE_NO:14
  If akActionRef == PlayACT as ObjectReference ; #DEBUG_LINE_NO:16
    If !OQ.GetStageDone(StageToSet) && !OQ.GetStageDone(ShutdownStage) && PlayACT.GetItemCount(UC06_OrlaseCabinKey as Form) < 1 ; #DEBUG_LINE_NO:18
      OQ.SetStage(StageToSet) ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
