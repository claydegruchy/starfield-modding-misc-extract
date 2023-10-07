ScriptName Mq304BAquilusScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory

;-- Functions ---------------------------------------

Event OnDying(ObjectReference akKiller)
  Actor SelfREF = Self.GetActorRef() ; #DEBUG_LINE_NO:9
  SelfREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:11
  Starborn_DeathShader.Play(SelfREF as ObjectReference, 5.0) ; #DEBUG_LINE_NO:13
  If (akKiller as Actor).IsPlayerTeammate() ; #DEBUG_LINE_NO:16
    FortifyQuantumEssenceSpell.Cast(SelfREF as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    FortifyQuantumEssenceSpell.Cast(SelfREF as ObjectReference, akKiller) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:21
EndEvent

Event OnDeath(ObjectReference akKiller)
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:25
  Self.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:26
EndEvent
