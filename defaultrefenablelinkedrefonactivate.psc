ScriptName DefaultRefEnableLinkedRefOnActivate Extends DefaultRefOnActivate default
{ Enable or disable the specified linked ref when THIS object is activated.
<RefToCheck> is the reference activating THIS Object.
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
  Bool Property ShouldEnable = True Auto Const
  { If true (default) linkedref will be enabled. If false, linked ref will be disabled. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
EndGroup


;-- Functions ---------------------------------------

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:26
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:28
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If ShouldEnable ; #DEBUG_LINE_NO:36
    RefToDoThingWith.Enable(False) ; #DEBUG_LINE_NO:38
  Else ; #DEBUG_LINE_NO:
    RefToDoThingWith.Disable(False) ; #DEBUG_LINE_NO:41
  EndIf ; #DEBUG_LINE_NO:
EndFunction
