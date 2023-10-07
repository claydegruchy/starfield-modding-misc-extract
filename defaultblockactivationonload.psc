ScriptName DefaultBlockActivationOnLoad Extends ObjectReference default
{ Blocks activation once on load. }

;-- Variables ---------------------------------------
Bool HasLoaded = False

;-- Properties --------------------------------------
Bool Property HideActivationText = True Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If !HasLoaded ; #DEBUG_LINE_NO:9
    HasLoaded = True ; #DEBUG_LINE_NO:10
    Self.BlockActivation(True, HideActivationText) ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
EndEvent
