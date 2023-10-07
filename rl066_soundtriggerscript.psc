ScriptName RL066_SoundTriggerScript Extends ObjectReference default
{ Plays a random sound at a random interval }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Properties
  wwiseevent[] Property SoundToPlayEvent Auto Const mandatory
  { The sounds to be played. }
  Keyword Property LinkCustom01 Auto Const
  { play the sound from this link }
  Bool Property StopSound = False Auto
  { stops playing sounds if true }
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnTriggerEnter(ObjectReference triggerRef)
    If triggerRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:19
      ObjectReference soundSource = Self.GetLinkedRef(LinkCustom01) ; #DEBUG_LINE_NO:20
      If soundSource == None ; #DEBUG_LINE_NO:21
        soundSource = triggerRef ; #DEBUG_LINE_NO:22
      EndIf ; #DEBUG_LINE_NO:
      While StopSound == False ; #DEBUG_LINE_NO:24
        Int index = Utility.RandomInt(0, SoundToPlayEvent.Length - 1) ; #DEBUG_LINE_NO:25
        SoundToPlayEvent[index].Play(soundSource, None, None) ; #DEBUG_LINE_NO:26
        Float waitTime = Utility.RandomFloat(1.0, 5.0) ; #DEBUG_LINE_NO:28
        Utility.Wait(waitTime) ; #DEBUG_LINE_NO:29
      EndWhile ; #DEBUG_LINE_NO:
      If StopSound == True ; #DEBUG_LINE_NO:32
        Self.GoToState("Done") ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
