ScriptName UC06_TurretOnlineScript Extends SpaceshipReference Const

;-- Variables ---------------------------------------
Int iTurnOnWaitID = 1 Const

;-- Properties --------------------------------------
Faction Property PlayerFriendFaction Auto Const mandatory
Float Property WaitTime Auto Const mandatory
ActorValue Property HideShipFromHUDValue Auto Const mandatory

;-- Functions ---------------------------------------

Function SetTurretOnline()
  Self.StartTimer(WaitTime, iTurnOnWaitID) ; #DEBUG_LINE_NO:12
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == iTurnOnWaitID ; #DEBUG_LINE_NO:16
    Self.SetValue(HideShipFromHUDValue, 0.0) ; #DEBUG_LINE_NO:17
    Self.SetUnconscious(False) ; #DEBUG_LINE_NO:18
    Self.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
