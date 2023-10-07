ScriptName Fragments:TopicInfos:TIF_CF05_00045C76 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property CF05_CommandBayGuardAccess Auto Const mandatory
Scene Property CF05_1600_EnsignAccessScene Auto Const mandatory
Quest Property CF05_Guard_SpeechChallenge01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  CF05_CommandBayGuardAccess.ForceRefTo(akSpeaker as ObjectReference) ; #DEBUG_LINE_NO:8
  CF05_Guard_SpeechChallenge01.Start() ; #DEBUG_LINE_NO:9
  CF05_1600_EnsignAccessScene.Start() ; #DEBUG_LINE_NO:10
EndFunction
