ScriptName ShuttleBayDoorScript Extends ObjectReference
{ Script on the Shuttle Bay Doors. Handles opening and closing the doors in response to events from the ShuttleBayDoorManagerScript object. }

;-- Functions ---------------------------------------

Event OnLoad()
  shuttlebaydoormanagerscript myManager = Self.GetLinkedRef(None) as shuttlebaydoormanagerscript ; #DEBUG_LINE_NO:5
  If myManager == None ; #DEBUG_LINE_NO:6
     ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForCustomEvent(myManager as ScriptObject, "shuttlebaydoormanagerscript_OpenShuttleBayDoorsEvent") ; #DEBUG_LINE_NO:9
    Self.RegisterForCustomEvent(myManager as ScriptObject, "shuttlebaydoormanagerscript_CloseShuttleBayDoorsEvent") ; #DEBUG_LINE_NO:10
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ShuttleBayDoorManagerScript.OpenShuttleBayDoorsEvent(shuttlebaydoormanagerscript akSender, Var[] akArgs)
  Self.PlayAnimation("StateA_Play") ; #DEBUG_LINE_NO:15
EndEvent

Event ShuttleBayDoorManagerScript.CloseShuttleBayDoorsEvent(shuttlebaydoormanagerscript akSender, Var[] akArgs)
  Self.PlayAnimation("StateB_Play") ; #DEBUG_LINE_NO:19
EndEvent
