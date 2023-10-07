ScriptName DefaultCollectionAliasParent Extends RefCollectionAlias
{ Master script for the DefaultCollection scripts.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------
ObjectReference[] TriggeredRefArray

;-- Properties --------------------------------------
Group Quest_Properties
  Int Property StageToSet = -1 Auto Const
  { MANDATORY *if* you are setting a quest stage; this is that stage. }
  Int Property PrereqStage = -1 Auto Const
  { <QuestToSetOrCheck> must have this specific stage set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If <QuestToSetOrCheck>'s stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If <QuestToSetOrCheck>'s TurnOffStage has been specifically set , this script's functionality is ignored }
EndGroup

Group Script_Specific_Properties
  Bool Property xxxPlaceHolderForEmptyGroupxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group RefCollection_Handling_Properties
  Bool Property OnFirstRef = False Auto Const
  { if true (default) script functionality will exectute when ANY ref in THIS refcollection is affected.
If false, script requires ALL refs in THIS recollection to be affected. }
  Int Property CountRemainingRequired = 0 Auto Const
  { exectute script functionality when all BUT this many refs are affected.
For example, to set a stage when all but three actors are killed, set this to 3 on the OnDeath script.
NOTE: this is IGNORED if OnFirstRef == True }
  GlobalVariable Property TotalRefCountGlobal Auto Const
  { This Global will be updated as each reference is affected - it will represent the TOTAL number of references in THIS refcollection }
  GlobalVariable Property AffectedRefCountGlobal Auto Const
  { This Global will be updated as each reference is affected - it will represent a count of the refs CURRENTLY in THIS refcollection *who have been affected.* }
  Bool Property UpdateCurrentInstanceCountGlobals = True Auto Const
  { Calls UpdateCurrentInstanceGlobal for TotalRefCountGlobal and AffectedRefCountGlobal at start up and AffectedRefCountGlobal when changed. }
  Bool Property ClearDisabledRefsOnInit = False Auto Const
  { if TRUE will clear disabled refs OnAliasInit }
EndGroup

Group RefToCheck_Optional_Properties
  Bool Property xxxPlaceHolderForEmptyGroup_RefToCheckxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group LocationToCheck_Optional_Properties
  Bool Property xxxPlaceHolderForEmptyGroup_LocationToCheckxxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Optional_Properties
  Bool Property DoOnce = False Auto Const
  { (Default: false) If true, only execute this script's functionality once. 
NOTE: This must be false if you want to use AdditionalStageToSetWhenAllRefsAffected }
  conditionform Property ConditionFormToTest Auto Const
  { If set, this condition form must be true for script to excecute it's functionality }
EndGroup

Group Actor_Only_Properties
{ These properties only matter if THIS object is an Actor }
  Bool Property FailOnDeadActor = False Auto Const
  { (Default: false). If true, and if THIS object is an actor and is dead, ignore this script's functionality. }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup

Bool Property SkipBusyState = True Auto hidden

;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Event OnAliasInit()
  If ClearDisabledRefsOnInit ; #DEBUG_LINE_NO:88
    Int disabledCount = Self.RemoveDisabled() ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
  If TotalRefCountGlobal != None ; #DEBUG_LINE_NO:93
    TotalRefCountGlobal.SetValue(Self.GetCount() as Float) ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateInstanceGlobals() ; #DEBUG_LINE_NO:97
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  If TotalRefCountGlobal != None ; #DEBUG_LINE_NO:101
    TotalRefCountGlobal.SetValue(Self.GetCount() as Float) ; #DEBUG_LINE_NO:102
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateInstanceGlobals() ; #DEBUG_LINE_NO:104
EndEvent

Event OnAliasShutdown()
  TriggeredRefArray.clear() ; #DEBUG_LINE_NO:109
EndEvent

Bool Function AddTriggeredRefAndCheckTriggeredArray(ObjectReference TriggeredRef)
  Bool returnVal = OnFirstRef ; #DEBUG_LINE_NO:116
  If returnVal == False ; #DEBUG_LINE_NO:118
    If TriggeredRefArray == None ; #DEBUG_LINE_NO:121
      TriggeredRefArray = new ObjectReference[0] ; #DEBUG_LINE_NO:122
    EndIf ; #DEBUG_LINE_NO:
    If TriggeredRefArray.find(TriggeredRef, 0) < 0 ; #DEBUG_LINE_NO:126
      TriggeredRefArray.add(TriggeredRef, 1) ; #DEBUG_LINE_NO:127
    EndIf ; #DEBUG_LINE_NO:
    Int I = 0 ; #DEBUG_LINE_NO:131
    Int iMax = Self.GetCount() ; #DEBUG_LINE_NO:132
    Int countFound = 0 ; #DEBUG_LINE_NO:133
    While I < iMax ; #DEBUG_LINE_NO:134
      If TriggeredRefArray.find(Self.GetAt(I), 0) >= 0 ; #DEBUG_LINE_NO:135
        countFound += 1 ; #DEBUG_LINE_NO:136
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:138
    EndWhile ; #DEBUG_LINE_NO:
    If TotalRefCountGlobal != None ; #DEBUG_LINE_NO:144
      TotalRefCountGlobal.SetValue(iMax as Float) ; #DEBUG_LINE_NO:145
    EndIf ; #DEBUG_LINE_NO:
    If AffectedRefCountGlobal != None ; #DEBUG_LINE_NO:147
      AffectedRefCountGlobal.SetValue(countFound as Float) ; #DEBUG_LINE_NO:148
    EndIf ; #DEBUG_LINE_NO:
    Self.UpdateInstanceGlobals() ; #DEBUG_LINE_NO:151
    If countFound >= 1 && OnFirstRef || countFound + CountRemainingRequired >= iMax ; #DEBUG_LINE_NO:153
      returnVal = True ; #DEBUG_LINE_NO:154
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:159
EndFunction

Function UpdateInstanceGlobals()
  If UpdateCurrentInstanceCountGlobals ; #DEBUG_LINE_NO:164
    If TotalRefCountGlobal != None ; #DEBUG_LINE_NO:165
      Self.GetOwningQuest().UpdateCurrentInstanceGlobal(TotalRefCountGlobal) ; #DEBUG_LINE_NO:166
    EndIf ; #DEBUG_LINE_NO:
    If AffectedRefCountGlobal != None ; #DEBUG_LINE_NO:168
      Self.GetOwningQuest().UpdateCurrentInstanceGlobal(AffectedRefCountGlobal) ; #DEBUG_LINE_NO:169
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If SkipBusyState == False ; #DEBUG_LINE_NO:175
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:179
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck ; #DEBUG_LINE_NO:180
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther ; #DEBUG_LINE_NO:181
  If RefToCheck == None ; #DEBUG_LINE_NO:183
    RefToCheck = RefCollectionMemberRef ; #DEBUG_LINE_NO:185
  EndIf ; #DEBUG_LINE_NO:
  If LocationToCheck == None ; #DEBUG_LINE_NO:188
    LocationToCheck = RefCollectionMemberRef.GetCurrentLocation() ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  Quest QuestToSetOrCheck = Self.GetOwningQuest() ; #DEBUG_LINE_NO:193
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), RefCollectionMemberRef, FailOnDeadActor, ConditionFormToTest) ; #DEBUG_LINE_NO:195,205,206,207,208,212,213,214
  If isValid ; #DEBUG_LINE_NO:221
    Self.DoSpecificThingForEachValidRef(RefCollectionMemberRef, ParentScriptFunctionParams) ; #DEBUG_LINE_NO:222
    If Self.AddTriggeredRefAndCheckTriggeredArray(RefCollectionMemberRef) ; #DEBUG_LINE_NO:224
      defaultscriptfunctions.SafeSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet) ; #DEBUG_LINE_NO:225
      ObjectReference[] refsToDoThingsWith = Self.GetRefsToDoSpecificThingsWith() ; #DEBUG_LINE_NO:229
      If refsToDoThingsWith ; #DEBUG_LINE_NO:232
        Int I = 0 ; #DEBUG_LINE_NO:233
        Int iMax = refsToDoThingsWith.Length ; #DEBUG_LINE_NO:234
        While I < iMax ; #DEBUG_LINE_NO:235
          Bool isLastRef = !(I < iMax) ; #DEBUG_LINE_NO:236
          Self.DoSpecificThing(ParentScriptFunctionParams, refsToDoThingsWith[I], isLastRef) ; #DEBUG_LINE_NO:238
          I += 1 ; #DEBUG_LINE_NO:239
        EndWhile ; #DEBUG_LINE_NO:
      Else ; #DEBUG_LINE_NO:
        Self.DoSpecificThing(ParentScriptFunctionParams, None, True) ; #DEBUG_LINE_NO:244
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:248
      Self.GotoState("Done") ; #DEBUG_LINE_NO:249
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetState() == "Busy" ; #DEBUG_LINE_NO:253
    Self.GotoState("") ; #DEBUG_LINE_NO:254
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RegisterOnHitFilters()
  If Self.GetPlayerOnly() ; #DEBUG_LINE_NO:263
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:264
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEventAggressorRefArray(Self as ScriptObject, Self.GetReferencesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:266
    Self.RegisterForHitEventAggressorRefAliasArray(Self as ScriptObject, Self.GetAliasesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:267
    Self.RegisterForHitEventAggressorFactionArray(Self as ScriptObject, Self.GetFactionsToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:268
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetPlayerOnly()
  Return False ; #DEBUG_LINE_NO:277
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:284
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:291
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:298
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:305
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:312
EndFunction

Bool Function GetLocationMatchIfChild()
  Return False ; #DEBUG_LINE_NO:319
EndFunction

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  Return None ; #DEBUG_LINE_NO:326
EndFunction

;-- State -------------------------------------------
State Busy

  Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction

  Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
State Done

  Function CheckAndSetStageAndCallDoSpecificThing(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction

  Function DoSpecificThingForEachValidRef(ObjectReference RefCollectionMemberRef, defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction
EndState
