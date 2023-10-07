ScriptName DefaultAliasOnContainerChangedTo Extends DefaultAlias default
{ Set stage when THIS object's container changes.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the container THIS object was moved to.
<LocationToCheck> is the current location of the container THIS object was moved to. }

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard EventGuard

;-- Functions ---------------------------------------

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
  Guard EventGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:12
    Location LocationToCheck = None ; #DEBUG_LINE_NO:13
    If akOldContainer ; #DEBUG_LINE_NO:14
      LocationToCheck = akOldContainer.GetCurrentLocation() ; #DEBUG_LINE_NO:15
    EndIf ; #DEBUG_LINE_NO:
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akNewContainer, LocationToCheck, None) ; #DEBUG_LINE_NO:17
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:19
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndEvent
