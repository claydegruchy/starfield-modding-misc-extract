ScriptName DefaultTopicInfoSetStage Extends DefaultTopicInfo Const default
{ Default script for setting a different quest's stage from a topic info. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Optional_Properties
  Bool Property SetStageOnEnd = True Auto Const
  { If true (default), set stage on end. If false, set stage on begin. }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If !SetStageOnEnd ; #DEBUG_LINE_NO:10
    Self.TryToSetStage() ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If SetStageOnEnd ; #DEBUG_LINE_NO:17
    Self.TryToSetStage() ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
