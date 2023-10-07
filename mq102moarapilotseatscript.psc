ScriptName MQ102MoaraPilotSeatScript Extends ReferenceAlias

;-- Functions ---------------------------------------

Event OnLoad()
  Self.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:4
EndEvent
