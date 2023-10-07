ScriptName MQ_ClearHelpMessageTriggerScript Extends ObjectReference

;-- State -------------------------------------------
State HasBeenTriggered

  Event OnTriggerEnter(ObjectReference akActionRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnTriggerEnter(ObjectReference akActionRef)
    If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:5
      Self.GotoState("HasBeenTriggered") ; #DEBUG_LINE_NO:6
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:7
      Self.Disable(False) ; #DEBUG_LINE_NO:8
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
