ScriptName TestBlockActivationScript Extends Actor Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.BlockActivation(True, False) ; #DEBUG_LINE_NO:8
EndEvent
