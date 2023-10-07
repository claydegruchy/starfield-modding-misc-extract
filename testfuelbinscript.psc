ScriptName TestFuelBinScript Extends ObjectReference
{ attempts to refuel the spaceship it is in }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property FuelObject Auto
Float Property FuelScorePerObject Auto Const
Float Property MaxPossibleFuel Auto Const
ActorValue Property FuelActorValue Auto Const
Quest Property myQuest Auto Const
Int Property StageToSet Auto Const
Int Property PrereqStage = -1 Auto Const
Int Property FuelNeededToSetStage = 10 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.AddInventoryEventFilter(FuelObject as Form) ; #DEBUG_LINE_NO:16
EndEvent

Event OnClose(ObjectReference akActionRef)
  ObjectReference spaceship = None ; #DEBUG_LINE_NO:21
  spaceship = Self.GetCurrentShipRef() as ObjectReference ; #DEBUG_LINE_NO:22
  If (Self.GetItemCount(FuelObject as Form) > 0 && spaceship as Bool) && spaceship.GetValue(FuelActorValue) < 100.0 ; #DEBUG_LINE_NO:23
    Self.RemoveItem(FuelObject as Form, 1, False, None) ; #DEBUG_LINE_NO:24
    Self.ModValue(FuelActorValue, FuelScorePerObject) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  ObjectReference spaceship = None ; #DEBUG_LINE_NO:30
  spaceship = Self.GetCurrentShipRef() as ObjectReference ; #DEBUG_LINE_NO:31
  If spaceship ; #DEBUG_LINE_NO:32
    Float currentFuel = spaceship.GetValue(FuelActorValue) ; #DEBUG_LINE_NO:33
    Int numFuel = Self.GetItemCount(FuelObject as Form) ; #DEBUG_LINE_NO:34
    If (FuelScorePerObject * numFuel as Float) + currentFuel > MaxPossibleFuel ; #DEBUG_LINE_NO:35
      numFuel = Math.Floor((MaxPossibleFuel - currentFuel) / FuelScorePerObject) ; #DEBUG_LINE_NO:36
    EndIf ; #DEBUG_LINE_NO:
    Self.RemoveItem(FuelObject as Form, numFuel, False, None) ; #DEBUG_LINE_NO:38
    spaceship.ModValue(FuelActorValue, FuelScorePerObject * numFuel as Float) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  If spaceship.GetValue(FuelActorValue) as Int >= FuelNeededToSetStage ; #DEBUG_LINE_NO:43
    If PrereqStage == -1 || myQuest.GetStageDone(PrereqStage) == True ; #DEBUG_LINE_NO:44
      myQuest.SetStage(StageToSet) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
