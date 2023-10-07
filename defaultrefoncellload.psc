ScriptName DefaultRefOnCellLoad Extends DefaultRefParent default
{ Sets quest stage when this reference's cell loads. }

;-- Functions ---------------------------------------

Event OnCellLoad()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:7
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:9
EndEvent
