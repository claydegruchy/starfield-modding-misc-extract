ScriptName TestMiningPrototype01Script Extends ObjectReference
{ Spawn ore that the player has to pickup }

;-- Variables ---------------------------------------
Int MineralAmount

;-- Properties --------------------------------------
Faction Property CurrentCompanionFaction Auto Const mandatory
MiscObject Property MineralType Auto Const mandatory

;-- Functions ---------------------------------------

Function myRegisterForHit()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:10
  Self.RegisterForHitEvent(Self as ScriptObject, CurrentCompanionFaction as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:11
EndFunction

Event OnInit()
  Self.myRegisterForHit() ; #DEBUG_LINE_NO:15
  MineralAmount = Utility.RandomInt(1, 3) ; #DEBUG_LINE_NO:18
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.GetLinkedRef(None).PlaceAtMe(MineralType as Form, MineralAmount, False, False, True, None, None, True) ; #DEBUG_LINE_NO:23
  Self.Disable(False) ; #DEBUG_LINE_NO:24
EndEvent
