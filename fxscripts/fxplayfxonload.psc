ScriptName FXScripts:FXPlayFXOnLoad Extends ObjectReference
{ Places a activator on death. }

;-- Variables ---------------------------------------
Bool done = False

;-- Properties --------------------------------------
VisualEffect Property VisualEffectToApply Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  If !done ; #DEBUG_LINE_NO:10
    If Self.IsDisabled() == False ; #DEBUG_LINE_NO:11
      If Self.Is3DLoaded() ; #DEBUG_LINE_NO:12
        VisualEffectToApply.Play(Self as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:13
        done = True ; #DEBUG_LINE_NO:14
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  VisualEffectToApply.Stop(Self as ObjectReference) ; #DEBUG_LINE_NO:22
EndEvent
