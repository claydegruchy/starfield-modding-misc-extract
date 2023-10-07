ScriptName DefaultSendStoryEventOnTrigger Extends DefaultRef default
{ Calls SendStoryEvent on the specified keyword when THIS object is entered.
<RefToCheck> is the reference triggering THIS Object.
<LocationToCheck> is the current location of THIS object.

Story Manager Data will be:
Ref1: <RefToCheck>
Ref2: THIS trigger object
Location: <LocationToCheck> }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Keyword Property StoryEventKeyword Auto Const mandatory
  { The Keyword you want to call SendStoryEvent for. }
  Int Property Value1 = 0 Auto Const
  { Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function. }
  Int Property Value2 = 0 Auto Const
  { Will be sent as the aiValue1 parameter of the SendStoryEventAndWait() function. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:30
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:37
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:39
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Location akLoc = ParentScriptFunctionParams.LocationToCheck ; #DEBUG_LINE_NO:47
  ObjectReference akRef1 = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:48
  ObjectReference akRef2 = Self as ObjectReference ; #DEBUG_LINE_NO:49
  Int aiValue1 = Value1 ; #DEBUG_LINE_NO:50
  Int aiValue2 = Value2 ; #DEBUG_LINE_NO:51
  Quest[] startedQuests = StoryEventKeyword.SendStoryEventAndWait(akLoc, akRef1, akRef2, aiValue1, aiValue2) ; #DEBUG_LINE_NO:55
  Bool success = startedQuests.Length > 0 ; #DEBUG_LINE_NO:56
EndFunction
