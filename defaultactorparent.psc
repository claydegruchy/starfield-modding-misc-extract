ScriptName DefaultActorParent Extends Actor hidden
{ Master script for the DefaultActor scripts.
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
  Bool Property FailOnDeadActor = False Auto Const
  { (Default: false). If true, and if THIS object is an actor and is dead, ignore this script's functionality. }
  conditionform Property ConditionFormToTest Auto Const
  { If set, this condition form must be true for script to excecute it's functionality }
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

Event OnInit()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Function CheckAndSetStageAndCallDoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams)
  If SkipBusyState == False ; #DEBUG_LINE_NO:61
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference RefToCheck = ParentScriptFunctionParams.RefToCheck ; #DEBUG_LINE_NO:65
  Location LocationToCheck = ParentScriptFunctionParams.LocationToCheck ; #DEBUG_LINE_NO:66
  Location LocationToCheckOther = ParentScriptFunctionParams.LocationToCheckOther ; #DEBUG_LINE_NO:67
  If RefToCheck == None ; #DEBUG_LINE_NO:69
    RefToCheck = Self as ObjectReference ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
  If LocationToCheck == None ; #DEBUG_LINE_NO:74
    LocationToCheck = Self.GetCurrentLocation() ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  Bool isValid = defaultscriptfunctions.IsValidToSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, Self.GetPlayerOnly(), Self.GetReferencesToCheckAgainst(), Self.GetAliasesToCheckAgainst(), Self.GetFactionsToCheckAgainst(), LocationToCheck, LocationToCheckOther, Self.GetLocationsToCheckAgainst(), Self.GetLocationAliasesToCheckAgainst(), Self.GetLocationMatchIfChild(), Self as ObjectReference, FailOnDeadActor, ConditionFormToTest) ; #DEBUG_LINE_NO:79,89,90,91,92,96,97,98,100
  If isValid ; #DEBUG_LINE_NO:105
    defaultscriptfunctions.SafeSetStage(Self as ScriptObject, ShowTraces, QuestToSetOrCheck, StageToSet) ; #DEBUG_LINE_NO:106
    ObjectReference[] refsToDoThingsWith = Self.GetRefsToDoSpecificThingsWith() ; #DEBUG_LINE_NO:110
    If refsToDoThingsWith ; #DEBUG_LINE_NO:113
      Int I = 0 ; #DEBUG_LINE_NO:114
      Int iMax = refsToDoThingsWith.Length ; #DEBUG_LINE_NO:115
      While I < iMax ; #DEBUG_LINE_NO:116
        Bool isLastRef = !(I < iMax) ; #DEBUG_LINE_NO:117
        Self.DoSpecificThing(ParentScriptFunctionParams, refsToDoThingsWith[I], isLastRef) ; #DEBUG_LINE_NO:119
        I += 1 ; #DEBUG_LINE_NO:120
      EndWhile ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Self.DoSpecificThing(ParentScriptFunctionParams, None, True) ; #DEBUG_LINE_NO:125
    EndIf ; #DEBUG_LINE_NO:
    If DoOnce ; #DEBUG_LINE_NO:128
      Self.GotoState("Done") ; #DEBUG_LINE_NO:129
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetState() == "Busy" ; #DEBUG_LINE_NO:133
    Self.GotoState("") ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RegisterOnHitFilters()
  If Self.GetPlayerOnly() ; #DEBUG_LINE_NO:143
    Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:144
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForHitEventAggressorRefArray(Self as ScriptObject, Self.GetReferencesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:146
    Self.RegisterForHitEventAggressorRefAliasArray(Self as ScriptObject, Self.GetAliasesToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:147
    Self.RegisterForHitEventAggressorFactionArray(Self as ScriptObject, Self.GetFactionsToCheckAgainst(), None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function GetPlayerOnly()
  Return False ; #DEBUG_LINE_NO:157
EndFunction

ObjectReference[] Function GetReferencesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:164
EndFunction

ReferenceAlias[] Function GetAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:171
EndFunction

Faction[] Function GetFactionsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:178
EndFunction

Location[] Function GetLocationsToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:185
EndFunction

LocationAlias[] Function GetLocationAliasesToCheckAgainst()
  Return None ; #DEBUG_LINE_NO:192
EndFunction

Bool Function GetLocationMatchIfChild()
  Return False ; #DEBUG_LINE_NO:199
EndFunction

ObjectReference[] Function GetRefsToDoSpecificThingsWith()
  Return None ; #DEBUG_LINE_NO:206
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
