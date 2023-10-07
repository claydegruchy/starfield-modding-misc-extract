ScriptName TestMQ101MineResourceTriggerScript Extends ObjectReference

;-- Variables ---------------------------------------
Actor PlayerREF

;-- Properties --------------------------------------
LeveledItem Property TestMQ101MineralDeposit Auto

;-- Functions ---------------------------------------

Function GainMinerals()
  PlayerREF.AddItem(TestMQ101MineralDeposit as Form, 1, False) ; #DEBUG_LINE_NO:10
  Self.Disable(False) ; #DEBUG_LINE_NO:11
EndFunction

;-- State -------------------------------------------
State hasbeentriggered
EndState

;-- State -------------------------------------------
Auto State waitingForPlayer

  Event OnActivate(ObjectReference akActionRef)
    If akActionRef == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:
      Self.gotoState("hasbeentriggered") ; #DEBUG_LINE_NO:
      Self.GainMinerals() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
    If akAggressor == PlayerREF as ObjectReference ; #DEBUG_LINE_NO:
      Self.gotoState("hasbeentriggered") ; #DEBUG_LINE_NO:
      Self.GainMinerals() ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnInit()
    PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:17
    Self.RegisterForHitEvent(Self as ScriptObject, PlayerREF as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:18
  EndEvent
EndState
