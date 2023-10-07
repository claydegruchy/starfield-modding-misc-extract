ScriptName CF05_FadeTeleportScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerTeleportGuard Auto Const mandatory
Float Property SecondsBeforeFade = 0.0 Auto Const
Float Property FadeDuration = 0.5 Auto Const
Float Property WaitTime = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Game.FadeOutGame(True, True, SecondsBeforeFade, FadeDuration, True) ; #DEBUG_LINE_NO:12
  inputenablelayer myLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:13
  myLayer.DisablePlayerControls(True, False, False, False, False, False, False, False, False, False, False) ; #DEBUG_LINE_NO:14
  Utility.Wait(WaitTime) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().MoveTo(Alias_PlayerTeleportGuard.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
  Utility.Wait(WaitTime) ; #DEBUG_LINE_NO:17
  myLayer.Delete() ; #DEBUG_LINE_NO:18
  Game.FadeOutGame(False, True, SecondsBeforeFade, FadeDuration, False) ; #DEBUG_LINE_NO:19
EndEvent
