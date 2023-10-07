ScriptName FXScripts:FXSetBoundSizeActorValue Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property VFXActorBoundSize Auto
Float Property ScaleFactor = 2.002199888 Auto
{ Scale Value to modify bound volume.  Default will result in ~1.0 for human NPC }

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Float x = akTarget.GetWidth() ; #DEBUG_LINE_NO:21
  Float y = akTarget.GetLength() ; #DEBUG_LINE_NO:22
  Float z = akTarget.GetHeight() ; #DEBUG_LINE_NO:23
  Float Volume = x * x + y * y + z * z ; #DEBUG_LINE_NO:24
  Float Diagonal = Math.sqrt(Volume) ; #DEBUG_LINE_NO:25
  akTarget.SetValue(VFXActorBoundSize, Diagonal / ScaleFactor) ; #DEBUG_LINE_NO:27
EndEvent
