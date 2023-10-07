ScriptName TestShipEventsScript Extends ReferenceAlias
{ testing new ships events }

;-- Functions ---------------------------------------

Event OnCrewAssigned(Actor akCrew, ObjectReference akAssignmentRef, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCrewDismissed(Actor akCrew, ObjectReference akPreviousAssignmentRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDeath(ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipRefueled(Int aFuelAdded)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemPowerChange(ActorValue akSystem, Bool abAddPower, Bool abDamageRelated)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipFarTravel(Location aDepartureLocation, Location aArrivalLocation, Int aState)
  If aState == 0 ; #DEBUG_LINE_NO:28
     ; #DEBUG_LINE_NO:
  ElseIf aState == 1 ; #DEBUG_LINE_NO:30
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipGravJump(Location aDestination, Int aState)
  spaceshipreference MyShip = None ; #DEBUG_LINE_NO:37
  MyShip = Self.GetShipRef() ; #DEBUG_LINE_NO:38
  If aState == 0 ; #DEBUG_LINE_NO:41
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aState == 1 ; #DEBUG_LINE_NO:45
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aState == 2 ; #DEBUG_LINE_NO:49
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aState == 3 ; #DEBUG_LINE_NO:53
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipTakeOff(Bool abComplete)
  If !abComplete ; #DEBUG_LINE_NO:59
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If abComplete ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipUndock(Bool abComplete, spaceshipreference akUndocking, spaceshipreference akParent)
  If !abComplete ; #DEBUG_LINE_NO:69
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If abComplete ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipDock(Bool abComplete, spaceshipreference akDocking, spaceshipreference akParent)
  If !abComplete ; #DEBUG_LINE_NO:79
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If abComplete ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemDamaged(ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  If aElectromagneticDamage ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnShipSystemRepaired(ActorValue akSystem, Int aBlocksGained, Bool aElectromagneticDamage)
  If aElectromagneticDamage ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
