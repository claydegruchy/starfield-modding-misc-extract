ScriptName DefaultAliasOnOpen Extends DefaultAlias default
{ Sets quest stage when this reference is opened.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference opening THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Functions ---------------------------------------

Event OnOpen(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:10
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:12
EndEvent
