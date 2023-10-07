ScriptName TestEventsScript Extends ObjectReference
{ sends out traces for several events }

;-- Variables ---------------------------------------
Actor Player

;-- Functions ---------------------------------------

Event OnCellAttach()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnUnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Player = Game.GetPlayer() ; #DEBUG_LINE_NO:9
EndEvent
