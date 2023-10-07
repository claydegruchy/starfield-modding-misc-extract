ScriptName GunRangeTarget Extends ObjectReference
{ Detects projectiles on hit and sends back score }

;-- Variables ---------------------------------------
ObjectReference Counter

;-- Properties --------------------------------------
Group Optional_Properties
  Int Property ScorePerHit = 1 Auto Const
  { Score earned per hit }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:18
  Counter = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:19
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:25
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If (Counter as gunrangecounter).QuestToSet.GetCurrentStageID() == (Counter as gunrangecounter).StageToStartCompetition ; #DEBUG_LINE_NO:33
    (Counter as gunrangecounter).GunRangeCompetition(ScorePerHit) ; #DEBUG_LINE_NO:36
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
EndEvent
