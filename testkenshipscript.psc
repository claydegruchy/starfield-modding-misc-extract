ScriptName TestKenShipScript Extends SpaceshipReference Const

;-- Functions ---------------------------------------

Event OnShipRampDown()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnShipLanding(Bool abComplete)
  If abComplete ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function TestDisableWithTakeOff()
  Self.DisableWithTakeOffOrLanding() ; #DEBUG_LINE_NO:18
EndFunction

Function TestDisableTakeOffNoWait()
  Self.DisableWithTakeOffOrLandingNoWait() ; #DEBUG_LINE_NO:24
EndFunction

Function TestDisableWithGrav()
  Self.DisableWithGravJump() ; #DEBUG_LINE_NO:30
EndFunction

Function TestDisableGravJumpNoWait()
  Self.DisableWithGravJumpNoWait() ; #DEBUG_LINE_NO:36
EndFunction

Function TestEnableWithLanding()
  Self.EnableWithLanding() ; #DEBUG_LINE_NO:42
EndFunction

Function TestEnableWithLandingNoWait()
  Self.EnableWithLandingNoWait() ; #DEBUG_LINE_NO:48
EndFunction

Function TestEnable()
  Self.Enable(True) ; #DEBUG_LINE_NO:54
EndFunction

Function TestEnableNoWait()
  Self.EnableNoWait(False) ; #DEBUG_LINE_NO:60
EndFunction

Function TestDisable()
  Self.Disable(True) ; #DEBUG_LINE_NO:66
EndFunction

Function TestDisableNoWait()
  Self.DisableNoWait(False) ; #DEBUG_LINE_NO:72
EndFunction

Function TestGetPlanet()
  planet planetAt = Self.GetCurrentPlanet() ; #DEBUG_LINE_NO:77
EndFunction
