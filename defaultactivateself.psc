ScriptName DefaultActivateSelf Extends DefaultRef default
{ Activates itself when THIS object's OnTriggerEnter event fires.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Bool Property ActivatorIsRefToCheck = False Auto Const
  { (Default: false) If true, Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:18
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:24
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:26
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference ; #DEBUG_LINE_NO:31
  If ActivatorIsRefToCheck ; #DEBUG_LINE_NO:32
    ActivatorRef = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
  Self.Activate(ActivatorRef, False) ; #DEBUG_LINE_NO:37
EndFunction
