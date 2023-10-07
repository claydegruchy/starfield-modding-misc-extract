ScriptName RETriggerScript Extends ObjectReference conditional
{ Extends ObjectReference, used to trigger a Wilderness Encounter radiant quest/scene. }

;-- Variables ---------------------------------------
Float TriggerResetTimer = 0.0
Bool keywordsInitialized = False
customlogs:logdatum[] logs

;-- Properties --------------------------------------
Bool Property TriggerOnLoad = True Auto
{ BASEOBJECT: Should this triggerbox be triggered when it loads instead of when the player enters it?
  	depends on EncounterType - see below }
Keyword Property EncounterType Auto Const mandatory
{ BASEOBJECT property - Encounter type keyword to be sent by this trigger
	OVERLAY: triggered OnLoad, with markers inherited by the Overlay itself.
	SCENE: triggered OnLoad, with mainly a static group of markers near the trigger
	TRAVEL: triggered OnTrigger, with widely separated markers (which must not be visible from the trigger)
	CAMP: triggered OnLoad, with markers and static camp clutter
	ASSAULT: triggered OnLoad, building with defensive markers plus distant markers for attackers to spawn at }
Keyword[] Property TriggerKeywords Auto
{ Add keywords you want to add to this trigger.
	Filter for: OETrigger }
reparentscript Property REParent Auto Const mandatory
{ BASEOBJECT property - REParent quest, used to send cleanup custom event }
Int Property EventNum = -1 Auto
{ REFERENCE property OPTIONAL: Used to start specific encounters - sent as aiValue1 }
Bool Property EventNumClearedAfterSpawning = True Auto
{ REFERENCE property OPTIONAL: default = TRUE; if EventNum is used to spawn a specific encounter, should this be cleared so the next time this trigger activates it picks a random one? }
Float Property DaysUntilReset = -1.0 Auto Const
{ REFERENCE property OPTIONAL: if set, Trigger will not allow additional keyword events to fire until game hours specified has passed

Hours and minutes expressed as GameDaysPassed:
Hour: 1/24 = .04167
Minute: 1/(24*60) = .0006945
So to add 4 hours would be (.04167 * 4) = 0.17 }
Int Property myLocationID Auto hidden
Bool Property inStateOff Auto conditional hidden
Bool Property HasBeenInitialized Auto conditional
Quest Property myQuest Auto hidden
String Property LocalScriptName = "RETriggerScript" Auto hidden
String Property MainLogName = "" Auto hidden
String Property SubLogName = "" Auto hidden
Bool Property DebugMode = False Auto hidden
Bool Property TerseLog = False Auto hidden

;-- Functions ---------------------------------------

Event OnInit()
  Self.DefineCustomLogs("") ; #DEBUG_LINE_NO:67
EndEvent

Function InitKeywords()
  If keywordsInitialized == False ; #DEBUG_LINE_NO:71
    keywordsInitialized = True ; #DEBUG_LINE_NO:72
    Int I = 0 ; #DEBUG_LINE_NO:74
    While I < TriggerKeywords.Length ; #DEBUG_LINE_NO:75
      Self.AddKeyword(TriggerKeywords[I]) ; #DEBUG_LINE_NO:76
      I += 1 ; #DEBUG_LINE_NO:77
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartEncounter(Keyword overrideKeyword)
  Self.GoToState("Triggered") ; #DEBUG_LINE_NO:121
  If Self.IsDisabled() ; #DEBUG_LINE_NO:123
    Self.GoToState("On") ; #DEBUG_LINE_NO:125
    Return  ; #DEBUG_LINE_NO:126
  EndIf ; #DEBUG_LINE_NO:
  If DaysUntilReset == -1.0 || Utility.GetCurrentGameTime() >= TriggerResetTimer ; #DEBUG_LINE_NO:133
    Self.InitKeywords() ; #DEBUG_LINE_NO:137
    Keyword storyKeyword = EncounterType ; #DEBUG_LINE_NO:142
    If overrideKeyword ; #DEBUG_LINE_NO:143
      storyKeyword = overrideKeyword ; #DEBUG_LINE_NO:144
    EndIf ; #DEBUG_LINE_NO:
    Quest[] startedQuests = storyKeyword.SendStoryEventAndWait(Self.GetCurrentLocation(), Self as ObjectReference, None, myLocationID, EventNum) ; #DEBUG_LINE_NO:149
    If startedQuests.Length == 0 ; #DEBUG_LINE_NO:150
      Self.GoToState("On") ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
    If EventNumClearedAfterSpawning == True ; #DEBUG_LINE_NO:156
      EventNum = -1 ; #DEBUG_LINE_NO:158
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function QuestStarted(rescript akQuest)
  HasBeenInitialized = True ; #DEBUG_LINE_NO:167
  Bool pResetTimer = False ; #DEBUG_LINE_NO:168
  pResetTimer = akQuest.SetResetTimer ; #DEBUG_LINE_NO:173
  If DaysUntilReset > -1.0 && pResetTimer ; #DEBUG_LINE_NO:178
    TriggerResetTimer = Utility.GetCurrentGameTime() + DaysUntilReset ; #DEBUG_LINE_NO:179
  EndIf ; #DEBUG_LINE_NO:
  Self.GoToState("Off") ; #DEBUG_LINE_NO:182
EndFunction

Function ReArmTrigger()
  Self.GoToState("On") ; #DEBUG_LINE_NO:187
EndFunction

Function DefineCustomLogs(String akLocalScriptName)
  logs = new customlogs:logdatum[0] ; #DEBUG_LINE_NO:198
  If akLocalScriptName != "" ; #DEBUG_LINE_NO:200
    LocalScriptName = akLocalScriptName ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  MainLogName = LocalScriptName ; #DEBUG_LINE_NO:205
  customlogs.AddCustomLog(logs, MainLogName, SubLogName, True, True, "", True) ; #DEBUG_LINE_NO:206
EndFunction

Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity)
  customlogs.Trace(logs, CallingObject, asTextToPrint, aiSeverity) ; #DEBUG_LINE_NO:212
EndFunction

Function warning(ScriptObject CallingObject, String asTextToPrint, Bool DebugTrace, Int aiSeverity, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  customlogs.warning(logs, CallingObject, asTextToPrint) ; #DEBUG_LINE_NO:216
EndFunction

;-- State -------------------------------------------
State Off

  Event OnEndState(String asNewState)
    inStateOff = False ; #DEBUG_LINE_NO:
  EndEvent

  Event OnBeginState(String asOldState)
    inStateOff = True ; #DEBUG_LINE_NO:86
  EndEvent
EndState

;-- State -------------------------------------------
Auto State On

  Event OnCellLoad()
    REParent.SendCleanupEvent() ; #DEBUG_LINE_NO:
    If TriggerOnLoad ; #DEBUG_LINE_NO:
      Self.StartEncounter(None) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnTriggerEnter(ObjectReference akActionRef)
    If TriggerOnLoad == False && (akActionRef == Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:102
      Self.StartEncounter(None) ; #DEBUG_LINE_NO:103
    EndIf ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
State Triggered
EndState
