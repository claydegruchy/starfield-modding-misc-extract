ScriptName BroadcastSpeakerActorScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property LinkedRefBroadcastSpeaker Auto Const
{ Autofill }
ObjectReference[] Property SpeakerRefs Auto Const

;-- Functions ---------------------------------------

Function ToggleSpeakers(Bool ShouldTurnOn)
  Int I = 0 ; #DEBUG_LINE_NO:11
  While I < SpeakerRefs.Length ; #DEBUG_LINE_NO:12
    If ShouldTurnOn ; #DEBUG_LINE_NO:13
      Self.SetLinkedRef(SpeakerRefs[I], LinkedRefBroadcastSpeaker, True) ; #DEBUG_LINE_NO:14
    Else ; #DEBUG_LINE_NO:
      Self.SetLinkedRef(None, LinkedRefBroadcastSpeaker, True) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:19
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
