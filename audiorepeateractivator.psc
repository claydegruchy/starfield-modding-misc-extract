ScriptName AudioRepeaterActivator Extends ObjectReference
{ Repeats a given sound's playback }

;-- Variables ---------------------------------------
Bool bRunning = True
Int iPlaySoundTimerID = 1 Const

;-- Properties --------------------------------------
wwiseevent Property SoundDescriptor Auto Const
{ WwiseEvent that this script will play }
Float Property delayMin = 1.0 Auto Const
Float Property delayMax = 5.0 Auto Const

;-- Functions ---------------------------------------

Event OnCellAttach()
  bRunning = Self.isEnabled() ; #DEBUG_LINE_NO:18
  If bRunning ; #DEBUG_LINE_NO:19
    Self.StartTimer(Self.GetWaitTime(), iPlaySoundTimerID) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCellDetach()
  bRunning = False ; #DEBUG_LINE_NO:25
  Self.CancelTimer(iPlaySoundTimerID) ; #DEBUG_LINE_NO:26
EndEvent

Event OnTimer(Int aiTimerID)
  If aiTimerID == iPlaySoundTimerID ; #DEBUG_LINE_NO:31
    SoundDescriptor.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:32
    If bRunning && Self.isEnabled() ; #DEBUG_LINE_NO:33
      Self.StartTimer(Self.GetWaitTime(), iPlaySoundTimerID) ; #DEBUG_LINE_NO:34
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Float Function GetWaitTime()
  Return Utility.RandomFloat(delayMin, delayMax) ; #DEBUG_LINE_NO:40
EndFunction
