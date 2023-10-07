ScriptName DefaultRefOnActivate Extends DefaultRef default
{ Sets stage if a reference is activated.
<RefToCheck> is the reference activating THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
