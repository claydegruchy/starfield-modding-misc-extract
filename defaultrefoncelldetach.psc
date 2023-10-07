ScriptName DefaultRefOnCellDetach Extends DefaultRefParent default
{ Sets quest stage when this reference's cell detaches. }

;-- Functions ---------------------------------------

Event OnCellDetach()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(None, None, None) ; #DEBUG_LINE_NO:7
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:9
EndEvent
