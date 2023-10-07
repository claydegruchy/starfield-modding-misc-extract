ScriptName DefaultRefOnEnterBleedout Extends DefaultActorParent default
{ Sets stage when THIS actor enters bleedout. }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Game.GetPlayer() as ObjectReference, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
