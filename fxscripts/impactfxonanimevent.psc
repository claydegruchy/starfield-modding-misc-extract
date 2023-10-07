ScriptName FXScripts:ImpactFXOnAnimEvent Extends ActiveMagicEffect
{ Play an impact effect in response to an animation event. }

;-- Structs -----------------------------------------
Struct ImpactRaycastDatum
  ImpactDataSet ImpactFX
  String sAnimEventName
  String sFXNodeName = "Root"
  Float x = 0.0
  Float y = 0.0
  Float z = -1.0
  Bool bUseNodeRotation = True
EndStruct


;-- Variables ---------------------------------------
ObjectReference ObjRef

;-- Properties --------------------------------------
fxscripts:impactfxonanimevent:impactraycastdatum[] Property ImpactRaycastList Auto Const mandatory
Float Property ImpactRecastDelay = 0.100000001 Auto Const
Float Property ImpactRange = 10.0 Auto Const
Float Property ImpactRecastStopTime = 4.0 Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ObjRef = akCaster as ObjectReference ; #DEBUG_LINE_NO:35
  Int I = 0 ; #DEBUG_LINE_NO:36
  While I < ImpactRaycastList.Length ; #DEBUG_LINE_NO:37
    Self.RegisterForAnimationEvent(akCaster as ObjectReference, ImpactRaycastList[I].sAnimEventName) ; #DEBUG_LINE_NO:38
    I += 1 ; #DEBUG_LINE_NO:39
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int I = 0 ; #DEBUG_LINE_NO:45
  While I < ImpactRaycastList.Length ; #DEBUG_LINE_NO:46
    Self.UnRegisterForAnimationEvent(akCaster as ObjectReference, ImpactRaycastList[I].sAnimEventName) ; #DEBUG_LINE_NO:47
    I += 1 ; #DEBUG_LINE_NO:48
  EndWhile ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Self.PlayEffectFromListRecursive(ObjRef, ImpactRaycastList, asEventName, 0) ; #DEBUG_LINE_NO:54
EndEvent

Function PlayEffectFromListRecursive(ObjectReference akSourceRef, fxscripts:impactfxonanimevent:impactraycastdatum[] DataSet, String asAnimEvent, Int aiStartIndex)
  Int iFoundIndex = DataSet.findstruct("sAnimEventName", asAnimEvent, aiStartIndex) ; #DEBUG_LINE_NO:60
  If iFoundIndex >= 0 ; #DEBUG_LINE_NO:61
    akSourceRef.PlayImpactEffect(DataSet[iFoundIndex].ImpactFX, DataSet[iFoundIndex].sFXNodeName, DataSet[iFoundIndex].x, DataSet[iFoundIndex].y, DataSet[iFoundIndex].z, ImpactRange, DataSet[iFoundIndex].bUseNodeRotation, False) ; #DEBUG_LINE_NO:69
    If iFoundIndex >= 0 && iFoundIndex + 1 < DataSet.Length ; #DEBUG_LINE_NO:71
      Self.PlayEffectFromListRecursive(akSourceRef, DataSet, asAnimEvent, iFoundIndex + 1) ; #DEBUG_LINE_NO:72
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
