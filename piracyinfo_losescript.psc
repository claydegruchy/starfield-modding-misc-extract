ScriptName PiracyInfo_LoseScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference ; #DEBUG_LINE_NO:4
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracyFail(shipRef) ; #DEBUG_LINE_NO:6
EndEvent
