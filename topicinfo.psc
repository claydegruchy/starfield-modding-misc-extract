ScriptName TopicInfo Extends Form Native hidden

;-- Functions ---------------------------------------

Quest Function GetOwningQuest() Native

Bool Function HasBeenSaid() Native

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent
