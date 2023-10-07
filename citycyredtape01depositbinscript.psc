ScriptName CityCYRedTape01DepositBinScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkCustom01 Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  If akActionRef == myPlayer as ObjectReference ; #DEBUG_LINE_NO:10
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:11
    citycyredtape01questscript myQuestScript = myQuest as citycyredtape01questscript ; #DEBUG_LINE_NO:12
    If myQuest.GetStageDone(myQuestScript.GatheredResourcesCompleteStage) && !myQuest.GetStageDone(myQuestScript.TrevorApplicationPlanStage) ; #DEBUG_LINE_NO:13
      Int iResource01Total = City_CY_RedTape01Resource01Total.GetValue() as Int ; #DEBUG_LINE_NO:14
      If myPlayer.GetItemCount(InorgCommonIron as Form) >= iResource01Total ; #DEBUG_LINE_NO:15
        myQuest.SetStage(myQuestScript.TrevorApplicationPlanStage) ; #DEBUG_LINE_NO:16
        myPlayer.RemoveItem(InorgCommonIron as Form, iResource01Total, False, None) ; #DEBUG_LINE_NO:17
        ObjectReference myRef = Self.GetRef().GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:19
        myRef.Enable(False) ; #DEBUG_LINE_NO:20
        Self.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:21
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
