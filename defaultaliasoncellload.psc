ScriptName DefaultAliasOnCellLoad Extends DefaultAliasParent default
{ Sets stage if a THIS Alias's cell loads.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnCellLoad()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
