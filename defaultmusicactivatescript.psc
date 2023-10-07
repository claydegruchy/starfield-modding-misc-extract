ScriptName DefaultMusicActivateScript Extends ObjectReference default

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required
  Int Property MusicTypeToPlay = 0 Auto Const
  { Set this to the Music you want triggered
		0 = Dread
		1 = Reveal
		2 = Reward
		3 = Stinger }
  Bool Property PlayShortVersion = False Auto Const
  { Whether or not to play the short version of the MusicTypeToPlay. }
  MusicType Property MusicOverride Auto Const
  { Select a specific Music Type to play, will override any other setting on this script. }
EndGroup

Group NoTouchy collapsedonref
  MusicType[] Property Music Auto Const
  MusicType[] Property MusicShort Auto Const
EndGroup


;-- State -------------------------------------------
State Done
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    If MusicOverride ; #DEBUG_LINE_NO:26
      Self.GoToState("Done") ; #DEBUG_LINE_NO:27
      MusicOverride.Add() ; #DEBUG_LINE_NO:29
    Else ; #DEBUG_LINE_NO:
      Self.GoToState("Done") ; #DEBUG_LINE_NO:31
      If PlayShortVersion ; #DEBUG_LINE_NO:32
        MusicShort[MusicTypeToPlay].Add() ; #DEBUG_LINE_NO:34
      Else ; #DEBUG_LINE_NO:
        Music[MusicTypeToPlay].Add() ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
