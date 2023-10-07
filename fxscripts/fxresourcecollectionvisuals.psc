ScriptName FXScripts:FXResourceCollectionVisuals Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------
Int ResampleTimer = 1235
Bool bStopEffects = False

;-- Properties --------------------------------------
ImageSpaceModifier Property TrapImod Auto
{ IsMod applied when we trap a soul }
VisualEffect Property TargetVFX Auto
{ Visual Effect on Target aiming at Caster }
VisualEffect Property CasterVFX Auto
{ Visual Effect on Caster aming at Target }
Float Property AbsorbFXDuration = 10.0 Auto
ActorValue Property VFXTargetDistance Auto
Float Property ResampleDelay = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget ; #DEBUG_LINE_NO:34
    TargetVFX.Play(akTarget, AbsorbFXDuration, akCaster as ObjectReference) ; #DEBUG_LINE_NO:35
    Self.UpdateTargetDistance(akTarget, akCaster) ; #DEBUG_LINE_NO:37
    Self.StartTimer(ResampleDelay, ResampleTimer) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget ; #DEBUG_LINE_NO:44
    TargetVFX.Stop(akTarget) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  bStopEffects = True ; #DEBUG_LINE_NO:48
EndEvent

Event OnTimer(Int aiTimerID)
  If !bStopEffects ; #DEBUG_LINE_NO:52
    If aiTimerID == ResampleTimer ; #DEBUG_LINE_NO:53
      If Self.GetElapsedTime() < 5.0 ; #DEBUG_LINE_NO:54
        Self.GetTargetActor() ; #DEBUG_LINE_NO:55
        Self.UpdateTargetDistance(Self.GetTargetActor() as ObjectReference, Self.GetCasterActor()) ; #DEBUG_LINE_NO:56
        Self.StartTimer(ResampleDelay, ResampleTimer) ; #DEBUG_LINE_NO:57
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateTargetDistance(ObjectReference akTarget, Actor akCaster)
  Float Dist = akCaster.GetDistance(akTarget) ; #DEBUG_LINE_NO:64
  akTarget.SetValue(VFXTargetDistance, Dist) ; #DEBUG_LINE_NO:65
EndFunction
