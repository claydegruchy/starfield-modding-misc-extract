ScriptName SQ_ActorRolesScript Extends Quest
{ Parent script for SQ_CompanionsScript, SQ_CrewScript, and SQ_FollowersScript }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Log_Names
  String Property MainLogName Auto Const mandatory
  String Property SubLogName Auto Const mandatory
EndGroup

Group Related_Quests_Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  sq_followersscript Property SQ_Followers Auto Const mandatory
  sq_crewscript Property SQ_Crew Auto Const mandatory
  sq_preventrecalcscript Property SQ_PreventRecalc Auto Const mandatory
  sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
EndGroup

Group Role_Available
  Alias Property Alias_Available Auto Const mandatory
  { can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are available to fill this role (ie could be made active through dialogue, etc.) }
  ActorValue Property AV_Available Auto Const mandatory
  { the actorvalue that will signify that the actor is available to fill this role (ie could be made active through dialogue, etc.) }
  Message Property AvailableMessage Auto Const mandatory
  { message to show when the actor is made available to fill this role (ie has been made available through dialogue, etc.) }
  Message Property NotAvailableMessage Auto Const mandatory
  { message to show when the actor is made no longer available to fill this role (ie has been made not available through dialogue, etc.) }
EndGroup

Group Role_Active
  Alias Property Alias_Active Auto Const mandatory
  { can be a ReferenceAlias or a RefCollectionAlias, will hold actor(s) who are actively filling this role (ie has been made active through dialogue, etc.) }
  ActorValue Property AV_Active Auto Const mandatory
  { the actorvalue that will signify that the actor is actively filling this role (ie has been made active through dialogue, etc.) }
  Message Property ActiveMessage Auto Const mandatory
  { message to show when the actor fills this role (ie has been made active through dialogue, etc.) }
  Message Property NotActiveMessage Auto Const mandatory
  { message to show when the actor no longer fills this role (ie has been made inactive through dialogue, etc.) }
EndGroup

Group TextReplacementAlias
  ReferenceAlias Property Alias_MessageTextReplaceActor Auto Const mandatory
  { alias to be temporarily forced into for using text replacement in messages }
  ReferenceAlias Property Alias_MessageTextReplaceRef Auto Const mandatory
  { alias to be temporarily forced into for using text replacement in messages }
  Keyword Property SQ_ActorRoles_SuppressMessages Auto Const mandatory
  { autofill; if keyword is on actor, it will suppress any messages about them in ShowTextReplacedMessage() }
EndGroup


;-- Functions ---------------------------------------

Function _CustomSetRoleActive(Actor ActorToUpdate, Actor PriorActiveActor)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleAvaliable(Actor ActorToUpdate)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleInactive(Actor ActorToUpdate)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function _CustomSetRoleUnavaliable(Actor ActorToUpdate)
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function SetRoleAvailable(Actor ActorToUpdate, Bool DisplayMessageIfChanged)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Available, True) ; #DEBUG_LINE_NO:61
  Self._UpdateActorValue(ActorToUpdate, AV_Available, True) ; #DEBUG_LINE_NO:62
  If DisplayMessageIfChanged && changed ; #DEBUG_LINE_NO:64
    Self.ShowTextReplacedMessage(ActorToUpdate, AvailableMessage, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  Self._CustomSetRoleAvaliable(ActorToUpdate) ; #DEBUG_LINE_NO:68
  ActorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:70
EndFunction

Function SetRoleUnavailable(Actor ActorToUpdate, Bool DisplayMessageIfChanged)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Available, False) ; #DEBUG_LINE_NO:80
  Self._UpdateActorValue(ActorToUpdate, AV_Available, False) ; #DEBUG_LINE_NO:81
  If DisplayMessageIfChanged && changed ; #DEBUG_LINE_NO:83
    Self.ShowTextReplacedMessage(ActorToUpdate, NotAvailableMessage, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
  Self._CustomSetRoleUnavaliable(ActorToUpdate) ; #DEBUG_LINE_NO:87
  SQ_PreventRecalc.RemoveRef(ActorToUpdate as ObjectReference) ; #DEBUG_LINE_NO:89
  ActorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:91
EndFunction

Function SetRoleActive(Actor ActorToUpdate, Bool DisplayMessageIfChanged, Bool AlsoSetAvailable, Float MessageFloat1, Float MessageFloat2)
  Actor priorActor = None ; #DEBUG_LINE_NO:101
  If Alias_Active is ReferenceAlias ; #DEBUG_LINE_NO:102
    priorActor = Self.GetActiveActor() ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Active, True) ; #DEBUG_LINE_NO:106
  Self._UpdateActorValue(ActorToUpdate, AV_Active, True) ; #DEBUG_LINE_NO:107
  If DisplayMessageIfChanged && changed ; #DEBUG_LINE_NO:109
    Self.ShowTextReplacedMessage(ActorToUpdate, ActiveMessage, False, None, MessageFloat1, MessageFloat2) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
  If AlsoSetAvailable ; #DEBUG_LINE_NO:113
    Self.SetRoleAvailable(ActorToUpdate, False) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
  Self._CustomSetRoleActive(ActorToUpdate, priorActor) ; #DEBUG_LINE_NO:117
  ActorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:119
