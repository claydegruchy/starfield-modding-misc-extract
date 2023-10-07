ScriptName NewAtlantisSecurityScannerScript Extends ObjectReference conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property SoundEventToPlay Auto Const
Quest Property PreReqQuest Auto Const

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
    If PreReqQuest.IsRunning() ; #DEBUG_LINE_NO:10
      SoundEventToPlay.PlayandWait(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:11
      Self.Disable(False) ; #DEBUG_LINE_NO:12
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
