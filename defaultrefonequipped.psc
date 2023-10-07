ScriptName DefaultRefOnEquipped Extends DefaultRef default
{ Sets quest stage when this reference's is equipped.
<RefToCheck> is the equipping actor.
<LocationToCheck> is the current location of the equipping actor. }

;-- Functions ---------------------------------------

Event OnEquipped(Actor akActor)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActor as ObjectReference, akActor.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
