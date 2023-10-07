ScriptName RI07_MarketingTriggerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Armor Property RI07_ResearchUniform Auto Const mandatory
Int Property iStageToSet Auto Const mandatory
Int Property iGetStageDone Auto Const mandatory
Int Property iPreReqStage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  Quest OwningQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:10
  If (akActionRef == PlayerRef as ObjectReference) && PlayerRef.IsEquipped(RI07_ResearchUniform as Form) == False && !OwningQuest.GetStageDone(iGetStageDone) && OwningQuest.GetStageDone(iPreReqStage) ; #DEBUG_LINE_NO:11
    OwningQuest.SetStage(iStageToSet) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
