ScriptName AttachAshPile Extends ActiveMagicEffect
{ Scripted effect for on death ash pile }

;-- Variables ---------------------------------------
Actor Victim

;-- Properties --------------------------------------
Float Property fDelay = 0.75 Auto Const
{ time to wait before Spawning Ash Pile }
Float Property fDelayEnd = 1.649999976 Auto Const
{ time to wait before Removing Base Actor }
Float Property ShaderDuration = 0.0 Auto Const
{ Duration of Effect Shader. }
Activator Property AshPileObject Auto Const
{ The object we use as a pile. }
EffectShader Property MagicEffectShader Auto Const
{ The Effect Shader we want. }
Bool Property bSetAlphaZero = True Auto Const
{ When done, set the Actor Alpha to zero. }
Bool Property bSetAlphaToZeroEarly = False Auto Const
{ Use this if we want to set the actor to invisible somewhere before the effect shader is done. }
Bool Property onEffectStartOveride = False Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  Victim = Self.GetTargetActor() ; #DEBUG_LINE_NO:45
EndEvent

Event OnEffectStart(ObjectReference Target, Actor Caster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If Victim as Bool && Victim.IsEssential() == False ; #DEBUG_LINE_NO:50
    If onEffectStartOveride == True ; #DEBUG_LINE_NO:51
      Victim.SetCriticalStage(Victim.CritStage_DisintegrateStart) ; #DEBUG_LINE_NO:52
      If MagicEffectShader != None ; #DEBUG_LINE_NO:53
        MagicEffectShader.play(Victim as ObjectReference, ShaderDuration) ; #DEBUG_LINE_NO:54
      EndIf ; #DEBUG_LINE_NO:
      Self.StartTimer(fDelay, 1) ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference Killer)
  If Victim as Bool && Victim.IsEssential() == False ; #DEBUG_LINE_NO:62
    If onEffectStartOveride == False ; #DEBUG_LINE_NO:63
      Victim.SetCriticalStage(Victim.CritStage_DisintegrateStart) ; #DEBUG_LINE_NO:65
      If MagicEffectShader != None ; #DEBUG_LINE_NO:66
        MagicEffectShader.play(Victim as ObjectReference, ShaderDuration) ; #DEBUG_LINE_NO:67
      EndIf ; #DEBUG_LINE_NO:
      Self.StartTimer(fDelay, 1) ; #DEBUG_LINE_NO:69
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == 1 ; #DEBUG_LINE_NO:75
    Victim.AttachAshPile(AshPileObject as Form) ; #DEBUG_LINE_NO:76
    Self.StartTimer(fDelayEnd, 2) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  If aiTimerID == 2 ; #DEBUG_LINE_NO:80
    If MagicEffectShader != None ; #DEBUG_LINE_NO:81
      MagicEffectShader.stop(Victim as ObjectReference) ; #DEBUG_LINE_NO:82
    EndIf ; #DEBUG_LINE_NO:
    If bSetAlphaZero == True ; #DEBUG_LINE_NO:84
      Victim.SetAlpha(0.0, True) ; #DEBUG_LINE_NO:85
    EndIf ; #DEBUG_LINE_NO:
    Victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndEvent
