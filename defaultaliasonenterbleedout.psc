ScriptName DefaultAliasOnEnterBleedout Extends DefaultAliasParent default
{ {Sets stage when THIS Alias enters bleedout.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest() }

;-- Functions ---------------------------------------

Event OnEnterBleedout()
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Game.GetPlayer() as ObjectReference, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:8
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:10
EndEvent
