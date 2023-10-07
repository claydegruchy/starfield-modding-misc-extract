ScriptName SE_LegendaryHostileScript Extends ReferenceAlias
{ Script to induce ships to attack based on distance }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Data
  ReferenceAlias Property TargetAlias Auto Const mandatory
  { The alias we're interested in }
  Int Property HailingDistance = 5000 Auto Const
  { The needed distance to start the hail }
  Int Property AttackDistance = 1500 Auto Const
  { The needed distance for the group to attack }
  Int Property ObjectiveToDisplay = 10 Auto Const
  { The objective for the player to attack }
  Scene Property HailingScene Auto Const
  Faction Property PlayerFriendFaction Auto Const mandatory
  Faction Property PlayerEnemyFaction Auto Const mandatory
  ReferenceAlias Property Alias_MapMarker Auto Const
  RefCollectionAlias Property LegendaryShips Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  Bool Property IsFlagship = False Auto Const
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  If IsFlagship == True ; #DEBUG_LINE_NO:34
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance as Float, 0) ; #DEBUG_LINE_NO:35
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance as Float, 0) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:39
  LegendaryShips.AddRef(Self.GetRef()) ; #DEBUG_LINE_NO:40
EndEvent

Event OnUnload()
  If IsFlagship == True ; #DEBUG_LINE_NO:45
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance) ; #DEBUG_LINE_NO:46
  Else ; #DEBUG_LINE_NO:
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
  Self.UnregisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:50
  (Self.GetOwningQuest() as se_legendaryscript).StartMoveTimer() ; #DEBUG_LINE_NO:53
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If IsFlagship == True ; #DEBUG_LINE_NO:57
    HailingScene.Start() ; #DEBUG_LINE_NO:59
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, HailingDistance) ; #DEBUG_LINE_NO:60
  Else ; #DEBUG_LINE_NO:
    Self.BeginAttack() ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
  Self.GetOwningQuest().SetObjectiveDisplayed(ObjectiveToDisplay, True, False) ; #DEBUG_LINE_NO:66
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  Self.BeginAttack() ; #DEBUG_LINE_NO:70
EndEvent

Function BeginAttack()
  LegendaryShips.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:74
  LegendaryShips.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:75
  LegendaryShips.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:76
  LegendaryShips.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:77
  If IsFlagship == False ; #DEBUG_LINE_NO:78
    Self.UnregisterForDistanceEvents(Self as ScriptObject, TargetAlias as ScriptObject, AttackDistance) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
  Self.UnregisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:81
EndFunction
