ScriptName ExtendSecuritySystemScript Extends securitysystemscript Const
{ Example Script for Extending SecuritySystemScript }

;-- Functions ---------------------------------------

Event SQ_ParentScript.SQ_AlarmTriggeredOn(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location ; #DEBUG_LINE_NO:5
  If alarmLocation == MyLocation ; #DEBUG_LINE_NO:6
    Self.GetLinkedRef(None).Enable(Self as Bool) ; #DEBUG_LINE_NO:7
  EndIf ; #DEBUG_LINE_NO:
EndEvent