EndFunction

Function SetRoleInactive(Actor ActorToUpdate, Bool DisplayMessageIfChanged, Bool AlsoSetUnavailable, Bool AlsoDisplayUnavailableMessage)
  Bool changed = Self._UpdateAlias(ActorToUpdate, Alias_Active, False) ; #DEBUG_LINE_NO:130
  Self._UpdateActorValue(ActorToUpdate, AV_Active, False) ; #DEBUG_LINE_NO:131
  If DisplayMessageIfChanged && changed ; #DEBUG_LINE_NO:133
    Self.ShowTextReplacedMessage(ActorToUpdate, NotActiveMessage, False, None, 0.0, 0.0) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If AlsoSetUnavailable ; #DEBUG_LINE_NO:137
    Self.SetRoleUnavailable(ActorToUpdate, AlsoDisplayUnavailableMessage) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  Self._CustomSetRoleInactive(ActorToUpdate) ; #DEBUG_LINE_NO:141
  ActorToUpdate.EvaluatePackage(False) ; #DEBUG_LINE_NO:143
EndFunction

Actor Function GetActiveActor()
  Return Self._GetRoleActor(Alias_Active) ; #DEBUG_LINE_NO:153
EndFunction

Actor[] Function GetActiveActors()
  Return Self._GetRoleActors(Alias_Active) ; #DEBUG_LINE_NO:158
EndFunction

Actor[] Function GetActiveActorsWithKeyword(Keyword KeywordToFind)
  Actor[] actorsToReturn = new Actor[0] ; #DEBUG_LINE_NO:164
  Actor[] activeActors = Self.GetActiveActors() ; #DEBUG_LINE_NO:165
  Int I = 0 ; #DEBUG_LINE_NO:167
  While I < activeActors.Length ; #DEBUG_LINE_NO:168
    If activeActors[I].HasKeyword(KeywordToFind) ; #DEBUG_LINE_NO:169
      actorsToReturn.add(activeActors[I], 1) ; #DEBUG_LINE_NO:170
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:172
  EndWhile ; #DEBUG_LINE_NO:
  Return actorsToReturn ; #DEBUG_LINE_NO:175
EndFunction

Actor Function GetAvailableActor()
  Return Self._GetRoleActor(Alias_Available) ; #DEBUG_LINE_NO:180
EndFunction

Actor[] Function GetAvailableActors()
  Return Self._GetRoleActors(Alias_Available) ; #DEBUG_LINE_NO:185
EndFunction

Actor Function _GetRoleActor(Alias RoleAlias)
  Return Self._GetRoleActors(RoleAlias)[0] ; #DEBUG_LINE_NO:191
EndFunction

