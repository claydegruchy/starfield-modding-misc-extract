ScriptName FXPlaceActivatorOnDeath Extends ActiveMagicEffect Const
{ Places a activator on death. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Activator Property PlacedActivator Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDeath(ObjectReference akKiller)
  Actor targetActor = Self.GetTargetActor() ; #DEBUG_LINE_NO:8
  If targetActor ; #DEBUG_LINE_NO:9
    targetActor.PlaceAtMe(PlacedActivator as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent
