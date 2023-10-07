ScriptName TrapElectrifiedWaterScript Extends TrapBase

;-- Variables ---------------------------------------
Int soundInstanceID

;-- Properties --------------------------------------
Group TrapElectrifiedWaterData
  VisualEffect Property HazardEffect Auto Const
  { Visual effect to play when player is in electrified water }
  wwiseevent Property HazardSound Auto Const
  { Sound to play when player is in electrified water }
EndGroup


;-- Functions ---------------------------------------

Function HandleOnUnload()
  wwiseevent.StopInstance(soundInstanceID) ; #DEBUG_LINE_NO:15
EndFunction

Function BecomeActive()
  Self.Enable(False) ; #DEBUG_LINE_NO:22
  HazardEffect.Play(Self as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:23
  soundInstanceID = HazardSound.Play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:24
EndFunction

Function BecomeInactive()
  HazardEffect.Stop(Self as ObjectReference) ; #DEBUG_LINE_NO:31
  Self.Disable(False) ; #DEBUG_LINE_NO:32
  wwiseevent.StopInstance(soundInstanceID) ; #DEBUG_LINE_NO:33
EndFunction
