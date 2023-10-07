ScriptName RI01_QuestScript Extends Quest

;-- Variables ---------------------------------------
inputenablelayer InterviewLayer

;-- Properties --------------------------------------
ReferenceAlias Property NeonTerraBrewEmployee Auto Const mandatory
ReferenceAlias Property NeonTerraBrewEmployeeFurniture Auto Const mandatory
ReferenceAlias Property TerraBrewCoffeeOrder Auto Const mandatory
MiscObject Property RI01_TerraBrewOrder Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
ActorBase Property FC_Neon_TerraBrewEmployee Auto Const mandatory
GlobalVariable Property TrueGlobal Auto Const mandatory
Int Property iPickUpCoffeeStage = 500 Auto Const

;-- Functions ---------------------------------------

Event OnStageSet(Int auiStageID, Int auiItemID)
  If TrueGlobal.GetValue() == 0.0 ; #DEBUG_LINE_NO:20
    If auiStageID == iPickUpCoffeeStage ; #DEBUG_LINE_NO:23
      Actor EmployeeRef = NeonTerraBrewEmployee.GetActorRef() ; #DEBUG_LINE_NO:25
      If EmployeeRef.IsDead() ; #DEBUG_LINE_NO:27
        EmployeeRef.Resurrect() ; #DEBUG_LINE_NO:28
        EmployeeRef.MoveTo(NeonTerraBrewEmployeeFurniture.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf auiStageID == iPickUpCoffeeStage ; #DEBUG_LINE_NO:37
    Actor employeeref = NeonTerraBrewEmployee.GetActorRef() ; #DEBUG_LINE_NO:39
    If employeeref.IsDead() ; #DEBUG_LINE_NO:41
      employeeref.Disable(False) ; #DEBUG_LINE_NO:42
      NeonTerraBrewEmployee.Clear() ; #DEBUG_LINE_NO:43
      NeonTerraBrewEmployeeFurniture.GetRef().PlaceAtMe(FC_Neon_TerraBrewEmployee as Form, 1, False, False, True, None, NeonTerraBrewEmployee as Alias, True) ; #DEBUG_LINE_NO:44
      NeonTerraBrewEmployee.GetRef().SetLinkedRef(NeonTerraBrewEmployeeFurniture.GetRef(), None, True) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function FreezeControls()
  Game.GetPlayer().StopCombatAlarm() ; #DEBUG_LINE_NO:58
  InterviewLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:59
  InterviewLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function UnfreezeControls()
  InterviewLayer = None ; #DEBUG_LINE_NO:66
EndFunction
