ScriptName GenericBrawlPlayerScript Extends ReferenceAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Functions ---------------------------------------

Event OnAliasInit()
  myQuest = Self.GetOwningQuest() as genericbrawlscript ; #DEBUG_LINE_NO:8
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:10
  Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:11
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, False) ; #DEBUG_LINE_NO:12
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  If akAggressor != myQuest.Opponent.GetRef() && akAggressor != myQuest.OpponentFriend.GetRef() ; #DEBUG_LINE_NO:17
    myQuest.SetStage(myQuest.EndBrawlStage) ; #DEBUG_LINE_NO:19
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.Opponent as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:22
    Self.RegisterForHitEvent(Self as ScriptObject, myQuest.OpponentFriend as ScriptObject, None, None, -1, -1, -1, -1, False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If akCaster != Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:30
    myQuest.SetStage(myQuest.CheatingStage) ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterBleedout()
  myQuest.SetStage(myQuest.PlayerDefeatedStage) ; #DEBUG_LINE_NO:38
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If Game.GetPlayer().IsInLocation(myQuest.Opponent.GetActorRef().GetCurrentLocation()) == False ; #DEBUG_LINE_NO:43
    myQuest.SetStage(myQuest.EndBrawlStage) ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
EndEvent
