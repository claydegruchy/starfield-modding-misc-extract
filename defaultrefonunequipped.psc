ScriptName DefaultRefOnUnequipped Extends DefaultRef default
{ Sets quest stage when this reference's is unequipped.
<RefToCheck> is the unequipping actor.
<LocationToCheck> is the current location of the unequipping actor. }

;-- Functions ---------------------------------------

Event OnUnequipped(Actor akActor)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActor as ObjectReference, akActor.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
