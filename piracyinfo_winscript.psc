ScriptName PiracyInfo_WinScript Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference ; #DEBUG_LINE_NO:4
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracySuccess(shipRef) ; #DEBUG_LINE_NO:6
EndEvent
