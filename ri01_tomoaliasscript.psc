ScriptName RI01_TomoAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property WeaponTypeEM Auto Const mandatory
Int Property StageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:7
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If (akAggressor == Game.GetPlayer() as ObjectReference) && akSource.HasKeyword(WeaponTypeEM) != True ; #DEBUG_LINE_NO:15
    Spell sourceSpell = akSource as Spell ; #DEBUG_LINE_NO:18
    If sourceSpell == None || sourceSpell.IsHostile() ; #DEBUG_LINE_NO:21
      Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:23
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
