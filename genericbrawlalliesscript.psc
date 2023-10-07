ScriptName GenericBrawlAlliesScript Extends RefCollectionAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Functions ---------------------------------------

Event OnEnterBleedout(ObjectReference akSenderRef)
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasInit()
  myQuest = Self.GetOwningQuest() as genericbrawlscript ; #DEBUG_LINE_NO:8
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:9
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:10
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, False) ; #DEBUG_LINE_NO:11
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akAggressor != myQuest.Opponent.GetRef() && akAggressor != myQuest.OpponentFriend.GetRef() ; #DEBUG_LINE_NO:16
    myQuest.SetStage(myQuest.EndBrawlStage) ; #DEBUG_LINE_NO:18
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:21
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If akCaster != akTarget ; #DEBUG_LINE_NO:29
    myQuest.SetStage(myQuest.CheatingStage) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent
