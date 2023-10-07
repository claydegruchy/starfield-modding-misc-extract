ScriptName DefaultActivateLinkedRefOnTrigger Extends DefaultRef default
{ Activates the specified linked ref when THIS object is entered.
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
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
  Bool Property ActivatorIsRefToCheck = True Auto Const
  { If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
  Bool Property ActivateOnTriggerEnter = True Auto Const
  { if true, will send activation OnTriggerEnter }
  Bool Property ActivateOnTriggerLeave = False Auto Const
  { if true, will send activation OnTriggerLeave }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:30
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  If ActivateOnTriggerEnter ; #DEBUG_LINE_NO:35
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:36
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerLeave(ObjectReference akActionRef)
  If ActivateOnTriggerLeave ; #DEBUG_LINE_NO:44
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:45
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:53
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:55
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference ; #DEBUG_LINE_NO:63
  If ActivatorIsRefToCheck ; #DEBUG_LINE_NO:64
    ActivatorRef = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  RefToDoThingWith.Activate(ActivatorRef, False) ; #DEBUG_LINE_NO:69
EndFunction
