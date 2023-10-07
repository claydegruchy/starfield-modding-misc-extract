ScriptName TargetingEffectScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------
Bool modifySuccess

;-- Properties --------------------------------------
GlobalVariable Property MaxEnemiesThatCanBeAffected Auto Const mandatory
targetingskillplayeraliasscript Property TargetingSkillPlayer Auto Const mandatory
EffectShader Property EffectShaderToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  modifySuccess = TargetingSkillPlayer.TryToModifyTargetCount(1, MaxEnemiesThatCanBeAffected.GetValueInt()) ; #DEBUG_LINE_NO:10
  If !modifySuccess ; #DEBUG_LINE_NO:11
    Self.Dispel() ; #DEBUG_LINE_NO:12
    EffectShaderToApply.Stop(akTarget) ; #DEBUG_LINE_NO:13
  Else ; #DEBUG_LINE_NO:
    EffectShaderToApply.Play(akTarget, -1.0) ; #DEBUG_LINE_NO:15
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If modifySuccess ; #DEBUG_LINE_NO:22
    TargetingSkillPlayer.TryToModifyTargetCount(-1, 0) ; #DEBUG_LINE_NO:23
    EffectShaderToApply.Stop(akTarget) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
