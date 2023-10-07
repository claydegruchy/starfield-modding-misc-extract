ScriptName Fragments:TopicInfos:TIF_CF05_000B9741 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CF05_CommandBayGuardAccess Auto Const mandatory
Scene Property CF05_1026_EnsignAccessScene Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory
Scene Property CF05_1025_EnsignAccessScene Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Begin(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  CF05_CommandBayGuardAccess.ForceRefTo(akSpeaker as ObjectReference) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:15
  CF05_1026_EnsignAccessScene.Stop() ; #DEBUG_LINE_NO:17
  CF05_Guard_SpeechChallenge01.Start() ; #DEBUG_LINE_NO:18
  CF05_1026_EnsignAccessScene.Start() ; #DEBUG_LINE_NO:19
EndFunction
