ScriptName DefaultAliasParent Extends ReferenceAlias hidden
{ Master script for the DefaultAlias scripts.
<QuestToSetOrCheck> is THIS ReferenceAlias's GetOwningQuest()
<RefToCheck> is the reference activating/triggering/verbing THIS ReferenceAlias.
<LocationToCheck> is the current location of THIS ReferenceAlias's reference. }

;-- Variables ---------------------------------------

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
  { (Default: false) If true, only execute this script's functionality once }
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

Bool Property SkipBusyState = False Auto hidden

;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If SkipBusyState == False ; #DEBUG_LINE_NO:61
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:65
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck ; #DEBUG_LINE_NO:66
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther ; #DEBUG_LINE_NO:67
  If RefToCheck == None ; #DEBUG_LINE_NO:71
    RefToCheck = Self.GetReference() ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If LocationToCheck == None ; #DEBUG_LINE_NO:76
    LocationToCheck = Self.TryToGetCurrentLocation() ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  Quest QuestToSetOrCheck = Self.GetOwningQuest() ; #DEBUG_LINE_NO:81
  ObjectReference CheckAliveActorOrShip = Self.GetReference() ; #DEBUG_LINE_NO:82
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), CheckAliveActorOrShip, FailOnDeadActor, ConditionFormToTest) ; #DEBUG_LINE_NO:84,94,95,96,97,101,102,103
  If isValid ; #DEBUG_LINE_NO:110
    defaultscriptfunctions.SafeSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet) ; #DEBUG_LINE_NO:111
    ObjectReference[] refsToDoThingsWith = Self.GetRefsToDoSpecificThingsWith() ; #DEBUG_LINE_NO:115
    If refsToDoThingsWith ; #DEBUG_LINE_NO:118
      Int I = 0 ; #DEBUG_LINE_NO:119
      Int iMax = refsToDoThingsWith.Length ; #DEBUG_LINE_NO:120
      While I < iMax ; #DEBUG_LINE_NO:121
        Bool isLastRef = !(I < iMax) ; #DEBUG_LINE_NO:122
        Self.DoSpecificThing(ParentScriptFunctionParams, refsToDoThingsWith[I], isLastRef) ; #DEBUG_LINE_NO:124
        I += 1 ; #DEBUG_LINE_NO:125
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.DoSpecificThing(ParentScriptFunctionParams, None, True) ; #DEBUG_LINE_NO:130
    EndIf ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:133
      Self.GotoState("Done") ; #DEBUG_LINE_NO:134
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetState() == "Busy" ; #DEBUG_LINE_NO:138
    Self.GotoState("") ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RegisterOnHitFilters()
  If Self.GetPlayerOnly() ; #DEBUG_LINE_NO:148
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:149
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEventAggressorRefArray(Self as ScriptObject, Self.GetReferencesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:151
    Self.RegisterForHitEventAggressorRefAliasArray(Self as ScriptObject, Self.GetAliasesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:152
    Self.RegisterForHitEventAggressorFactionArray(Self as ScriptObject, Self.GetFactionsToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetPlayerOnly()
  Return False ; #DEBUG_LINE_NO:162
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:169
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:176
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:183
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:191
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:198
EndFunction

Bool Function GetLocationMatchIfChild()
  Return False ; #DEBUG_LINE_NO:205
EndFunction

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  Return None ; #DEBUG_LINE_NO:212
EndFunction

;-- State -------------------------------------------
State Busy

  Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction
EndState

;-- State -------------------------------------------
State Done

  Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
    ; Empty function ; #DEBUG_LINE_NO:
  EndFunction
EndState
