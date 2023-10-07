ScriptName DefaultAliasOnUnload Extends DefaultAliasParent default
{ Sets quest stage when this reference unloads.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnUnload()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
