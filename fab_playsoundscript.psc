ScriptName FAB_PlaySoundScript Extends TopicInfo Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SoundToPlay Auto Const
Bool Property bPlayOnEnd = True Auto Const

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If bPlayOnEnd == False ; #DEBUG_LINE_NO:7
    SoundToPlay.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If bPlayOnEnd == True ; #DEBUG_LINE_NO:13
    SoundToPlay.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent
