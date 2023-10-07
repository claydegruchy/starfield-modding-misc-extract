ScriptName DefaultUnlockLinkOnActivate Extends DefaultRefOnActivate default
{ Unlock (and optionally open when unlocked) the specified linked ref when THIS object is activated.
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
  { The Keyword of the LinkedRef you want to unlock when this activated. }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
  Bool Property ShouldOpenWhenUnlocked = True Auto Const
  { If true (default) linkedref will be opened when unlocked. If false, or if already unlocked, linked ref will be not be opened when activated. }
EndGroup


;-- Functions ---------------------------------------

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:25
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:27
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If RefToDoThingWith.IsLocked() ; #DEBUG_LINE_NO:35
    RefToDoThingWith.Unlock(False) ; #DEBUG_LINE_NO:37
    If ShouldOpenWhenUnlocked ; #DEBUG_LINE_NO:39
      RefToDoThingWith.SetOpen(True) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
