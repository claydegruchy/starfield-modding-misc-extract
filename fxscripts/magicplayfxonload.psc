ScriptName FXScripts:MagicPlayFXOnLoad Extends ActiveMagicEffect
{ Places a activator on death. }

;-- Variables ---------------------------------------
ObjectReference ObjRef
Bool done = False

;-- Properties --------------------------------------
VisualEffect Property VisualEffectToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  ObjRef = Self.GetTargetActor() as ObjectReference ; #DEBUG_LINE_NO:10
  If ObjRef ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If ObjRef as Bool && !done ; #DEBUG_LINE_NO:17
    If ObjRef.IsDisabled() == False ; #DEBUG_LINE_NO:18
      If ObjRef.Is3DLoaded() ; #DEBUG_LINE_NO:19
        VisualEffectToApply.Play(ObjRef, -1.0, None) ; #DEBUG_LINE_NO:20
        done = True ; #DEBUG_LINE_NO:21
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  If ObjRef as Bool && !done ; #DEBUG_LINE_NO:29
    done = True ; #DEBUG_LINE_NO:30
    VisualEffectToApply.Play(akCaster as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  If ObjRef ; #DEBUG_LINE_NO:36
    VisualEffectToApply.Stop(ObjRef) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
