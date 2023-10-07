ScriptName SecuritySystemScript Extends ObjectReference Const
{ Extend this script to handle security system events. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group DefaultProperties collapsedonbase
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Location Property MyLocation Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_AlarmTriggeredOn") ; #DEBUG_LINE_NO:10
  Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_AlarmTriggeredOff") ; #DEBUG_LINE_NO:11
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOn(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location ; #DEBUG_LINE_NO:19
  sq_alarmscript alarmQuest = akArgs[1] as sq_alarmscript ; #DEBUG_LINE_NO:20
  If alarmLocation == MyLocation ; #DEBUG_LINE_NO:23
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_AlarmTriggeredOff(sq_parentscript source, Var[] akArgs)
  Location alarmLocation = akArgs[0] as Location ; #DEBUG_LINE_NO:32
  sq_alarmscript alarmQuest = akArgs[1] as sq_alarmscript ; #DEBUG_LINE_NO:33
  If alarmLocation == MyLocation ; #DEBUG_LINE_NO:36
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
