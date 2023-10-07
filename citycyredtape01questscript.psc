ScriptName CityCYRedTape01QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property City_CY_RedTape01Resource01Count Auto Const mandatory
GlobalVariable Property City_CY_RedTape01Resource01Total Auto Const mandatory
MiscObject Property InorgCommonIron Auto Const mandatory
Int Property GatherResourcesStage = 100 Auto Const
Int Property IronQTStage = 110 Auto Const
Int Property GatheredResourcesCompleteStage = 200 Auto Const
Int Property TrevorApplicationPlanStage = 250 Auto Const
Int Property ResourceObjective = 100 Auto Const
Int Property TurnInObjective = 200 Auto Const
ReferenceAlias Property Player Auto Const mandatory
ReferenceAlias Property DepositBin Auto Const mandatory
RefCollectionAlias Property IronDeposits Auto Const mandatory

;-- Functions ---------------------------------------

Function RegisterPlayerforInventoryFilter(Bool bRegister)
  citycyredtape01playerscript myPlayerScript = Player as citycyredtape01playerscript ; #DEBUG_LINE_NO:21
  myPlayerScript.RegisterPlayerForResourceTracking(bRegister) ; #DEBUG_LINE_NO:22
EndFunction

Function ResourceCheck()
  City_CY_RedTape01Resource01Count.SetValue(Game.GetPlayer().GetItemCount(InorgCommonIron as Form) as Float) ; #DEBUG_LINE_NO:30
  Self.UpdateCurrentInstanceGlobal(City_CY_RedTape01Resource01Count) ; #DEBUG_LINE_NO:31
  Float fResourceCount = City_CY_RedTape01Resource01Count.GetValue() ; #DEBUG_LINE_NO:32
  Float fResourceTotal = City_CY_RedTape01Resource01Total.GetValue() ; #DEBUG_LINE_NO:33
  If fResourceCount >= fResourceTotal ; #DEBUG_LINE_NO:34
    If Self.IsObjectiveDisplayed(TurnInObjective) == False ; #DEBUG_LINE_NO:35
      Self.SetStage(GatheredResourcesCompleteStage) ; #DEBUG_LINE_NO:36
      Self.SetObjectiveDisplayed(ResourceObjective, False, False) ; #DEBUG_LINE_NO:37
      Self.SetObjectiveDisplayed(TurnInObjective, True, True) ; #DEBUG_LINE_NO:38
      DepositBin.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
  ElseIf fResourceCount >= fResourceTotal - 5.0 && fResourceCount < fResourceTotal ; #DEBUG_LINE_NO:41
    If !Self.GetStageDone(IronQTStage) ; #DEBUG_LINE_NO:42
      IronDeposits.RefillAlias() ; #DEBUG_LINE_NO:43
      Self.SetStage(IronQTStage) ; #DEBUG_LINE_NO:44
    EndIf ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(ResourceObjective, True, True) ; #DEBUG_LINE_NO:46
    Self.SetObjectiveDisplayed(TurnInObjective, False, False) ; #DEBUG_LINE_NO:47
    DepositBin.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:48
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(ResourceObjective, True, True) ; #DEBUG_LINE_NO:51
    Self.SetObjectiveDisplayed(TurnInObjective, False, False) ; #DEBUG_LINE_NO:52
    DepositBin.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == GatherResourcesStage ; #DEBUG_LINE_NO:59
    Self.RegisterPlayerforInventoryFilter(True) ; #DEBUG_LINE_NO:60
  ElseIf auiStageID == TrevorApplicationPlanStage ; #DEBUG_LINE_NO:61
    Self.RegisterPlayerforInventoryFilter(False) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DebugGiveResources()
  Game.GetPlayer().AddItem(InorgCommonIron as Form, City_CY_RedTape01Resource01Total.GetValue() as Int, False) ; #DEBUG_LINE_NO:69
EndFunction
