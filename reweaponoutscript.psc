ScriptName REWeaponOutScript Extends Quest

;-- Variables ---------------------------------------
Int WeaponOutTimerID = 10
Float WeaponOutTimerLength = 3.0

;-- Functions ---------------------------------------

Function StartUp()
  Self.StartTimer(WeaponOutTimerLength, WeaponOutTimerID) ; #DEBUG_LINE_NO:11
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == WeaponOutTimerID ; #DEBUG_LINE_NO:15
    If !Game.GetPlayer().IsWeaponDrawn() ; #DEBUG_LINE_NO:18
      Self.SendCustomEvent("reweaponoutscript_OnWeaponAway", None) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
    Self.StartTimer(WeaponOutTimerLength, WeaponOutTimerID) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
