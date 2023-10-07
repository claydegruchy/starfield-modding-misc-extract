ScriptName TestAirlockActivatorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  testairlockscript01 LinkedScript = Self.GetLinkedRef(None) as testairlockscript01 ; #DEBUG_LINE_NO:4
  If LinkedScript.bPowerered == True ; #DEBUG_LINE_NO:6
    LinkedScript.PowerOff() ; #DEBUG_LINE_NO:7
  Else ; #DEBUG_LINE_NO:
    LinkedScript.PowerOn() ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent
