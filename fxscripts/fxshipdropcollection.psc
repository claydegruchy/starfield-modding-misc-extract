ScriptName FXScripts:FXShipDropCollection Extends ObjectReference
{ This Script applies a Visual Effect. }

;-- Variables ---------------------------------------
Bool done = False

;-- Properties --------------------------------------
EffectShader Property EffectShaderToApply Auto Const mandatory
{ This is the visue effect that will be used. }

;-- Functions ---------------------------------------

Event OnLoad()
  If !done ; #DEBUG_LINE_NO:10
    If Self.IsDisabled() == False ; #DEBUG_LINE_NO:11
      If Self.Is3DLoaded() ; #DEBUG_LINE_NO:12
        EffectShaderToApply.Play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:13
        done = True ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  EffectShaderToApply.Stop(Self as ObjectReference) ; #DEBUG_LINE_NO:22
EndEvent
