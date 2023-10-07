ScriptName LC070PowerCellTerminalScript Extends ReferenceAlias Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property COM_Quest_SarahMorgan_Q01 Auto Const mandatory
ReferenceAlias Property PowerCellReceptacleAlias Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForRemoteEvent(PowerCellReceptacleAlias.getref() as ScriptObject, "OnPowerOn") ; #DEBUG_LINE_NO:7
EndEvent

Event ObjectReference.OnPowerOn(ObjectReference akSender, ObjectReference akPowerGenerator)
  COM_Quest_SarahMorgan_Q01.setstage(100) ; #DEBUG_LINE_NO:11
EndEvent
