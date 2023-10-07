ScriptName OutpostActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property AssignAsCrewOnCreation = False Auto Const
{ if true, actor will be assigned as crew when it is created }
ActorValue Property CrewReassignDisabled Auto Const
{ optional - if exists, will be set on this actor when it is created }
ActorValue Property CrewSlotCost Auto Const
{ optional - if exists, will be set to CrewSlotCostValue on this actor when it is created }
Int Property CrewSlotCostValue = -1 Auto Const
Bool Property SetEssentialOnCreation = True Auto Const
Bool Property SetNoBleedoutRecoveryOnCreation = True Auto Const

;-- Functions ---------------------------------------

Event OnWorkshopObjectPlaced(ObjectReference akReference)
  ObjectReference myWorkshop = Self.GetWorkshop() ; #DEBUG_LINE_NO:18
  Self.SetEssential(SetEssentialOnCreation) ; #DEBUG_LINE_NO:20
  Self.SetNoBleedoutRecovery(SetNoBleedoutRecoveryOnCreation) ; #DEBUG_LINE_NO:21
  If CrewReassignDisabled ; #DEBUG_LINE_NO:22
    Self.SetValue(CrewReassignDisabled, 1.0) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If CrewSlotCost ; #DEBUG_LINE_NO:25
    Self.ModValue(CrewSlotCost, CrewSlotCostValue as Float) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  Self.CheckAssignAsCrew(myWorkshop, True) ; #DEBUG_LINE_NO:29
EndEvent

Event OnWorkshopObjectRemoved(ObjectReference akReference)
  Self.CheckAssignAsCrew(akReference, False) ; #DEBUG_LINE_NO:33
EndEvent

Function CheckAssignAsCrew(ObjectReference myWorkshop, Bool bAssign)
  If AssignAsCrewOnCreation ; #DEBUG_LINE_NO:37
    If myWorkshop ; #DEBUG_LINE_NO:38
      If bAssign ; #DEBUG_LINE_NO:40
        myWorkshop.AssignCrew(Self as Actor) ; #DEBUG_LINE_NO:41
      Else ; #DEBUG_LINE_NO:
        myWorkshop.UnassignCrew(Self as Actor) ; #DEBUG_LINE_NO:43
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function testGetAllCrew()
  ObjectReference myWorkshop = Self.GetWorkshop() ; #DEBUG_LINE_NO:51
  If myWorkshop ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
