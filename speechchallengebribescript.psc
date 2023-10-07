ScriptName SpeechChallengeBribeScript Extends Scene Const
{ incremement BribeCount on player }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property BribeCount Auto Const mandatory

;-- Functions ---------------------------------------

Event OnBegin()
  Game.GetPlayer().ModValue(BribeCount, 1.0) ; #DEBUG_LINE_NO:8
EndEvent
