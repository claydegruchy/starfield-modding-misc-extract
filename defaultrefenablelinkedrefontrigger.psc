ScriptName DefaultRefEnableLinkedRefOnTrigger Extends DefaultRefOnTriggerEnter default
{ Enable or disable the specified linked ref when THIS object is triggered.
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
  { The Keyword of the LinkedRef you want to enable when THIS object is triggered. }
  Bool Property ShouldEnable = True Auto Const
  { If true (default) linkedref will be enabled. If false, linked ref will be disabled. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:24
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:29
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:31
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If ShouldEnable ; #DEBUG_LINE_NO:39
    RefToDoThingWith.Enable(False) ; #DEBUG_LINE_NO:41
  Else ; #DEBUG_LINE_NO:
    RefToDoThingWith.Disable(False) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
  Parent.DoSpecificThing(ParentScriptFunctionParams, RefToDoThingWith, LastRefToDoThingWith) ; #DEBUG_LINE_NO:47
EndFunction
