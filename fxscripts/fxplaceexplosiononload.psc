ScriptName FXScripts:FXPlaceExplosionOnLoad Extends ActiveMagicEffect Const
{ Places a activator on death. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Explosion Property PlacedExplosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Actor targetActor = Self.GetTargetActor() ; #DEBUG_LINE_NO:7
  If targetActor ; #DEBUG_LINE_NO:8
    targetActor.PlaceAtMe(PlacedExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
