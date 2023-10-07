ScriptName MQ101OutpostBeaconScript Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property OutpostBeaconMessage Auto Const mandatory

;-- Functions ---------------------------------------

Event OnInit()
  OutpostBeaconMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:7
EndEvent
