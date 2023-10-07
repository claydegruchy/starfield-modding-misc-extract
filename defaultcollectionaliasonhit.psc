ScriptName DefaultCollectionAliasOnHit Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are hit.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference hitting each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection.

SEE ALSO DefaultCollectionOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultCollectionOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property SpellHits_HostileOnly = True Auto Const
  { (Default: true) If true, stage will be set when hits from spells are flagged as "hostile". If false, stage will be set from any kind of spell hit. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:16
EndEvent

Event OnLoad(ObjectReference akSenderRef)
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:20
EndEvent

Event OnUnload(ObjectReference akSenderRef)
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:24
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String asMaterialName)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, akTarget.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:34
  Spell sourceSpell = akSource as Spell ; #DEBUG_LINE_NO:38
  If SpellHits_HostileOnly == False || sourceSpell == None || sourceSpell.IsHostile() ; #DEBUG_LINE_NO:39
    Self.CheckAndSetStageAndCallDoSpecificThing(akTarget, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  If DoOnce == False ; #DEBUG_LINE_NO:43
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad(ObjectReference akSenderRef)
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
