ScriptName Utility_FAB_Script Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function AttackPlayer(Actor aHostile)
  aHostile.RemoveFromAllFactions() ; #DEBUG_LINE_NO:8
  aHostile.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:9
  aHostile.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:10
  aHostile.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:11
  aHostile.SetEssential(False) ; #DEBUG_LINE_NO:12
  aHostile.EvaluatePackage(False) ; #DEBUG_LINE_NO:13
EndFunction

Function ShipAttackPlayer(spaceshipreference sHostile)
  sHostile.RemoveFromAllFactions() ; #DEBUG_LINE_NO:18
  sHostile.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:19
  sHostile.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:20
  sHostile.StartCombat(Game.GetPlayer().GetCurrentShipRef(), False) ; #DEBUG_LINE_NO:21
  sHostile.SetEssential(False) ; #DEBUG_LINE_NO:22
  sHostile.EvaluatePackage(False) ; #DEBUG_LINE_NO:23
EndFunction
