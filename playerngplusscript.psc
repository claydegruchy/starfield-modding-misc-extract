ScriptName PlayerNGPlusScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  If Self.GetValue(PlayerUnityTimesEntered) as Int >= 1 ; #DEBUG_LINE_NO:7
    Starborn_DeathShader.Play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
