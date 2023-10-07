ScriptName DefaultAliasOnTriggerEnter Extends DefaultAlias default
{ Sets stage when THIS Alias entered.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference triggering THIS Alias.
<LocationToCheck> is the current location of THIS Alias. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Script_Specific_Properties
  Bool Property DeleteWhenTriggeredSuccessfully = True Auto Const
  { If true (default), delete THIS object when triggered successfully }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  SkipBusyState = True ; #DEBUG_LINE_NO:14
  If PrereqStage > -1 ; #DEBUG_LINE_NO:15
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:17
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTriggerEnter(ObjectReference akActionRef)
  defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams = defaultscriptfunctions.BuildParentScriptFunctionParams(akActionRef, Self.TryToGetCurrentLocation(), None) ; #DEBUG_LINE_NO:24
  Self.CheckAndSetStageAndCallDoSpecificThing(ParentScriptFunctionParams) ; #DEBUG_LINE_NO:26
EndEvent

Event Quest.OnStageSet(Quest akSource, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:31
    ObjectReference myTrigger = Self.GetRef() ; #DEBUG_LINE_NO:32
    If myTrigger ; #DEBUG_LINE_NO:33
      ObjectReference[] refs = myTrigger.GetAllRefsInTrigger() ; #DEBUG_LINE_NO:34
      Int I = 0 ; #DEBUG_LINE_NO:35
      While I < refs.Length ; #DEBUG_LINE_NO:36
        Self.OnTriggerEnter(refs[I]) ; #DEBUG_LINE_NO:37
        I += 1 ; #DEBUG_LINE_NO:38
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  If DeleteWhenTriggeredSuccessfully && LastRefToDoThingWith ; #DEBUG_LINE_NO:47
    Self.TryToDelete() ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction
