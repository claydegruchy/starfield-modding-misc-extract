ScriptName MannequinScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property allowPlayerActivation = True Auto Const
{ if false, player activation is blocked }
FormList Property DisplayFilter_Mannequins Auto Const mandatory
{ autofill - used to filter what can be placed in the mannequin }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.SetHeadTracking(False) ; #DEBUG_LINE_NO:11
  Self.SetRestrained(True) ; #DEBUG_LINE_NO:12
  Self.SetUnconscious(True) ; #DEBUG_LINE_NO:13
  Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:14
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && allowPlayerActivation ; #DEBUG_LINE_NO:19
    Self.OpenInventory(True, DisplayFilter_Mannequins as Form, True) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent
