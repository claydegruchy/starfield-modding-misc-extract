ScriptName GenericBrawlOpponentAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
genericbrawlscript myQuest

;-- Properties --------------------------------------
Int Property BrawlUpdateTimerID = 1 Auto Const
Float Property BrawlUpdateTime = 2.0 Auto Const
Faction Property GenericBrawlFaction Auto

;-- Functions ---------------------------------------

Event OnAliasInit()
  myQuest = Self.GetOwningQuest() as genericbrawlscript ; #DEBUG_LINE_NO:14
  Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:15
  Self.RegisterForMagicEffectApplyEvent(Self as ScriptObject, None, None, True) ; #DEBUG_LINE_NO:16
EndEvent

Function StartUpdateTimer(Bool bStartTimer)
  If bStartTimer ; #DEBUG_LINE_NO:20
    Self.StartTimer(BrawlUpdateTime, BrawlUpdateTimerID) ; #DEBUG_LINE_NO:21
  Else ; #DEBUG_LINE_NO:
    Self.CancelTimer(BrawlUpdateTimerID) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == BrawlUpdateTimerID ; #DEBUG_LINE_NO:28
    Actor pActor = Self.GetActorRef() ; #DEBUG_LINE_NO:29
    If pActor.IsInCombat() == False && pActor.IsBleedingOut() == 0 && myQuest.GetStage() < 15 ; #DEBUG_LINE_NO:30
      myQuest.SetStage(myQuest.PlayerDefeatedStage) ; #DEBUG_LINE_NO:33
    Else ; #DEBUG_LINE_NO:
      Self.StartTimer(BrawlUpdateTime, BrawlUpdateTimerID) ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akWeapon, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Actor pActor = Self.GetActorRef() ; #DEBUG_LINE_NO:43
  Actor pPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:44
  If (akAggressor == pPlayer as ObjectReference) || myQuest.PlayerAllies.Find(akAggressor) > -1 ; #DEBUG_LINE_NO:45
    If akProjectile as Bool || (akWeapon as Bool && (akWeapon != myQuest.Unarmed as Form)) ; #DEBUG_LINE_NO:47
      pPlayer.RemoveFromFaction(GenericBrawlFaction) ; #DEBUG_LINE_NO:49
      pActor.RemoveFromFaction(GenericBrawlFaction) ; #DEBUG_LINE_NO:50
      pActor.StopCombat() ; #DEBUG_LINE_NO:51
      pActor.SendAssaultAlarm() ; #DEBUG_LINE_NO:52
      pActor.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:53
      myQuest.SetStage(myQuest.CheatingStage) ; #DEBUG_LINE_NO:54
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Self as ScriptObject, None, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    myQuest.SetStage(myQuest.CheatingStage) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMagicEffectApply(ObjectReference akTarget, ObjectReference akCaster, MagicEffect akEffect)
  If (akCaster == Game.GetPlayer() as ObjectReference) || myQuest.PlayerAllies.Find(akCaster) > -1 ; #DEBUG_LINE_NO:68
    myQuest.SetStage(myQuest.CheatingStage) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterBleedout()
  myQuest.SetStage(myQuest.PlayerWinsStage) ; #DEBUG_LINE_NO:76
  Self.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:77
EndEvent
