ScriptName DefaultAliasOnUnequipped Extends DefaultAlias default
{ Sets quest stage when this reference's is equipped.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the equipping actor.
<LocationToCheck> is the current location of the equipping actor. }

;-- Functions ---------------------------------------

Event OnEquipped(Actor akActor)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActor as ObjectReference, akActor.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:10
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:12
EndEvent
