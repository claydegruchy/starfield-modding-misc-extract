ScriptName DefaultAliasOnContainerChangedFrom Extends DefaultAlias default
{ Set stage when THIS Alias's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was removed from.
<LocationToCheck> is the current location of the container THIS object was removed from. }

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Location LocationToCheck = None ; #DEBUG_LINE_NO:9
  If akOldContainer ; #DEBUG_LINE_NO:10
    LocationToCheck = akOldContainer.GetCurrentLocation() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akOldContainer, LocationToCheck, None) ; #DEBUG_LINE_NO:13
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:15
EndEvent
