ScriptName MQ204HunterScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
Int Property HunterDamagedStage = 700 Auto Const
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const
EffectShader Property Starborn_DeathShader Auto Const
ObjectReference Property MQHoldingCellCenterMarker Auto Const

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor HunterREF = Self.GetActorRef() ; #DEBUG_LINE_NO:11
  Float iHalfHealth = HunterREF.GetValue(Health) / 2.0 ; #DEBUG_LINE_NO:12
  Self.RegisterForActorValueLessThanEvent(Self.GetActorRef() as ObjectReference, Health, iHalfHealth) ; #DEBUG_LINE_NO:13
EndEvent

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  Actor HunterREF = Self.GetActorRef() ; #DEBUG_LINE_NO:18
  HunterREF.SetUnconscious(True) ; #DEBUG_LINE_NO:19
  HunterREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:20
  HunterREF.StopCombat() ; #DEBUG_LINE_NO:21
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:22
  Starborn_DeathShader.Play(HunterREF as ObjectReference, -1.0) ; #DEBUG_LINE_NO:23
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:26
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:27
  HunterREF.Moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:28
  HunterREF.ResetHealthAndLimbs() ; #DEBUG_LINE_NO:29
  Float iHalfHealth = HunterREF.GetValue(Health) / 2.0 ; #DEBUG_LINE_NO:30
  Self.RegisterForActorValueLessThanEvent(Self.GetActorRef() as ObjectReference, Health, iHalfHealth) ; #DEBUG_LINE_NO:31
  HunterREF.SetUnconscious(False) ; #DEBUG_LINE_NO:32
  HunterREF.BlockActivation(False, False) ; #DEBUG_LINE_NO:33
  HunterREF.Enable(False) ; #DEBUG_LINE_NO:34
  Self.GetOwningQuest().SetStage(HunterDamagedStage) ; #DEBUG_LINE_NO:36
EndEvent
