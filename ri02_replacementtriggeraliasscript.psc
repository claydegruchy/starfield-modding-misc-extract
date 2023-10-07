ScriptName RI02_ReplacementTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property NinaPresentation Auto Const mandatory
ReferenceAlias Property NinaPresentationReplacement Auto Const mandatory
ReferenceAlias Property NinaPresentationMarker Auto Const mandatory
MiscObject Property RI02_NinaPresentationReplacement Auto Const mandatory
Int Property iStageSwapPresentation = 500 Auto Const
Int Property iStageSwapCompleted = 575 Auto Const
Int Property iStageReturnToImogene = 600 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference MyPlayer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:13
  Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:14
  If akActionRef == MyPlayer && MyPlayer.GetItemCount(RI02_NinaPresentationReplacement as Form) >= 1 ; #DEBUG_LINE_NO:16
    Self.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:17
    MyPlayer.AddItem(NinaPresentation.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:18
    Utility.Wait(1.0) ; #DEBUG_LINE_NO:19
    MyPlayer.RemoveItem(NinaPresentationReplacement.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:21
    NinaPresentationMarker.GetRef().PlaceAtMe(RI02_NinaPresentationReplacement as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:22
    MyQuest.SetStage(iStageSwapCompleted) ; #DEBUG_LINE_NO:24
    If MyQuest.IsObjectiveDisplayed(iStageSwapPresentation) ; #DEBUG_LINE_NO:26
      MyQuest.SetStage(iStageReturnToImogene) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
