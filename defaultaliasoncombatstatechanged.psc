ScriptName DefaultAliasOnCombatStateChanged Extends DefaultAlias default
{ Sets stage when THIS Alias's combat state changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference THIS Alias is getting into combat with
<LocationToCheck> is the current location of THIS Alias's reference. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property IncludeOnHitEvent = True Auto Const
  { If true (default), exceute script functionality when THIS actor is hit in combat and <RefToCheck> will be the aggressor. }
  Bool Property SpellHits_HostileOnly = True Auto Const
  { (Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit.
		NOTE: this only matters if IncludeOnHitEvent = true }
  Int Property CombatStateToCheckFor = 4 Auto Const
  { 0: Not In Combat
	1: In Combat
	2: Searching
	4 (Default): In Combat or Searching }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If IncludeOnHitEvent && Self.GetReference().Is3DLoaded() ; #DEBUG_LINE_NO:23
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  If IncludeOnHitEvent ; #DEBUG_LINE_NO:29
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:35
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  Spell sourceSpell = akSource as Spell ; #DEBUG_LINE_NO:47
  If SpellHits_HostileOnly == False || sourceSpell == None || sourceSpell.IsHostile() ; #DEBUG_LINE_NO:48
    Self.CombatStateChangedOrHit(akAggressor) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnCombatStateChanged(ObjectReference akTarget, Int aeCombatState)
  If aeCombatState > 0 && CombatStateToCheckFor == 4 || aeCombatState == CombatStateToCheckFor ; #DEBUG_LINE_NO:54
    Self.CombatStateChangedOrHit(akTarget) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CombatStateChangedOrHit(ObjectReference TargetOrAggressor)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(TargetOrAggressor, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:61
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:63
EndFunction

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
