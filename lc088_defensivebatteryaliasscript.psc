ScriptName LC088_DefensiveBatteryAliasScript Extends ReferenceAlias
{ Script to toggle the Defensive Batteries' Laser Fire. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group AutofillProperties
  VisualEffect Property FX_ShipExplosionHugeBattery Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  ObjectReference selfRef = Self.GetReference() ; #DEBUG_LINE_NO:9
  FX_ShipExplosionHugeBattery.Play(selfRef, -1.0, None) ; #DEBUG_LINE_NO:10
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:11
  selfRef.Disable(False) ; #DEBUG_LINE_NO:12
EndEvent
