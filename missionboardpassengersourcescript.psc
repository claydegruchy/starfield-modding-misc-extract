ScriptName MissionBoardPassengerSourceScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorBase Property Passenger Auto Const mandatory
{ base actor to use to create passengers }
Int Property PassengerCountMin = 2 Auto Const
Int Property PassengerCountMax = 3 Auto Const
Float Property MissionTimeMult = 1.0 Auto Const
{ set to increase/decrease amount of time for this quest }
Int Property ExtraRewardPerPassenger = 20 Auto Const
{ how much award per passenger? }

;-- Functions ---------------------------------------

Function CreatePassengers(RefCollectionAlias PassengerCollection, ObjectReference PassengerMarker, Int PassengerCount)
  Int I = 0 ; #DEBUG_LINE_NO:18
  While I < PassengerCount ; #DEBUG_LINE_NO:19
    ObjectReference passengerRef = PassengerMarker.PlaceAtMe(Passenger as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:20
    PassengerCollection.AddRef(passengerRef) ; #DEBUG_LINE_NO:22
    I += 1 ; #DEBUG_LINE_NO:23
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
