ScriptName MagicEffectStarbornScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory
Keyword Property NoLoot Auto Const mandatory

;-- Functions ---------------------------------------

Event ObjectReference.OnLoad(ObjectReference akSender)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  ffStarbornTeleport.Cast(akCaster as ObjectReference, akCaster as ObjectReference) ; #DEBUG_LINE_NO:12
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:13
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDying") ; #DEBUG_LINE_NO:14
  Self.RegisterForRemoteEvent(akCaster as ScriptObject, "OnDeath") ; #DEBUG_LINE_NO:15
EndEvent

Event Actor.OnDying(Actor akSender, ObjectReference akKiller)
  akSender.BlockActivation(True, True) ; #DEBUG_LINE_NO:36
  Starborn_DeathShader.Play(akSender as ObjectReference, 5.0) ; #DEBUG_LINE_NO:38
  If !akSender.HasKeyword(NoLoot) ; #DEBUG_LINE_NO:41
    If (akKiller as Actor).IsPlayerTeammate() ; #DEBUG_LINE_NO:43
      FortifyQuantumEssenceSpell.Cast(akSender as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:44
    Else ; #DEBUG_LINE_NO:
      FortifyQuantumEssenceSpell.Cast(akSender as ObjectReference, akKiller) ; #DEBUG_LINE_NO:46
    EndIf ; #DEBUG_LINE_NO:
    QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnDeath(Actor akSender, ObjectReference akKiller)
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:53
  akSender.Disable(False) ; #DEBUG_LINE_NO:54
EndEvent

;-- State -------------------------------------------
State HasLoaded

  Event ObjectReference.OnLoad(ObjectReference akSender)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event ObjectReference.OnLoad(ObjectReference akSender)
    Self.GotoState("HasLoaded") ; #DEBUG_LINE_NO:20
    ffStarbornTeleport.Cast(akSender, akSender) ; #DEBUG_LINE_NO:21
  EndEvent
EndState
