ScriptName DefaultTopicAnimArchetypeSwitch Extends TopicInfo Const default
{ Default script for setting a different quest's stage from a topic info. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group KeywordArchetypes
  Keyword Property OnBeginArchetype Auto Const
  { Switch to this Archetype OnBegin }
  Keyword Property OnEndArchetype Auto Const
  { Switch to this Archetype OnEnd }
EndGroup


;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  (akSpeakerRef as Actor).ChangeAnimArchetype(OnBeginArchetype) ; #DEBUG_LINE_NO:12
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  (akSpeakerRef as Actor).ChangeAnimArchetype(OnEndArchetype) ; #DEBUG_LINE_NO:16
EndEvent
