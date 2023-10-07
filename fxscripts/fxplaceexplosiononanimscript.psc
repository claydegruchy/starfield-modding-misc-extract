ScriptName FXScripts:FXPlaceExplosionOnAnimScript Extends ActiveMagicEffect
{ This script places explosions at specific locations on an actor when the specified animation events are called.  For use with AOE attacks. }

;-- Structs -----------------------------------------
Struct AreaAttackDatum
  Explosion ExplosionEffect
  String sAnimEventName
  String sFXNodeName
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
fxscripts:fxplaceexplosiononanimscript:areaattackdatum[] Property AttackData Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0 ; #DEBUG_LINE_NO:15
  While I < AttackData.Length ; #DEBUG_LINE_NO:16
    Self.RegisterForAnimationEvent(akCaster as ObjectReference, AttackData[I].sAnimEventName) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0 ; #DEBUG_LINE_NO:24
  While I < AttackData.Length ; #DEBUG_LINE_NO:25
    Self.UnRegisterForAnimationEvent(akCaster as ObjectReference, AttackData[I].sAnimEventName) ; #DEBUG_LINE_NO:26
    I += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.PlayEffectFromListRecursive(akSource, AttackData, asEventName, 0) ; #DEBUG_LINE_NO:33
EndEvent

Function PlayEffectFromListRecursive(ObjectReference akSourceRef, fxscripts:fxplaceexplosiononanimscript:areaattackdatum[] DataSet, String asAnimEvent, Int aiStartIndex)
  Int iFoundIndex = DataSet.findstruct("sAnimEventName", asAnimEvent, aiStartIndex) ; #DEBUG_LINE_NO:39
  If iFoundIndex >= 0 ; #DEBUG_LINE_NO:40
    akSourceRef.placeatNode(DataSet[iFoundIndex].sFXNodeName, DataSet[iFoundIndex].ExplosionEffect as Form, 1, False, False, True, False) ; #DEBUG_LINE_NO:41
    If iFoundIndex >= 0 && iFoundIndex + 1 < DataSet.Length ; #DEBUG_LINE_NO:44
      Self.PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, iFoundIndex + 1) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
