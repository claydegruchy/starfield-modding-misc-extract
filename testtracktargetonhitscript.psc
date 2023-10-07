ScriptName TestTrackTargetOnHitScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Projectile Property TestTrackingProjectile Auto Const mandatory
EffectShader Property ShipShieldMembraneFXS Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:9
  Self.AddInventoryEventFilter(None) ; #DEBUG_LINE_NO:10
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:11
  Self.GotoState("WaitingForHit") ; #DEBUG_LINE_NO:12
EndEvent

;-- State -------------------------------------------
State WaitingForCorpseLoot

  Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
    ShipShieldMembraneFXS.Stop(Self as ObjectReference) ; #DEBUG_LINE_NO:39
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingForDeath

  Event OnDying(ObjectReference akKiller)
    If Self.GetItemCount(None) > 0 ; #DEBUG_LINE_NO:28
      ShipShieldMembraneFXS.Play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:29
    EndIf ; #DEBUG_LINE_NO:
    Self.GotoState("WaitingForCorpseLoot") ; #DEBUG_LINE_NO:31
  EndEvent
EndState

;-- State -------------------------------------------
State WaitingForHit

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    If akProjectile == TestTrackingProjectile ; #DEBUG_LINE_NO:18
      Self.GotoState("WaitingForDeath") ; #DEBUG_LINE_NO:19
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
