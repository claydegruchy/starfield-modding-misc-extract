ScriptName Artifact01_ActivatorScript Extends ObjectReference Const

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:4
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.PlayAnimation("Play02") ; #DEBUG_LINE_NO:9
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:10
EndEvent
