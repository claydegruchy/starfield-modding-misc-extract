ScriptName TestJeffBBossBattleScript Extends Actor

;-- Variables ---------------------------------------
Bool doneScaling = False
Float myTotalHealth

;-- Properties --------------------------------------
Float Property ScaleThreshold = 0.850000024 Auto Const
Float Property StartTeleportThreshold = 0.5 Auto Const

;-- Functions ---------------------------------------

Event OnLoad()
  myTotalHealth = Self.getValue(Game.GetHealthAV()) ; #DEBUG_LINE_NO:19
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:20
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akAggressor == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:27
    If Self.getValue(Game.GetHealthAV()) <= myTotalHealth * ScaleThreshold && doneScaling == False ; #DEBUG_LINE_NO:28
      doneScaling = True ; #DEBUG_LINE_NO:30
      Self.SendCustomEvent("testjeffbbossbattlescript_ScaleBoss", None) ; #DEBUG_LINE_NO:31
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:32
    ElseIf Self.getValue(Game.GetHealthAV()) <= myTotalHealth * StartTeleportThreshold ; #DEBUG_LINE_NO:33
      Self.SendCustomEvent("testjeffbbossbattlescript_StartTeleporting", None) ; #DEBUG_LINE_NO:35
    Else ; #DEBUG_LINE_NO:
      Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event onDeath(ObjectReference akKiller)
  Self.SendCustomEvent("testjeffbbossbattlescript_StopTeleporting", None) ; #DEBUG_LINE_NO:45
EndEvent
