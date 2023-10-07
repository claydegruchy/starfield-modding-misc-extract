ScriptName DefaultRefOnRead Extends DefaultRefParent default
{ Sets quest stage when this reference has been read. }

;-- Functions ---------------------------------------

Event OnRead()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:7
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:9
EndEvent
