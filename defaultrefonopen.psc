ScriptName DefaultRefOnOpen Extends DefaultRef default
{ Sets quest stage when this reference is opened.
<RefToCheck> is the reference opening THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
