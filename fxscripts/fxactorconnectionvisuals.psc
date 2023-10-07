ScriptName FXScripts:FXActorConnectionVisuals Extends ActiveMagicEffect
{ Script for play a visual effect that connects one actor to another. }

;-- Variables ---------------------------------------
Bool DeadAlready = False
Int ResampleTimer = 123
Bool bStopEffects = False

;-- Properties --------------------------------------
ImageSpaceModifier Property TrapImod Auto
{ IsMod applied when we trap a soul }
VisualEffect Property TargetVFX Auto
{ Visual Effect on Target aiming at Caster }
VisualEffect Property CasterVFX Auto
{ Visual Effect on Caster aming at Target }
EffectShader Property CasterFXS Auto
{ Effect Shader on Caster during Soul trap }
EffectShader Property TargetFXS Auto
{ Effect Shader on Target during Soul trap }
Bool Property bIsEnchantmentEffect = False Auto
{ Set this to true if this soul trap is on a weapon enchantment or a spell that can do damage to deal with a fringe case }
Float Property AbsorbFXDuration = 10.0 Auto
ActorValue Property VFXTargetDistance Auto
Float Property ResampleDelay = 0.25 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If bIsEnchantmentEffect == False ; #DEBUG_LINE_NO:36
    Actor TargetActor = Self.GetTargetActor() ; #DEBUG_LINE_NO:37
    DeadAlready = TargetActor.IsDead() ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  If akTarget ; #DEBUG_LINE_NO:40
    TargetVFX.Play(akTarget, AbsorbFXDuration, akCaster as ObjectReference) ; #DEBUG_LINE_NO:41
    CasterVFX.Play(akCaster as ObjectReference, AbsorbFXDuration, akTarget) ; #DEBUG_LINE_NO:42
    Self.UpdateTargetDistance(akTarget, akCaster) ; #DEBUG_LINE_NO:43
    Self.StartTimer(ResampleDelay, ResampleTimer) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget ; #DEBUG_LINE_NO:50
    TargetVFX.Stop(akTarget) ; #DEBUG_LINE_NO:51
    CasterVFX.Stop(akCaster as ObjectReference) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
  bStopEffects = True ; #DEBUG_LINE_NO:54
EndEvent

Event OnTimer(Int aiTimerID)
  If !bStopEffects ; #DEBUG_LINE_NO:58
    If aiTimerID == ResampleTimer ; #DEBUG_LINE_NO:59
      If Self.GetElapsedTime() < 5.0 ; #DEBUG_LINE_NO:60
        Self.GetTargetActor() ; #DEBUG_LINE_NO:61
        Self.UpdateTargetDistance(Self.GetTargetActor() as ObjectReference, Self.GetCasterActor()) ; #DEBUG_LINE_NO:62
        Self.StartTimer(ResampleDelay, ResampleTimer) ; #DEBUG_LINE_NO:63
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateTargetDistance(ObjectReference akTarget, Actor akCaster)
  Float Dist = akCaster.GetDistance(akTarget) ; #DEBUG_LINE_NO:70
  akTarget.SetValue(VFXTargetDistance, Dist) ; #DEBUG_LINE_NO:71
EndFunction
