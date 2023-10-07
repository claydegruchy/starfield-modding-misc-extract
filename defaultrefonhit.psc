ScriptName DefaultRefOnHit Extends DefaultRef default
{ Sets stage when THIS object is hit.
<RefToCheck> is the reference hitting THIS Object.
<LocationToCheck> is the current location of THIS object.

SEE ALSO DefaultRefOnCombatStateChanged which includes the ability to also check for OnHit.
(You probably want to use DefaultRefOnCombatStateChanged if THIS is an actor and you are testing to see if it's becoming hostile) }

;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:11
EndEvent

Event OnUnload()
  Self.UnregisterForAllHitEvents(None) ; #DEBUG_LINE_NO:15
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akAggressor, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:25
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:27
  If DoOnce == False ; #DEBUG_LINE_NO:29
    Self.RegisterOnHitFilters() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent

;-- State -------------------------------------------
State Done

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState
