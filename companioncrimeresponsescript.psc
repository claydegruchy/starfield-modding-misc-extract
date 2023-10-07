ScriptName CompanionCrimeResponseScript Extends Actor
{ handles having the companion bail on combat with people they consider civilians and respond to player killing them as murder

***REMINDERS
all actors with this script MUST have their own "personal crime faction" faction that has a shared crime faction list of factions they consider "civilians" }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  Faction Property CurrentCompanionFaction Auto Const mandatory
  GlobalVariable Property COM_AngerReason_Common_1_Murder Auto Const mandatory
  Keyword Property COM_NotCivilian Auto Const mandatory
  ActorValue Property Aggression Auto Const mandatory
  ActorValue Property Assistance Auto Const mandatory
EndGroup

Group Properties
  affinityevent Property AffinityEventOnCombat Auto Const mandatory
  { filter for: COM_Event_Action_CivilianCombat }
  affinityevent Property AffinityEventOnKill Auto Const mandatory
  { filter for: COM_Event_Action_CivilianKilled }
  Faction[] Property IgnoreSharedCrimeForAnyoneInTheseFactions Auto Const
  { Even if the companion would help them because they are in his shared crime list, ignore it if they are in this faction. }
EndGroup


;-- Functions ---------------------------------------

Event OnLoad()
  Self.RegisterForEvents() ; #DEBUG_LINE_NO:35
EndEvent

Event OnUnload()
  Self.UnregisterForEvents() ; #DEBUG_LINE_NO:39
EndEvent

Function RegisterForEvents()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor") ; #DEBUG_LINE_NO:45
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerMurderActor") ; #DEBUG_LINE_NO:46
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:47
EndFunction

Function UnregisterForEvents()
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerAssaultActor") ; #DEBUG_LINE_NO:52
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnPlayerMurderActor") ; #DEBUG_LINE_NO:53
  Self.UnregisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnCombatStateChanged") ; #DEBUG_LINE_NO:54
EndFunction

Bool Function AmIHere()
  Return Self.Is3DLoaded() ; #DEBUG_LINE_NO:58
EndFunction

Bool Function AmIAngry()
  Bool returnVal = SQ_Companions.GetAngerLevel(Self as Actor).GetValue() >= SQ_Companions.COM_AngerLevel_2_Angry.GetValue() ; #DEBUG_LINE_NO:63
  Return returnVal ; #DEBUG_LINE_NO:67
EndFunction

