ScriptName PiracyInfo_LoseSC_Script Extends TopicInfo Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  spaceshipreference shipRef = akSpeakerRef as spaceshipreference ; #DEBUG_LINE_NO:4
  (Self.GetOwningQuest() as dialoguegenericpiracyshipqscript).PiracyLoseSpeechChallenge(shipRef) ; #DEBUG_LINE_NO:6
EndEvent
