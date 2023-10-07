ScriptName DefaultTopicInfoSetGlobal Extends TopicInfo Const default
{ Sets a global to a specified value (default 1) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Globals
  GlobalVariable Property SetGlobalOnBegin Auto Const
  { Which global to set when the info starts }
  GlobalVariable Property SetGlobalOnEnd Auto Const
  { Which global to set when the info starts }
EndGroup

Group Values
  Float Property OnBeginValue = 1.0 Auto Const
  { Default: 1; what value do we set the global to when the info starts }
  Float Property OnEndValue = 1.0 Auto Const
  { Default: 1; what value do we set the global to when the info ends }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnBegin ; #DEBUG_LINE_NO:28
    SetGlobalOnBegin.setValue(OnBeginValue) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetGlobalOnEnd ; #DEBUG_LINE_NO:36
    SetGlobalOnEnd.setValue(OnEndValue) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent
