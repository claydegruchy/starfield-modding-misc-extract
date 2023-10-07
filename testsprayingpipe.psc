ScriptName TestSprayingPipe Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Weapon Property UnarmedHuman Auto Const
Form Property FireMed01 Auto Const
Hazard Property ENV_GasVentHazard_ToxicGas_Small Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.Is3DLoaded() ; #DEBUG_LINE_NO:8
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:14
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If abBashAttack || (akSource == UnarmedHuman as Form) ; #DEBUG_LINE_NO:26
    Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Self.PlaceAtMe(FireMed01, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:31
    Self.GetLinkedRef(None).Enable(False) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent
