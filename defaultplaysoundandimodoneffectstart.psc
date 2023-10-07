ScriptName DefaultPlaySoundAndImodOnEffectStart Extends ActiveMagicEffect default
{ For playing an imagespace, a sound, or both when Potions are used, typically when these should be played only once the Data Menu is closed. }

;-- Variables ---------------------------------------
Bool bDonePlayingEffects = False
Int soundInstance = -1
Int waitForMenuTimer = 1 Const
Float waitForMenuTimerDuration = 0.01 Const

;-- Properties --------------------------------------
Group OptionalProperties
  wwiseevent Property SoundEvent Auto Const
  { Optional: The Sound Event to play. }
  ImageSpaceModifier Property theImod Auto Const
  { Optional: The Imagespace Modifier to play. }
  Bool Property StartWhenGameIsRunning = True Auto Const
  { Optional: If true, VFX/SFX won't start playing until game is not paused (e.g. if effect starts from using a potion from inventory) }
EndGroup


;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.PlayEffects(True) ; #DEBUG_LINE_NO:21
EndEvent

Event OnEffectFinish(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.PlayEffects(False) ; #DEBUG_LINE_NO:25
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == waitForMenuTimer && soundInstance < 0 && !bDonePlayingEffects ; #DEBUG_LINE_NO:29
    Self.PlayEffects(True) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function PlayEffects(Bool startPlaying)
  If startPlaying ; #DEBUG_LINE_NO:36
    If StartWhenGameIsRunning == False || Utility.IsGameMenuPaused() == False ; #DEBUG_LINE_NO:37
      If SoundEvent ; #DEBUG_LINE_NO:39
        soundInstance = SoundEvent.Play(Self.GetTargetActor() as ObjectReference, None, None) ; #DEBUG_LINE_NO:40
      EndIf ; #DEBUG_LINE_NO:
      If theImod ; #DEBUG_LINE_NO:42
        theImod.Apply(1.0) ; #DEBUG_LINE_NO:43
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(waitForMenuTimerDuration, waitForMenuTimer) ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If soundInstance > -1 ; #DEBUG_LINE_NO:50
      wwiseevent.StopInstance(soundInstance) ; #DEBUG_LINE_NO:51
      soundInstance = -1 ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
    If theImod ; #DEBUG_LINE_NO:54
      theImod.Remove() ; #DEBUG_LINE_NO:55
    EndIf ; #DEBUG_LINE_NO:
    bDonePlayingEffects = True ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction
