ScriptName DefaultCollectionAliasOnLoad Extends DefaultCollectionAliasParent default
{ Sets stage when THIS RefCollection's members load.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnLoad(ObjectReference akSender)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(akSender, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