Actor[] Function _GetRoleActors(Alias RoleAlias)
  Actor[] roleActors = new Actor[0] ; #DEBUG_LINE_NO:196
  ReferenceAlias refAlias = RoleAlias as ReferenceAlias ; #DEBUG_LINE_NO:198
  If refAlias ; #DEBUG_LINE_NO:199
    roleActors.add(refAlias.GetActorReference(), 1) ; #DEBUG_LINE_NO:200
  Else ; #DEBUG_LINE_NO:
    roleActors = (RoleAlias as RefCollectionAlias).GetActorArray() ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
  Return roleActors ; #DEBUG_LINE_NO:205
EndFunction

Bool Function IsRole(Actor ActorToCheck, Bool IncludeAvailable)
  Return Self.IsRoleActive(ActorToCheck) || IncludeAvailable && Self.IsRoleAvailable(ActorToCheck) ; #DEBUG_LINE_NO:210
EndFunction

Bool Function IsRoleActive(Actor ActorToCheck)
  Return Self._CheckRole(ActorToCheck, Alias_Active) ; #DEBUG_LINE_NO:214
EndFunction

Bool Function IsRoleAvailable(Actor ActorToCheck)
  Return Self._CheckRole(ActorToCheck, Alias_Available) ; #DEBUG_LINE_NO:218
EndFunction

Bool Function _CheckRole(Actor ActorToCheck, Alias AliasToCheck)
  ReferenceAlias refAlias = AliasToCheck as ReferenceAlias ; #DEBUG_LINE_NO:222
  If refAlias as Bool && (refAlias.GetReference() == ActorToCheck as ObjectReference) ; #DEBUG_LINE_NO:224
    Return True ; #DEBUG_LINE_NO:225
  Else ; #DEBUG_LINE_NO:
    RefCollectionAlias RefCollection = AliasToCheck as RefCollectionAlias ; #DEBUG_LINE_NO:227
    If RefCollection as Bool && (AliasToCheck as RefCollectionAlias).Find(ActorToCheck as ObjectReference) >= 0 ; #DEBUG_LINE_NO:228
      Return True ; #DEBUG_LINE_NO:229
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return False ; #DEBUG_LINE_NO:232
EndFunction

Bool Function _UpdateAlias(Actor ActorToUpdate, Alias AliasToUpdate, Bool PutIntoAlias)
  Bool changed = False ; #DEBUG_LINE_NO:244
  RefCollectionAlias refCol = AliasToUpdate as RefCollectionAlias ; #DEBUG_LINE_NO:246
  If refCol ; #DEBUG_LINE_NO:247
    If PutIntoAlias ; #DEBUG_LINE_NO:249
      changed = Self.AddRefWithReturn(refCol, ActorToUpdate as ObjectReference) ; #DEBUG_LINE_NO:252
    Else ; #DEBUG_LINE_NO:
      changed = Self.RemoveREfWithReturn(refCol, ActorToUpdate as ObjectReference) ; #DEBUG_LINE_NO:256
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    ReferenceAlias refAlias = AliasToUpdate as ReferenceAlias ; #DEBUG_LINE_NO:259
    If PutIntoAlias ; #DEBUG_LINE_NO:261
      changed = Self.ForceRefWithReturn(refAlias, ActorToUpdate as ObjectReference) ; #DEBUG_LINE_NO:264
    ElseIf refAlias.GetReference() == ActorToUpdate as ObjectReference ; #DEBUG_LINE_NO:265
      changed = True ; #DEBUG_LINE_NO:266
      refAlias.Clear() ; #DEBUG_LINE_NO:267
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return changed ; #DEBUG_LINE_NO:271
EndFunction

Function _UpdateActorValue(Actor ActorToUpdate, ActorValue ActorValueToUpdate, Bool TurnOn)
  SQ_PreventRecalc.AddRef(ActorToUpdate as ObjectReference) ; #DEBUG_LINE_NO:278
  Int value = 0 ; #DEBUG_LINE_NO:280
  If TurnOn ; #DEBUG_LINE_NO:281
    value = 1 ; #DEBUG_LINE_NO:282
  EndIf ; #DEBUG_LINE_NO:
  ActorToUpdate.SetValue(ActorValueToUpdate, value as Float) ; #DEBUG_LINE_NO:286
