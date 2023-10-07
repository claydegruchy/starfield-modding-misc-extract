ScriptName DefaultCollectionAliasOnActivate Extends DefaultCollectionAlias default
{ Sets stage when THIS RefCollection's members are activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property ShouldDisableAfterSuccessfulActivation = False Auto Const
  { (Default: false) If true, disable after being successfully activated }
EndGroup


;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, akSenderRef.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:15
  Self.CheckAndSetStageAndCallDoSpecificThing(akSenderRef, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:17
EndEvent

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If ShouldDisableAfterSuccessfulActivation ; #DEBUG_LINE_NO:23
    RefCollectionMemberRef.Disable(False) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction
