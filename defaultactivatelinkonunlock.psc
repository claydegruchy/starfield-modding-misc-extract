ScriptName DefaultActivateLinkOnUnlock Extends DefaultRef default
{ Activates the specified linked ref when THIS object is Unlocked.
<RefToCheck> is the PLAYER.
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
  Bool Property ActivatorIsRefToCheck = True Auto Const
  { If true (default), Activate function's akActivator param will be <RefToCheck>. If false, akActivator param will be THIS object. }
EndGroup


;-- Functions ---------------------------------------

Event OnLockStateChanged()
  If !Self.IsLocked() ; #DEBUG_LINE_NO:24
    defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(Game.GetPlayer() as ObjectReference, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:27
    Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:35
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:37
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ObjectReference ActivatorRef = Self as ObjectReference ; #DEBUG_LINE_NO:45
  If ActivatorIsRefToCheck ; #DEBUG_LINE_NO:46
    ActivatorRef = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  RefToDoThingWith.Activate(ActivatorRef, False) ; #DEBUG_LINE_NO:51
EndFunction
