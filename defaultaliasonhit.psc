ScriptName DefaultAliasOnHit Extends DefaultAlias default
{ Sets stage when THIS Alias is hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting THIS Alias.
<LocationToCheck> is the current location of THIS Alias.

SEE ALSO DefaultAliasOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultAliasOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SpellHits_HostileOnly = True Auto Const
  { (Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If Self.GetReference().Is3DLoaded() ; #DEBUG_LINE_NO:16
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnLoad()
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:22
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:26
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:36
  Spell sourceSpell = akSource as Spell ; #DEBUG_LINE_NO:40
  If SpellHits_HostileOnly == False || sourceSpell == None || sourceSpell.IsHostile() ; #DEBUG_LINE_NO:41
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:45
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
