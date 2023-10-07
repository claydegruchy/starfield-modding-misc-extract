ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28F3 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property SoundMarkerDisabler Auto Const
ObjectReference Property JunoEventMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  JunoShutdownEvent.Play(JunoEventMarker, None, None) ; #DEBUG_LINE_NO:9
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:10
  SoundMarkerDisabler.Disable(False) ; #DEBUG_LINE_NO:11
EndFunction
