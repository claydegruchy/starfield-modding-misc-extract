ScriptName DefaultAliasOnTriggerLeave Extends DefaultAlias default
{ Sets stage when THIS Alias's trigger is left.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference triggering THIS Alias.
<LocationToCheck> is the current location of THIS Alias. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = True Auto Const
  { If true (default), delete THIS Alias;s reference when triggered successfully }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:14
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:20
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:22
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully ; #DEBUG_LINE_NO:27
    Self.TryToDelete() ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction
