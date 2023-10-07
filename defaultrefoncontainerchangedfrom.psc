ScriptName DefaultRefOnContainerChangedFrom Extends DefaultRef default
{ Set stage when THIS object's container changes.
<RefToCheck> is the container THIS object was removed from.
<LocationToCheck> is the current location of the container THIS object was removed from. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akOldContainer, akOldContainer.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
