ScriptName DefaultAliasOnRead Extends DefaultAliasParent default
{ Sets quest stage when this reference has been read.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnRead()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
