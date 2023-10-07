ScriptName DefaultRefOnContainerChangedTo Extends DefaultRef default
{ Set stage when THIS object's container changes.
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akNewContainer, akOldContainer.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:9
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:11
EndEvent
