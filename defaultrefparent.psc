ScriptName DefaultRefParent Extends ObjectReference
{ Master script for the DefaultRef scripts.
<RefToCheck> is the reference activating/triggering/verbing THIS Object.
<LocationToCheck> is the current location of THIS object. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties
  Quest Property QuestToSetOrCheck Auto Const
  { MANDATORY *if* you are setting or checking a quest stage; this is that quest. }
  Int Property StageToSet = -1 Auto Const
  { MANDATORY *if* you are setting a quest stage; this is that stage. }
  Int Property PrereqStage = -1 Auto Const
  { QuestToSetOrCheck must have this specific stage set for this script's functionality to execute }
  Int Property TurnOffStage = -1 Auto Const
  { If QuestToSetOrCheck's stage >= TurnOffStage, this script's functionality is ignored }
  Int Property TurnOffStageDone = -1 Auto Const
  { If QuestToSetOrCheck's TurnOffStage has been specifically set , this script's functionality is ignored }
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
  If SkipBusyState == False ; #DEBUG_LINE_NO:63
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:64
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:67
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck ; #DEBUG_LINE_NO:68
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther ; #DEBUG_LINE_NO:69
  If RefToCheck == None ; #DEBUG_LINE_NO:71
    RefToCheck = Self as ObjectReference ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If LocationToCheck == None ; #DEBUG_LINE_NO:76
    LocationToCheck = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), Self as ObjectReference, FailOnDeadActor, ConditionFormToTest) ; #DEBUG_LINE_NO:81,91,92,93,94,98,99,100,102
  If isValid ; #DEBUG_LINE_NO:107
    defaultscriptfunctions.SafeSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet) ; #DEBUG_LINE_NO:108
    ObjectReference[] refsToDoThingsWith = Self.GetRefsToDoSpecificThingsWith() ; #DEBUG_LINE_NO:112
    If refsToDoThingsWith ; #DEBUG_LINE_NO:115
      Int I = 0 ; #DEBUG_LINE_NO:116
      Int iMax = refsToDoThingsWith.Length ; #DEBUG_LINE_NO:117
      While I < iMax ; #DEBUG_LINE_NO:118
        Bool isLastRef = !(I < iMax) ; #DEBUG_LINE_NO:119
        Self.DoSpecificThing(ParentScriptFunctionParams, refsToDoThingsWith[I], isLastRef) ; #DEBUG_LINE_NO:121
        I += 1 ; #DEBUG_LINE_NO:122
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.DoSpecificThing(ParentScriptFunctionParams, None, True) ; #DEBUG_LINE_NO:127
    EndIf ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:130
      Self.GotoState("Done") ; #DEBUG_LINE_NO:131
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetState() == "Busy" ; #DEBUG_LINE_NO:135
    Self.GotoState("") ; #DEBUG_LINE_NO:136
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RegisterOnHitFilters()
  If Self.GetPlayerOnly() ; #DEBUG_LINE_NO:145
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:146
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEventAggressorRefArray(Self as ScriptObject, Self.GetReferencesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:148
    Self.RegisterForHitEventAggressorRefAliasArray(Self as ScriptObject, Self.GetAliasesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:149
    Self.RegisterForHitEventAggressorFactionArray(Self as ScriptObject, Self.GetFactionsToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetPlayerOnly()
  Return False ; #DEBUG_LINE_NO:159
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:166
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:173
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:180
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:187
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:194
EndFunction

Bool Function GetLocationMatchIfChild()
  Return False ; #DEBUG_LINE_NO:201
EndFunction

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  Return None ; #DEBUG_LINE_NO:208
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
