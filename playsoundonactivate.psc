ScriptName PlaySoundOnActivate Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property ActivateSound Auto Const
Bool Property bCanPlayAgain = True Auto conditional

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  If bCanPlayAgain == True ; #DEBUG_LINE_NO:8
    bCanPlayAgain = False ; #DEBUG_LINE_NO:9
    If ActivateSound.PlayAndWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:11
      bCanPlayAgain = True ; #DEBUG_LINE_NO:12
    Else ; #DEBUG_LINE_NO:
      bCanPlayAgain = True ; #DEBUG_LINE_NO:14
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
