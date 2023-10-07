ScriptName DefaultRefOnTriggerLeave Extends DefaultRef default
{ Sets stage when THIS object's trigger is left.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = True Auto Const
  { If true (default), delete THIS object when triggered successfully }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:13
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:19
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:21
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully ; #DEBUG_LINE_NO:26
    Self.Delete() ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction
