ScriptName City_AkilaLife01_ThiefScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_AkilaLife01 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:7
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If Self.GetActorRef().IsBleedingout() > 0 ; #DEBUG_LINE_NO:14
    City_AkilaLife01.SetStage(160) ; #DEBUG_LINE_NO:15
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:17
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent
