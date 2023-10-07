ScriptName DefaultActivateSelfOnHit Extends Actor default
{ The ref activates itself on hit, typically to trigger an ambush from an ActivateParented actor. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Bool Property DoOnce = True Auto Const

;-- Functions ---------------------------------------

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:7
EndEvent

;-- State -------------------------------------------
State Done

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State Initial

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
    Self.Activate(Self as ObjectReference, False) ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:
      Self.GoToState("Done") ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    If Self.Is3DLoaded() ; #DEBUG_LINE_NO:12
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:13
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState
