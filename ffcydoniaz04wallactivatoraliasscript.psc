ScriptName FFCydoniaZ04WallActivatorAliasScript Extends RefCollectionAlias
{ Modifies a global value for the Quest Objective, Enables a linked ref, and Removes the Activated Ref from the Collection }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaZ04_DrawingsPosted Auto Const mandatory
GlobalVariable Property FFCydoniaZ04_DrawingsTotal Auto Const mandatory
Keyword Property LinkCustom01 Auto Const mandatory
Int Property ObjectiveToUpdate Auto Const mandatory
Int Property StageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:12
    If akSenderRef.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:13
      akSenderRef.GetLinkedRef(LinkCustom01).Enable(False) ; #DEBUG_LINE_NO:14
      akSenderRef.BlockActivation(True, True) ; #DEBUG_LINE_NO:15
      Float fTotalDrawings = FFCydoniaZ04_DrawingsTotal.GetValue() ; #DEBUG_LINE_NO:16
      If FFCydoniaZ04_DrawingsPosted.GetValue() <= fTotalDrawings ; #DEBUG_LINE_NO:17
        Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:18
        If myQuest.ModObjectiveGlobal(1.0, FFCydoniaZ04_DrawingsPosted, ObjectiveToUpdate, fTotalDrawings, True, True, True, False) == True ; #DEBUG_LINE_NO:19
          myQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:20
        EndIf ; #DEBUG_LINE_NO:
        Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:22
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasInit()
  Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:30
EndEvent
