ScriptName ENV_AFFL_PainEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
ActorValue HealthAV
Float HealthCached

;-- Properties --------------------------------------
Group Properties
  ActorValue Property Oxygen Auto Const mandatory
  { autofill }
  GlobalVariable Property ENV_AFFL_Symp_Pain_MaxOxygenDamage Auto Const mandatory
  { autofill; multiply damage by this amount to derive how much to damage O2 }
  GlobalVariable Property ENV_AFFL_Symp_Pain_MinOxygenDamage Auto Const mandatory
  { autofill; min amount of O2 damage allowed }
  GlobalVariable Property ENV_AFFL_Symp_Pain_HealthToOxygenMult Auto Const mandatory
  { autofill; max amount of O2 damage allowed }
  Spell Property SpellToCast Auto Const mandatory
  { spell to cast when damaging O2 - this is for the watch warning "reminder" spell }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  HealthAV = Game.GetHealthAV() ; #DEBUG_LINE_NO:25
  HealthCached = akTarget.GetValue(HealthAV) ; #DEBUG_LINE_NO:26
  Self.RegisterForDamage(akTarget) ; #DEBUG_LINE_NO:27
EndEvent

Function RegisterForDamage(ObjectReference TargetRef)
  If Self.IsBoundGameObjectAvailable() && TargetRef as Bool ; #DEBUG_LINE_NO:31
    Self.RegisterForActorValueChangedEvent(TargetRef, HealthAV) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnActorValueChanged(ObjectReference akObjRef, ActorValue akActorValue)
  If akObjRef ; #DEBUG_LINE_NO:37
    Float currentHealth = akObjRef.GetValue(HealthAV) ; #DEBUG_LINE_NO:39
    Float change = HealthCached - currentHealth ; #DEBUG_LINE_NO:40
    HealthCached = currentHealth ; #DEBUG_LINE_NO:41
    If change > 0.0 ; #DEBUG_LINE_NO:43
      Float O2Dmg = Math.Clamp(change * ENV_AFFL_Symp_Pain_HealthToOxygenMult.GetValue(), ENV_AFFL_Symp_Pain_MinOxygenDamage.GetValue(), ENV_AFFL_Symp_Pain_MaxOxygenDamage.GetValue()) ; #DEBUG_LINE_NO:44
      akObjRef.DamageValue(Oxygen, O2Dmg) ; #DEBUG_LINE_NO:46
      SpellToCast.Cast(akObjRef, akObjRef) ; #DEBUG_LINE_NO:47
    EndIf ; #DEBUG_LINE_NO:
    Self.RegisterForDamage(akObjRef) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:57
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:61
EndFunction
