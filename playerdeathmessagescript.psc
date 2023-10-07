ScriptName PlayerDeathMessageScript Extends ActiveMagicEffect

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const
Float Property Damaged Auto Const
Message Property PlayerDeathMessage Auto Const
Spell Property abDeathMessage Auto Const
GlobalVariable Property MessageBoxTutorialBlocked Auto Const
GlobalVariable Property MessageBoxTutorialWait Auto Const
Quest Property Tutorial Auto Const

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akVictim, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:4
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:9
  If akTarget == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:11
    If PlayerRef.GetValuePercentage(Health) < Damaged && PlayerRef.GetValue(Health) > 0.0 ; #DEBUG_LINE_NO:12
      MessageBoxTutorialBlocked.SetValue(1.0) ; #DEBUG_LINE_NO:14
      PlayerDeathMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:15
      Self.UnregisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:16
      Game.GetPlayer().RemoveSpell(abDeathMessage) ; #DEBUG_LINE_NO:17
      Utility.Wait(MessageBoxTutorialWait.GetValue()) ; #DEBUG_LINE_NO:18
      MessageBoxTutorialBlocked.SetValue(0.0) ; #DEBUG_LINE_NO:19
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Game.GetPlayer() as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
