ScriptName DefaultScriptFunctions Extends ScriptObject Const hidden

;-- Structs -----------------------------------------
Struct ParentScriptFunctionParams
  ObjectReference RefToCheck
  Location LocationToCheck
  Location LocationToCheckOther
EndStruct


;-- Functions ---------------------------------------

defaultscriptfunctions:parentscriptfunctionparams Function BuildParentScriptFunctionParams(ObjectReference RefToCheck, Location LocationToCheck, Location LocationToCheckOther) Global
  defaultscriptfunctions:parentscriptfunctionparams newParams = new defaultscriptfunctions:parentscriptfunctionparams ; #DEBUG_LINE_NO:11
  newParams.RefToCheck = RefToCheck ; #DEBUG_LINE_NO:13
  newParams.LocationToCheck = LocationToCheck ; #DEBUG_LINE_NO:14
  newParams.LocationToCheckOther = LocationToCheckOther ; #DEBUG_LINE_NO:15
  Return newParams ; #DEBUG_LINE_NO:17
EndFunction

Bool Function TryToSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor, conditionform ConditionFormToTest) Global
  Bool returnVal = DefaultScriptFunctions.IsValidToSetStage(CallingObject, ShowNormalTrace, QuestToSet, StageToSet, PrereqStage, TurnOffStage, TurnOffStageDone, RefToCheck, PlayerOnly, ReferencesToCheckAgainst, AliasesToCheckAgainst, FactionsToCheckAgainst, LocationToCheck, LocationToCheckOther, LocationsToCheckAgainst, LocationAliasesToCheckAgainst, LocationMatchIfChild, CheckAliveActorOrShip, FailOnDeadActor, ConditionFormToTest) ; #DEBUG_LINE_NO:52
  If returnVal ; #DEBUG_LINE_NO:78
    DefaultScriptFunctions.SafeSetStage(CallingObject, ShowNormalTrace, QuestToSet, StageToSet) ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:83
EndFunction

Bool Function IsDead(ObjectReference ActorOrSpaceshipToTest) Global
  Actor actorRef = ActorOrSpaceshipToTest as Actor ; #DEBUG_LINE_NO:88
  If actorRef ; #DEBUG_LINE_NO:89
    Return actorRef.IsDead() ; #DEBUG_LINE_NO:90
  Else ; #DEBUG_LINE_NO:
    spaceshipreference shipRef = ActorOrSpaceshipToTest as spaceshipreference ; #DEBUG_LINE_NO:92
    If shipRef ; #DEBUG_LINE_NO:93
      Return shipRef.IsDead() ; #DEBUG_LINE_NO:94
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:97
EndFunction

Bool Function IsValidToSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor, conditionform ConditionFormToTest) Global
  Bool returnVal = False ; #DEBUG_LINE_NO:135
  returnVal = DefaultScriptFunctions.CheckForStages(CallingObject, ShowNormalTrace, QuestToSet, PrereqStage, TurnOffStage, TurnOffStageDone) ; #DEBUG_LINE_NO:137
  If returnVal ; #DEBUG_LINE_NO:139
    returnVal = DefaultScriptFunctions.CheckForConditionForm(CallingObject, ShowNormalTrace, ConditionFormToTest) ; #DEBUG_LINE_NO:140
  EndIf ; #DEBUG_LINE_NO:
  If returnVal ; #DEBUG_LINE_NO:143
    returnVal = DefaultScriptFunctions.CheckForAliveActor(CallingObject, ShowNormalTrace, CheckAliveActorOrShip, FailOnDeadActor) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
  If returnVal ; #DEBUG_LINE_NO:147
    returnVal = DefaultScriptFunctions.CheckForReferenceMatches(CallingObject, ShowNormalTrace, RefToCheck, PlayerOnly, ReferencesToCheckAgainst, AliasesToCheckAgainst, FactionsToCheckAgainst) ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
  If returnVal ; #DEBUG_LINE_NO:158
    returnVal = DefaultScriptFunctions.CheckForLocationMatches(CallingObject, ShowNormalTrace, LocationToCheck, LocationToCheckOther, LocationsToCheckAgainst, LocationAliasesToCheckAgainst, LocationMatchIfChild) ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:171
EndFunction

Function SafeSetStage(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int StageToSet) Global
  If QuestToSet as Bool && StageToSet > -1 ; #DEBUG_LINE_NO:177
    QuestToSet.setStage(StageToSet) ; #DEBUG_LINE_NO:178
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function CheckForStages(ScriptObject CallingObject, Bool ShowNormalTrace, Quest QuestToSet, Int PrereqStage, Int TurnOffStage, Int TurnOffStageDone) Global
  Bool returnVal = True ; #DEBUG_LINE_NO:191
  If QuestToSet != None ; #DEBUG_LINE_NO:193
    If PrereqStage > -1 && QuestToSet.GetStagedone(PrereqStage) == False ; #DEBUG_LINE_NO:194
      returnVal = False ; #DEBUG_LINE_NO:196
    ElseIf TurnOffStage > -1 && QuestToSet.GetStage() >= TurnOffStage ; #DEBUG_LINE_NO:197
      returnVal = False ; #DEBUG_LINE_NO:199
    ElseIf TurnOffStageDone > -1 && QuestToSet.GetStagedone(TurnOffStageDone) == True ; #DEBUG_LINE_NO:200
      returnVal = False ; #DEBUG_LINE_NO:202
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:207
EndFunction

Bool Function CheckForConditionForm(ScriptObject CallingObject, Bool ShowNormalTrace, conditionform ConditionFormToTest) Global
  Bool returnVal = (ConditionFormToTest as Bool == False) || ConditionFormToTest.IsTrue(None, None) ; #DEBUG_LINE_NO:214
  Return returnVal ; #DEBUG_LINE_NO:217
EndFunction

Bool Function CheckForAliveActor(ScriptObject CallingObject, Bool ShowNormalTrace, ObjectReference CheckAliveActorOrShip, Bool FailOnDeadActor) Global
  Bool returnVal = FailOnDeadActor == False || CheckAliveActorOrShip == None || DefaultScriptFunctions.IsDead(CheckAliveActorOrShip) == False ; #DEBUG_LINE_NO:227
  Return returnVal ; #DEBUG_LINE_NO:230
EndFunction

Bool Function CheckForReferenceMatches(ScriptObject CallingObject, Bool ShowNormalTrace, ObjectReference RefToCheck, Bool PlayerOnly, ObjectReference[] ReferencesToCheckAgainst, ReferenceAlias[] AliasesToCheckAgainst, Faction[] FactionsToCheckAgainst) Global
  Bool returnVal = False ; #DEBUG_LINE_NO:245
  If PlayerOnly ; #DEBUG_LINE_NO:247
    If (RefToCheck == Game.GetPlayer() as ObjectReference) || (RefToCheck == Game.GetPlayer().GetSpaceShip() as ObjectReference) ; #DEBUG_LINE_NO:248
      returnVal = True ; #DEBUG_LINE_NO:250
    EndIf ; #DEBUG_LINE_NO:
  ElseIf ReferencesToCheckAgainst.Length > 0 || AliasesToCheckAgainst.Length > 0 || FactionsToCheckAgainst.Length > 0 ; #DEBUG_LINE_NO:258
    If commonarrayfunctions.CheckObjectReferenceAgainstArray(RefToCheck, ReferencesToCheckAgainst, False) || commonarrayfunctions.CheckObjectReferenceAgainstReferenceAliasArray(RefToCheck, AliasesToCheckAgainst, False) || commonarrayfunctions.CheckActorAgainstFactionArray(RefToCheck as Actor, FactionsToCheckAgainst, False) ; #DEBUG_LINE_NO:261
      returnVal = True ; #DEBUG_LINE_NO:263
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    returnVal = True ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:275
EndFunction

Bool Function CheckForLocationMatches(ScriptObject CallingObject, Bool ShowNormalTrace, Location LocationToCheck, Location LocationToCheckOther, Location[] LocationsToCheckAgainst, LocationAlias[] LocationAliasesToCheckAgainst, Bool LocationMatchIfChild) Global
  Bool returnVal = False ; #DEBUG_LINE_NO:292
  If LocationsToCheckAgainst.Length > 0 || LocationAliasesToCheckAgainst.Length > 0 ; #DEBUG_LINE_NO:295
    If commonarrayfunctions.CheckLocationAgainstArray(LocationToCheck, LocationsToCheckAgainst, LocationToCheckOther, False, LocationMatchIfChild) || commonarrayfunctions.CheckLocationAgainstLocationAliasArray(LocationToCheck, LocationAliasesToCheckAgainst, LocationToCheckOther, False, LocationMatchIfChild) ; #DEBUG_LINE_NO:298
      returnVal = True ; #DEBUG_LINE_NO:300
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    returnVal = True ; #DEBUG_LINE_NO:309
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:312
EndFunction

Function Trace(ScriptObject CallingObject, String TextToPrint, Bool ShowNormalTrace, String CustomLog) Global
  Debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts", "", 0, False, False, False, True) ; #DEBUG_LINE_NO:316
  If CustomLog != "" ; #DEBUG_LINE_NO:318
    Debug.TraceLog(CallingObject, TextToPrint, CustomLog, "", 0, False, False, False, True) ; #DEBUG_LINE_NO:319
  EndIf ; #DEBUG_LINE_NO:
  If ShowNormalTrace ; #DEBUG_LINE_NO:322
    Debug.Trace((" " + CallingObject as String) + ": " + TextToPrint, 0) ; #DEBUG_LINE_NO:323
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function warning(ScriptObject CallingObject, String TextToPrint, String CustomLog) Global
  Debug.TraceLog(CallingObject, TextToPrint, "DefaultScripts", "", 0, False, True, False, True) ; #DEBUG_LINE_NO:328
  If CustomLog != "" ; #DEBUG_LINE_NO:330
    Debug.TraceLog(CallingObject, TextToPrint, CustomLog, "", 0, False, True, False, True) ; #DEBUG_LINE_NO:331
  EndIf ; #DEBUG_LINE_NO:
EndFunction
