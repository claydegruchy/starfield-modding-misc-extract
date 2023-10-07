ScriptName PersonalAtmosphereAudioEffectScript Extends ActiveMagicEffect
{ Effect script for the Personal Atmosphere spell. Attaches an audio occlusion sphere to the target. }

;-- Variables ---------------------------------------
ObjectReference occlusionMarker
ObjectReference occlusionPivot

;-- Properties --------------------------------------
Quest Property PersonalAtmosphereFXQuest Auto Const mandatory
ReferenceAlias Property PersonalAtmospherePackin Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Actor player = Game.GetPlayer() ; #DEBUG_LINE_NO:14
  If akTarget == player as ObjectReference ; #DEBUG_LINE_NO:15
    PersonalAtmosphereFXQuest.Start() ; #DEBUG_LINE_NO:16
    occlusionPivot = PersonalAtmospherePackin.GetRef() ; #DEBUG_LINE_NO:17
    occlusionMarker = occlusionPivot.GetLinkedRef(None) ; #DEBUG_LINE_NO:19
    occlusionMarker.MoveTo(player as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
    occlusionMarker.AttachTo(akTarget) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If akTarget == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:26
    PersonalAtmosphereFXQuest.Stop() ; #DEBUG_LINE_NO:27
    occlusionPivot.Delete() ; #DEBUG_LINE_NO:28
    occlusionMarker.Delete() ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent
