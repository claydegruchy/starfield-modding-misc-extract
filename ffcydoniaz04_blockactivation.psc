ScriptName FFCydoniaZ04_BlockActivation Extends ObjectReference
{ Blocks activation once on load to prevent the prompt from showing up prematurely. Unblocks Activation when enabled }

;-- Variables ---------------------------------------
Bool HasLoaded = False

;-- Properties --------------------------------------
Bool Property HideActivationText = True Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If Self.IsDisabled() == True ; #DEBUG_LINE_NO:10
    Self.BlockActivation(True, HideActivationText) ; #DEBUG_LINE_NO:11
  Else ; #DEBUG_LINE_NO:
    Self.BlockActivation(False, False) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
