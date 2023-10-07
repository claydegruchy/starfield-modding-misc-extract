ScriptName DefaultRefSoundTriggerScript Extends ObjectReference default
{ Plays a sound when a ref enters the trigger. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  wwiseevent Property SoundToPlayEvent Auto Const mandatory
  { The sound to be played. }
EndGroup

Group Optional_Properties
  Bool Property PlayerTriggerOnly = True Auto Const
  { DEFAULT: True. Should we trigger this for the player only? }
  Bool Property UseLinkKeyword = True Auto Const
  { DEFAULT: True. If True, play the sound using the LinkKeyword (next item). If False, just play the sound from this ref. }
  Bool Property PlayOnceOnly = True Auto Const
  { DEFAULT: True. Should we play this sound only once? }
  Keyword Property LinkKeyword Auto Const
  { DEFAULT: NONE. If this is linked to another ref with keyword LinkKeyword, play the sound from that ref. Otherwise, play the sound from the triggering ref. }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference triggerRef)
    If !PlayerTriggerOnly || (triggerRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:25
      If PlayOnceOnly ; #DEBUG_LINE_NO:26
        Self.GoToState("Done") ; #DEBUG_LINE_NO:27
      EndIf ; #DEBUG_LINE_NO:
      ObjectReference soundSource = None ; #DEBUG_LINE_NO:29
      If UseLinkKeyword ; #DEBUG_LINE_NO:30
        soundSource = Self.GetLinkedRef(LinkKeyword) ; #DEBUG_LINE_NO:31
        If soundSource == None ; #DEBUG_LINE_NO:32
          soundSource = triggerRef ; #DEBUG_LINE_NO:33
        EndIf ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        soundSource = Self as ObjectReference ; #DEBUG_LINE_NO:36
      EndIf ; #DEBUG_LINE_NO:
      SoundToPlayEvent.Play(soundSource, None, None) ; #DEBUG_LINE_NO:38
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
