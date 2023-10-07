ScriptName Fragments:TopicInfos:TIF_MS03_Juno_000D28A9 Extends TopicInfo Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SoundMarkerDisabler Auto Const
wwiseevent Property JunoShutdownEvent Auto Const
ObjectReference Property JunoEventMarker Auto Const
ObjectReference Property JunoPromptTrigger Auto Const
ObjectReference Property Juno00 Auto Const

;-- Functions ---------------------------------------

Function Fragment_End(ObjectReference akSpeakerRef)
  Actor akSpeaker = akSpeakerRef as Actor ; #DEBUG_LINE_NO:6
  JunoShutdownEvent.Play(JunoEventMarker, None, None) ; #DEBUG_LINE_NO:9
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:10
  SoundMarkerDisabler.Disable(False) ; #DEBUG_LINE_NO:11
  Juno00.PlayAnimation("Play02") ; #DEBUG_LINE_NO:14
  JunoPromptTrigger.BlockActivation(True, True) ; #DEBUG_LINE_NO:17
EndFunction