Function ProcessCombatantsForCrimeFactionAnger(Bool TestMyCombatTargets)
  If Self.AmIAngry() ; #DEBUG_LINE_NO:75
    Return  ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
  Faction myCrimeFaction = Self.GetCrimeFaction() ; #DEBUG_LINE_NO:81
  Actor ActorWhoseCombatantTargetsToTest = Game.GetPlayer() ; #DEBUG_LINE_NO:84
  If TestMyCombatTargets ; #DEBUG_LINE_NO:85
    ActorWhoseCombatantTargetsToTest = Self as Actor ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
  Actor[] combatants = ActorWhoseCombatantTargetsToTest.GetAllCombatTargets() ; #DEBUG_LINE_NO:91
  Int I = 0 ; #DEBUG_LINE_NO:95
  Int max = combatants.Length ; #DEBUG_LINE_NO:96
  While I < max ; #DEBUG_LINE_NO:97
    Self.ProcessCrimeFactionAnger(combatants[I], myCrimeFaction, True) ; #DEBUG_LINE_NO:98
    I += 1 ; #DEBUG_LINE_NO:100
  EndWhile ; #DEBUG_LINE_NO:
  If TestMyCombatTargets == False && myCrimeFaction.IsPlayerEnemy() == False ; #DEBUG_LINE_NO:103
    Self.ProcessCombatantsForCrimeFactionAnger(True) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ProcessCrimeFactionAnger(Actor ActorToTest, Faction myCrimeFaction, Bool SkipLockedInCompanionCheck)
  Faction actorToTestCrimeFaction = ActorToTest.GetCrimeFaction() ; #DEBUG_LINE_NO:114
  If actorToTestCrimeFaction as Bool && actorToTestCrimeFaction.IsPlayerEnemy() ; #DEBUG_LINE_NO:118
    If myCrimeFaction.IsFactionInCrimeGroup(actorToTestCrimeFaction) && commonarrayfunctions.CheckActorAgainstFactionArray(ActorToTest, IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False ; #DEBUG_LINE_NO:122
      Self.CivilianCombat(ActorToTest) ; #DEBUG_LINE_NO:127
      Return  ; #DEBUG_LINE_NO:129
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Actor.OnCombatStateChanged(Actor akSender, ObjectReference akTarget, Int aeCombatState)
  If Self.AmIHere() == False ; #DEBUG_LINE_NO:137
    Return  ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If aeCombatState > 0 ; #DEBUG_LINE_NO:143
    Self.ProcessCombatantsForCrimeFactionAnger(False) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerAssaultActor(Actor akSender, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If Self.AmIHere() == False ; #DEBUG_LINE_NO:149
    Return  ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
  Actor victimActor = akVictim as Actor ; #DEBUG_LINE_NO:154
  If Self.IsValidCrimeVictim(victimActor) ; #DEBUG_LINE_NO:155
    Self.CivilianCombat(victimActor) ; #DEBUG_LINE_NO:156
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerMurderActor(Actor akSender, ObjectReference akVictim, Location akLocation, Bool aeCrime)
  If Self.AmIHere() == False ; #DEBUG_LINE_NO:161
    Return  ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
  Actor victimActor = akVictim as Actor ; #DEBUG_LINE_NO:166
  If Self.IsValidCrimeVictim(victimActor) ; #DEBUG_LINE_NO:167
    Self.CivilianKilled(victimActor) ; #DEBUG_LINE_NO:168
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function IsValidCrimeVictim(Actor ActorToCheck)
  Bool returnVal = False ; #DEBUG_LINE_NO:175
  If ActorToCheck as Bool && Self.AmIHere() ; #DEBUG_LINE_NO:177
    Faction myCrimeFaction = Self.GetCrimeFaction() ; #DEBUG_LINE_NO:178
    Faction ActorToCheckCrimeFaction = ActorToCheck.GetCrimeFaction() ; #DEBUG_LINE_NO:179
    Bool isInSharedCrimeFaction = myCrimeFaction.IsFactionInCrimeGroup(ActorToCheckCrimeFaction) ; #DEBUG_LINE_NO:180
    If isInSharedCrimeFaction ; #DEBUG_LINE_NO:183
      Bool isActorValidCrimeVictim = ActorToCheck.HasKeyword(COM_NotCivilian) == False && commonarrayfunctions.CheckActorAgainstFactionArray(ActorToCheck, IgnoreSharedCrimeForAnyoneInTheseFactions, False) == False ; #DEBUG_LINE_NO:184
      If isActorValidCrimeVictim ; #DEBUG_LINE_NO:188
        returnVal = True ; #DEBUG_LINE_NO:190
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return returnVal ; #DEBUG_LINE_NO:197
EndFunction

Function CivilianCombat(Actor CivilianActor)
  Self.Pacify() ; #DEBUG_LINE_NO:202
  AffinityEventOnCombat.Send(CivilianActor as ObjectReference) ; #DEBUG_LINE_NO:203
  Self.AutoDismiss() ; #DEBUG_LINE_NO:204
EndFunction

Function CivilianKilled(Actor CivilianActor)
  Self.Pacify() ; #DEBUG_LINE_NO:209
  AffinityEventOnKill.Send(CivilianActor as ObjectReference) ; #DEBUG_LINE_NO:210
  Self.ProcessCrimeFactionAnger(CivilianActor, Self.GetCrimeFaction(), False) ; #DEBUG_LINE_NO:212
EndFunction

Function AutoDismiss()
  If SQ_Companions.IsCompanionLockedIn((Self as Actor) as companionactorscript) ; #DEBUG_LINE_NO:217
     ; #DEBUG_LINE_NO:
  ElseIf SQ_Companions.IsRoleActive(Self as Actor) ; #DEBUG_LINE_NO:219
    SQ_Companions.SetRoleInactive(Self as Actor, True, False, True) ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Bool Function TestForLockedInCompanion()
  Bool returnVal = False ; #DEBUG_LINE_NO:225
  companionactorscript companion = (Self as Actor) as companionactorscript ; #DEBUG_LINE_NO:227
  returnVal = companion as Bool && SQ_Companions.IsCompanionLockedIn(companion) ; #DEBUG_LINE_NO:228
  Return returnVal ; #DEBUG_LINE_NO:231
EndFunction

Function Pacify()
  Self.StopCombat() ; #DEBUG_LINE_NO:237
  Self.StopCombatAlarm() ; #DEBUG_LINE_NO:238
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:249
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:253
EndFunction
