ScriptName OE_AustinF_CECSuperfan_Script Extends ReferenceAlias

;-- Variables ---------------------------------------
Float LowHealth
Actor PlayerREF
Quest QO
Actor Superfan

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const
Scene Property OE_AustinF_CECSuperfan_Scene03 Auto Const
Int Property StageToSet_WeaponsUsed = 170 Auto Const
Int Property StageToSet_PlayerWins = 300 Auto Const
Float Property StopBelowPercentHealth = 0.75 Auto Const
Weapon Property UnarmedHuman Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  Superfan = Self.GetActorRef() ; #DEBUG_LINE_NO:16
  QO = Self.GetOwningQuest() ; #DEBUG_LINE_NO:17
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:19
  LowHealth = Superfan.GetValue(Game.GetHealthAV()) ; #DEBUG_LINE_NO:21
  LowHealth *= StopBelowPercentHealth ; #DEBUG_LINE_NO:24
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akSource != UnarmedHuman as Form ; #DEBUG_LINE_NO:30
    QO.SetStage(StageToSet_WeaponsUsed) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  If Superfan.GetValue(Game.GetHealthAV()) <= LowHealth ; #DEBUG_LINE_NO:35
    QO.SetStage(StageToSet_PlayerWins) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:40
EndEvent
