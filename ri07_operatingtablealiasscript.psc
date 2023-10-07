ScriptName RI07_OperatingTableAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property iActivatedChairStage Auto Const mandatory
Int Property iEnteredChairStage Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory
Int Property iTurnOffStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEnterFurniture(Actor akActionRef)
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
  If akActionRef == Game.GetPlayer() && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:12
    OwningQuest.SetStage(iEnteredChairStage) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:20
  If (akActionRef == Game.GetPlayer() as ObjectReference) && OwningQuest.GetStageDone(iPreReqStage) && !OwningQuest.GetStageDone(iTurnOffStage) ; #DEBUG_LINE_NO:22
    OwningQuest.SetStage(iActivatedChairStage) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent
