ScriptName FAB_InfoFadeScript Extends TopicInfo
{ This allows fading out/in when an info begins/ends }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property OnBegin = True Auto Const
{ If True (default), stop camera when the Info begins. If False then stop camera when the info ends. }
Bool Property FadeOut = True Auto Const
{ If True (default), fade out the camera - if False then fade back in }

;-- Functions ---------------------------------------

Event OnBegin(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnBegin == True ; #DEBUG_LINE_NO:11
    Self.FadeOutNow() ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  If OnBegin == False ; #DEBUG_LINE_NO:17
    Self.FadeOutNow() ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function FadeOutNow()
  If FadeOut == True ; #DEBUG_LINE_NO:23
    Game.FadeOutGame(True, True, 0.0, 1.0, True) ; #DEBUG_LINE_NO:24
  Else ; #DEBUG_LINE_NO:
    Game.FadeOutGame(False, True, 0.0, 1.0, False) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction
