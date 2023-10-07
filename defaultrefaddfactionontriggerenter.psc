ScriptName DefaultRefAddFactionOnTriggerEnter Extends DefaultRef
{ Adds faction to linked ref and linked ref children when THIS object entered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = False Auto Const
  { (Default: false) If true, delete THIS object when triggered successfully. }
  Keyword Property LinkedRefKeyword Auto Const
  { The Keyword of the LinkedRef you want to activate when this activated. }
  Faction Property FactionToAdd Auto Const mandatory
  { faction to add to triggering actor }
  Bool Property ShouldUseLinkedRefChain = False Auto Const
  { (Default: false) If true, will execute over the entire Linked Ref Chain. }
EndGroup


;-- Functions ---------------------------------------

Event OnInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:19
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.GetCurrentLocation(), None) ; #DEBUG_LINE_NO:25
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:27
EndEvent

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  If ShouldUseLinkedRefChain ; #DEBUG_LINE_NO:32
    Return Self.GetLinkedRefChain(LinkedRefKeyword, 100) ; #DEBUG_LINE_NO:34
  Else ; #DEBUG_LINE_NO:
    Return Self.GetLinkedRef(LinkedRefKeyword).GetSingleRefArray() ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  Actor actorRef = RefToDoThingWith as Actor ; #DEBUG_LINE_NO:44
  If actorRef ; #DEBUG_LINE_NO:45
    actorRef.AddToFaction(FactionToAdd) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  If DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith ; #DEBUG_LINE_NO:49
    Self.Delete() ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction
