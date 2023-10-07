ScriptName REScript Extends Quest
{ Extends Quest. Used for Random Encounter quests, has common properties, functions, etc. }

;-- Structs -----------------------------------------
Struct DeadCount
  Int groupSize
  Int stageToSet
  String description
  Int currentCount
EndStruct


;-- Variables ---------------------------------------
customlogs:logdatum[] logs
Int startupTimerID = 99 Const
Float startupTimerLength = 30.0 Const

;-- Properties --------------------------------------
Group Registration
  ReferenceAlias[] Property RegisteredAliases Auto hidden
  { leave empty - this will get filled in at runtime }
  RefCollectionAlias[] Property RegisteredCollectionAliases Auto hidden
  { leave empty - this will get filled in at runtime }
  Bool Property StopQuestWhenAliasesUnloaded = False Auto
  { Default = true, once all the aliases are unloaded, the quest should stop }
  Bool Property StopQuestWhenAliasesDead = False Auto
  { Default = false, once all the aliases are dead, the quest should stop }
  Bool Property StopQuestWhenPlayerLeavesPlanet = True Auto
  { Default = true, once player is not on planet, quest should stop }
  Int Property StopStage = -1 Auto Const
  { optional - if left at -1, Stop will be called on the quest; otherwise, this stage will be set when the quest wants to "Stop"
		this is for special cases where you actually need the quest to stay running }
EndGroup

Group Cooldown
  GlobalVariable Property CooldownTimestamp Auto Const
  { OPTIONAL - if provided, this will be set with the timestamp of gameDaysPassed + cooldownHours when the player encounters this RE }
  Float Property cooldownHours = 24.0 Auto
  { how many hours to add to current time when CooldownTimestamp is set? }
  Bool Property setCooldownOnLoad = True Auto Const
  { default - set cooldown when trigger loads 
		if you set this to false, quest will need to call SetCooldown() from a quest stage }
EndGroup

Group Timers
  Int[] Property TimerStages Auto Const
  { quest stages when the timer with ID matching the array index is received
	for example, if you start timer 0, the stage in TimerStages[0] will be set when that timer expires }
  Bool Property SetResetTimer = True Auto Const
  { Should this quest set the Reset Timer on the RETriggerScript }
EndGroup

Group Traces_Settings
{ Trace Severity adjusts how many things are output to the log: ... Genesis\Build\PC\Logs\Script\User }
  Bool Property ShowTraces = True Auto Const
  { If set to FALSE, all other Trace options are ignored. }
  Bool Property TerseLog = True Auto Const
  { If set to TRUE, minimizes the output to the log for each printed line. }
  Bool Property DebugMode = True Auto Const
  { When True = DebugMode Active. Adds verbose and thorough debugging traces when other Trace settings permit them.
	e.g. if you have Traces turned off for Objects, DebugMode wouldn't display extra Debug data about Objects even if DebugMode was on. }
EndGroup

Group Log_Names
  String Property LocalScriptName = "REScript" Auto
  { This should remain as-is for log purposes. This is used to provide you with a more succinct log print-out. }
  String Property MainLogName = "OverlayEncounters" Auto Const
  { OPTIONAL: Modify with your specific OE Name, if desired. This is the name of your log in Genesis\Build\PC\Logs\Script\User }
  String Property SubLogName = "Warnings" Auto Const
  { OPTIONAL: Leave as Warnings -- this appends to the MainLogName with its own file for serious issues. }
EndGroup

reparentscript Property RE_Parent Auto Const mandatory
{ MANDATORY: All RExx quests must set this property. Pointer to REParentScript on REParent Quest }
retriggerscript Property myTrigger Auto hidden
{ The trigger associated with this RE. }
ReferenceAlias Property MapMarker Auto Const
{ OPTIONAL: map marker }
rescript:deadcount[] Property DeadCountGroups Auto
{ OPTIONAL: used to track dead counts of multiple groups for quest purposes
  If using, set up this array with the data for each group:
	groupSize: total number of actors in group
	stageToSet: quest stage to set when dead count reaches groupSize
	description: Optional - description of each group }
Bool Property bFinishedOnStoryEvent = False Auto hidden

;-- Functions ---------------------------------------

Function RegisterAlias(ReferenceAlias newAlias)
  If !RegisteredAliases ; #DEBUG_LINE_NO:104
    RegisteredAliases = new ReferenceAlias[0] ; #DEBUG_LINE_NO:106
  EndIf ; #DEBUG_LINE_NO:
  RegisteredAliases.add(newAlias, 1) ; #DEBUG_LINE_NO:108
EndFunction

Function RegisterCollectionAlias(RefCollectionAlias newCollectionAlias)
  If !RegisteredCollectionAliases ; #DEBUG_LINE_NO:113
    RegisteredCollectionAliases = new RefCollectionAlias[0] ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
  RegisteredCollectionAliases.add(newCollectionAlias, 1) ; #DEBUG_LINE_NO:117
EndFunction

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, Int aiValue1, Int aiValue2)
  myTrigger = akRef1 as retriggerscript ; #DEBUG_LINE_NO:125
  Self.SetTrigger(myTrigger) ; #DEBUG_LINE_NO:126
  bFinishedOnStoryEvent = True ; #DEBUG_LINE_NO:129
EndEvent

Event OnQuestStarted()
  If Self as oescript ; #DEBUG_LINE_NO:136
    LocalScriptName = "oescript" ; #DEBUG_LINE_NO:137
  EndIf ; #DEBUG_LINE_NO:
  Self.DefineCustomLogs() ; #DEBUG_LINE_NO:140
  Int failsafeCounter = 20 ; #DEBUG_LINE_NO:144
  While bFinishedOnStoryEvent == False && failsafeCounter > 0 ; #DEBUG_LINE_NO:145
    Utility.wait(0.100000001) ; #DEBUG_LINE_NO:147
    failsafeCounter -= 1 ; #DEBUG_LINE_NO:148
  EndWhile ; #DEBUG_LINE_NO:
  Self.StartTimer(startupTimerLength, startupTimerID) ; #DEBUG_LINE_NO:152
  RE_Parent.UpdateGlobalCooldown() ; #DEBUG_LINE_NO:156
  If (setCooldownOnLoad && myTrigger as Bool) && myTrigger.Is3DLoaded() ; #DEBUG_LINE_NO:158
    Self.SetCooldown() ; #DEBUG_LINE_NO:159
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetTrigger(retriggerscript akTrigger)
  myTrigger = akTrigger ; #DEBUG_LINE_NO:164
  If myTrigger ; #DEBUG_LINE_NO:166
    myTrigger.QuestStarted(Self) ; #DEBUG_LINE_NO:168
    If setCooldownOnLoad ; #DEBUG_LINE_NO:169
      Self.RegisterForRemoteEvent(myTrigger as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:171
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetCooldown()
  If CooldownTimestamp ; #DEBUG_LINE_NO:178
    Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:179
    Float cooldownDays = cooldownHours / 24.0 ; #DEBUG_LINE_NO:180
    CooldownTimestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSource)
  If setCooldownOnLoad ; #DEBUG_LINE_NO:187
    Self.SetCooldown() ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartTimerForTimerStage(Float timerSeconds, Int aiTimerID)
  Self.StartTimer(timerSeconds, aiTimerID) ; #DEBUG_LINE_NO:195
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == startupTimerID ; #DEBUG_LINE_NO:200
    Self.RegisterForCustomEvent(RE_Parent as ScriptObject, "reparentscript_RECheckForCleanup") ; #DEBUG_LINE_NO:202
  Else ; #DEBUG_LINE_NO:
    Self.CheckForTimerStage(aiTimerID) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTimerGameTime(Int aiTimerID)
  Self.CheckForTimerStage(aiTimerID) ; #DEBUG_LINE_NO:210
EndEvent

Function CheckForTimerStage(Int aiTimerID)
  If (Self.IsRunning() && TimerStages as Bool) && aiTimerID < TimerStages.Length ; #DEBUG_LINE_NO:216
    Self.SetStage(TimerStages[aiTimerID]) ; #DEBUG_LINE_NO:219
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event REParentScript.RECheckForCleanup(reparentscript akSender, Var[] akArgs)
  Self.CheckForCleanup() ; #DEBUG_LINE_NO:226
EndEvent

Function CheckForCleanup()
  Bool shouldShutDown = False ; #DEBUG_LINE_NO:230
  If StopQuestWhenPlayerLeavesPlanet ; #DEBUG_LINE_NO:232
    If myTrigger as Bool && myTrigger.GetCurrentPlanet() != Game.GetPlayer().GetCurrentPlanet() ; #DEBUG_LINE_NO:233
      shouldShutDown = True ; #DEBUG_LINE_NO:235
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If shouldShutDown == False && (StopQuestWhenAliasesUnloaded || StopQuestWhenAliasesDead) ; #DEBUG_LINE_NO:240
    Int iDeadCount = 0 ; #DEBUG_LINE_NO:243
    Int iUnloadedCount = 0 ; #DEBUG_LINE_NO:244
    Int iCollectionIndex = 0 ; #DEBUG_LINE_NO:247
    Int iCollectionRefCount = 0 ; #DEBUG_LINE_NO:249
    Int registeredRefCollectionCount = RegisteredCollectionAliases.Length ; #DEBUG_LINE_NO:250
    While iCollectionIndex < registeredRefCollectionCount ; #DEBUG_LINE_NO:251
      RefCollectionAlias registeredCollection = RegisteredCollectionAliases[iCollectionIndex] ; #DEBUG_LINE_NO:253
      Int I = 0 ; #DEBUG_LINE_NO:254
      iCollectionRefCount += registeredCollection.GetCount() ; #DEBUG_LINE_NO:256
      While I < registeredCollection.GetCount() ; #DEBUG_LINE_NO:257
        ObjectReference myRef = RegisteredCollectionAliases[iCollectionIndex].GetAt(I) ; #DEBUG_LINE_NO:258
        Actor myActor = myRef as Actor ; #DEBUG_LINE_NO:259
        spaceshipreference myShip = myRef as spaceshipreference ; #DEBUG_LINE_NO:260
        If myActor ; #DEBUG_LINE_NO:262
          If myActor.IsDead() || myActor.IsInFaction(RE_Parent.REIgnoreForCleanup) ; #DEBUG_LINE_NO:263
            iDeadCount += 1 ; #DEBUG_LINE_NO:264
          EndIf ; #DEBUG_LINE_NO:
        ElseIf myShip ; #DEBUG_LINE_NO:
          If myShip.IsDead() || myShip.IsInFaction(RE_Parent.REIgnoreForCleanup) ; #DEBUG_LINE_NO:269
            iDeadCount += 1 ; #DEBUG_LINE_NO:270
          EndIf ; #DEBUG_LINE_NO:
        EndIf ; #DEBUG_LINE_NO:
        If !myRef.Is3DLoaded() || (myActor as Bool && myActor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myShip as Bool && myShip.IsInFaction(RE_Parent.REIgnoreForCleanup)) ; #DEBUG_LINE_NO:276
          iUnloadedCount += 1 ; #DEBUG_LINE_NO:277
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:279
      EndWhile ; #DEBUG_LINE_NO:
      iCollectionIndex += 1 ; #DEBUG_LINE_NO:281
    EndWhile ; #DEBUG_LINE_NO:
    Int iAliasIndex = 0 ; #DEBUG_LINE_NO:285
    Int registeredAliasCount = RegisteredAliases.Length ; #DEBUG_LINE_NO:286
    While iAliasIndex < registeredAliasCount ; #DEBUG_LINE_NO:287
      ObjectReference myref = RegisteredAliases[iAliasIndex].GetRef() ; #DEBUG_LINE_NO:289
      Actor myactor = myref as Actor ; #DEBUG_LINE_NO:290
      spaceshipreference myship = myref as spaceshipreference ; #DEBUG_LINE_NO:291
      If myactor ; #DEBUG_LINE_NO:293
        If myactor.IsDead() || myactor.IsInFaction(RE_Parent.REIgnoreForCleanup) ; #DEBUG_LINE_NO:294
          iDeadCount += 1 ; #DEBUG_LINE_NO:295
        EndIf ; #DEBUG_LINE_NO:
      ElseIf myship ; #DEBUG_LINE_NO:
        If myship.IsDead() || myship.IsInFaction(RE_Parent.REIgnoreForCleanup) ; #DEBUG_LINE_NO:300
          iDeadCount += 1 ; #DEBUG_LINE_NO:301
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If !myref.Is3DLoaded() || (myactor as Bool && myactor.IsInFaction(RE_Parent.REIgnoreForCleanup)) || (myship as Bool && myship.IsInFaction(RE_Parent.REIgnoreForCleanup)) ; #DEBUG_LINE_NO:306
        iUnloadedCount += 1 ; #DEBUG_LINE_NO:307
      EndIf ; #DEBUG_LINE_NO:
      iAliasIndex += 1 ; #DEBUG_LINE_NO:309
    EndWhile ; #DEBUG_LINE_NO:
    Int registeredRefCount = registeredAliasCount + iCollectionRefCount ; #DEBUG_LINE_NO:312
    If StopQuestWhenAliasesDead && iDeadCount >= registeredRefCount ; #DEBUG_LINE_NO:314
      shouldShutDown = True ; #DEBUG_LINE_NO:316
    EndIf ; #DEBUG_LINE_NO:
    If StopQuestWhenAliasesUnloaded && iUnloadedCount >= registeredRefCount ; #DEBUG_LINE_NO:318
      shouldShutDown = True ; #DEBUG_LINE_NO:320
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If shouldShutDown ; #DEBUG_LINE_NO:326
    Self.Shutdown() ; #DEBUG_LINE_NO:327
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Shutdown()
  If StopStage > -1 ; #DEBUG_LINE_NO:333
    Self.SetStage(StopStage) ; #DEBUG_LINE_NO:335
  Else ; #DEBUG_LINE_NO:
    Self.Stop() ; #DEBUG_LINE_NO:338
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function IncrementDeadCount(Int aiGroupIndex)
  DeadCountGroups[aiGroupIndex].currentCount = DeadCountGroups[aiGroupIndex].currentCount + 1 ; #DEBUG_LINE_NO:343
  If DeadCountGroups[aiGroupIndex].currentCount >= DeadCountGroups[aiGroupIndex].groupSize ; #DEBUG_LINE_NO:344
    Self.SetStage(DeadCountGroups[aiGroupIndex].stageToSet) ; #DEBUG_LINE_NO:345
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetDeadCounts(Int index, Int newValue)
  DeadCountGroups[index].groupSize = newValue ; #DEBUG_LINE_NO:350
  If DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize ; #DEBUG_LINE_NO:351
    Self.SetStage(DeadCountGroups[index].stageToSet) ; #DEBUG_LINE_NO:352
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function AdjustDeadCounts(Int index, Int newValue)
  DeadCountGroups[index].groupSize = DeadCountGroups[index].groupSize + newValue ; #DEBUG_LINE_NO:357
  If DeadCountGroups[index].currentCount >= DeadCountGroups[index].groupSize ; #DEBUG_LINE_NO:358
    Self.SetStage(DeadCountGroups[index].stageToSet) ; #DEBUG_LINE_NO:359
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateDeadCountGroupSize(Int groupIndex, Int newSize)
  DeadCountGroups[groupIndex].groupSize = newSize ; #DEBUG_LINE_NO:364
EndFunction

Function EnableMapMarker()
  If MapMarker ; #DEBUG_LINE_NO:368
    MapMarker.TryToEnable() ; #DEBUG_LINE_NO:369
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function DefineCustomLogs()
  logs = new customlogs:logdatum[0] ; #DEBUG_LINE_NO:380
  customlogs.AddCustomLog(logs, MainLogName, SubLogName, !TerseLog, True, LocalScriptName, DebugMode) ; #DEBUG_LINE_NO:385,382
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:393
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint) ; #DEBUG_LINE_NO:397
EndFunction