EndFunction

Function ShowTextReplacedMessage(Actor MessageTextReplaceActor, Message MessageToShow, Bool ShowAsHelpMessage, ObjectReference MessageTextReplaceRef, Float afArg1, Float afArg2)
  If MessageTextReplaceActor != None ; #DEBUG_LINE_NO:294
    If MessageTextReplaceActor.HasKeyword(SQ_ActorRoles_SuppressMessages) ; #DEBUG_LINE_NO:295
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Alias_MessageTextReplaceActor.ForceRefTo(MessageTextReplaceActor as ObjectReference) ; #DEBUG_LINE_NO:298
      Alias_MessageTextReplaceRef.ForceRefTo(MessageTextReplaceRef) ; #DEBUG_LINE_NO:299
      If ShowAsHelpMessage ; #DEBUG_LINE_NO:301
        Float HelpMessageDuration = 3.0 ; #DEBUG_LINE_NO:302
        Float HelpMessageInterval = 3.0 ; #DEBUG_LINE_NO:303
        Int HelpMessageMaxTimes = 1 ; #DEBUG_LINE_NO:304
        String HelpMessageContext = "" ; #DEBUG_LINE_NO:305
        Int HelpMessagePriority = 0 ; #DEBUG_LINE_NO:306
        MessageToShow.ShowAsHelpMessage("None", HelpMessageDuration, HelpMessageInterval, HelpMessageMaxTimes, HelpMessageContext, HelpMessagePriority, None) ; #DEBUG_LINE_NO:307
      Else ; #DEBUG_LINE_NO:
        MessageToShow.Show(afArg1, afArg2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:309
      EndIf ; #DEBUG_LINE_NO:
      Alias_MessageTextReplaceActor.Clear() ; #DEBUG_LINE_NO:311
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function AddRefWithReturn(RefCollectionAlias refCol, ObjectReference RefToAddIfNotAlreadyPresent)
  Bool found = refCol.Find(RefToAddIfNotAlreadyPresent) >= 0 ; #DEBUG_LINE_NO:328
  If !found ; #DEBUG_LINE_NO:329
    refCol.AddRef(RefToAddIfNotAlreadyPresent) ; #DEBUG_LINE_NO:330
  EndIf ; #DEBUG_LINE_NO:
  Return !found ; #DEBUG_LINE_NO:332
EndFunction

Bool Function RemoveREfWithReturn(RefCollectionAlias refCol, ObjectReference RefToRemoveIfPossible)
  Bool found = refCol.Find(RefToRemoveIfPossible) >= 0 ; #DEBUG_LINE_NO:336
  If found ; #DEBUG_LINE_NO:338
    refCol.RemoveRef(RefToRemoveIfPossible) ; #DEBUG_LINE_NO:339
  EndIf ; #DEBUG_LINE_NO:
  Return found ; #DEBUG_LINE_NO:342
EndFunction

Bool Function ForceRefWithReturn(ReferenceAlias refAlias, ObjectReference RefToForceIfNotAlreadyPresent)
  Bool success = refAlias.GetReference() == RefToForceIfNotAlreadyPresent ; #DEBUG_LINE_NO:346
  success = !success ; #DEBUG_LINE_NO:346
  If success ; #DEBUG_LINE_NO:348
    refAlias.ForceRefTo(RefToForceIfNotAlreadyPresent) ; #DEBUG_LINE_NO:349
  EndIf ; #DEBUG_LINE_NO:
  Return success ; #DEBUG_LINE_NO:352
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Bool returnVal = Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:360
  returnVal = returnVal && Debug.TraceLog(CallingObject, asTextToPrint, "ActorRoles", SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:363
  Return returnVal ; #DEBUG_LINE_NO:365
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Bool returnVal = false ; #DEBUG_LINE_NO:369
  returnVal = returnVal && false ; #DEBUG_LINE_NO:372
  Return returnVal ; #DEBUG_LINE_NO:374
EndFunction
