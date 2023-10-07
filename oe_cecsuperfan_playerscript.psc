ScriptName OE_CECSuperfan_PlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Float LowHealth
Actor PlayerREF

;-- Properties --------------------------------------
Float Property StopBelowPercentHealth = 0.75 Auto Const
{ If the Player's health reaches this percent, they lose the fight. Range: 0.01 - 0.99 }
Int Property StageToSet = 400 Auto Const
{ Stage to set when the Player loses. }
ReferenceAlias Property ShipA Auto Const hidden mandatory
{ Autofill }

;-- Functions ---------------------------------------

Event OnAliasInit()
  PlayerREF = Self.GetActorRef() ; #DEBUG_LINE_NO:14
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:16
  LowHealth = PlayerREF.GetValue(Game.GetHealthAV()) ; #DEBUG_LINE_NO:19
  LowHealth *= StopBelowPercentHealth ; #DEBUG_LINE_NO:20
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Quest QO = Self.GetOwningQuest() ; #DEBUG_LINE_NO:25
  Float PlayerHealth = PlayerREF.GetValue(Game.GetHealthAV()) ; #DEBUG_LINE_NO:26
  If PlayerHealth <= LowHealth ; #DEBUG_LINE_NO:29
    QO.SetStage(StageToSet) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:36
EndEvent
