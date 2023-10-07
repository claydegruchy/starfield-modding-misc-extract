ScriptName OE_CiviliansScript Extends Quest

;-- Variables ---------------------------------------
retriggerscript triggerRef

;-- Properties --------------------------------------
Group RQ_Settlement
  Keyword Property RQSettlementEvent Auto Const mandatory
  { story event to send to try to start a settlement RQ - send after NPCs are spawned }
  ReferenceAlias Property Trigger Auto Const mandatory
  LocationAlias Property OE_Location Auto Const mandatory
  Quest Property settlementQuest Auto hidden
  { if a settlement RQ starts, hang on to it here }
EndGroup

Group missionBoardData
  LocationRefType Property Mission_CargoDestinationLocRefType Auto Const mandatory
  { check location for this ref type - if it has one, make it a cargo destination }
  Keyword Property Mission_CargoDestination Auto Const mandatory
  { tag cargo destination locations when OE_Civilian starts }
  LocationRefType Property Mission_PassengerDestinationLocRefType Auto Const mandatory
  { check location for this ref type - if it has one, make it a passenger destination }
  Keyword Property Mission_PassengerDestination Auto Const mandatory
  { tag passenger destination locations when OE_Civilian starts }
EndGroup

sq_parentscript Property SQ_Parent Auto Const mandatory
RefCollectionAlias Property MissionTerminals Auto Const mandatory
ReferenceAlias Property NPC_Leader Auto Const mandatory
ReferenceAlias Property NPC_Merchant Auto Const mandatory
Keyword Property OE_Civilians_MissionTerminalAvailable Auto Const mandatory
Keyword Property VendorContainerKeyword01 Auto Const mandatory
RefCollectionAlias Property LivingAreas Auto Const mandatory
Keyword Property OE_Civilians_LinkLivingArea Auto Const mandatory
RefCollectionAlias Property NPCs_All Auto Const mandatory
{ put all NPCs into this collection after spawning }
RefCollectionAlias[] Property NPC_Collections Auto Const mandatory
{ array of all ref collections that NPCs are spawned into }
ActorValue Property OE_Civilian_NightShift Auto Const mandatory
{ autofill - use to tag "night shift" civilians for package schedule }
ActorValue Property OE_Civilians_DIAL_LeaderGender Auto Const mandatory
{ autofill - use to tag Merchant with leader's gender }
Int Property SpawnStage = 10 Auto Const
{ stage to set when ready to spawn NPCs }
Keyword Property SQ_TreasureMap_CreateMapStoryEvent Auto Const mandatory
{ story event to send to try to place treasure maps for sale by vendor }
GlobalVariable Property SQ_TreasureMap_CreateAny Auto Const mandatory
{ holds value for story manager to create any type of treasure map (99) }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Self.RegisterForRemoteEvent(MissionTerminals as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:65
  Self.RegisterForRemoteEvent(NPC_Leader as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:66
  Self.RegisterForRemoteEvent(Trigger as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:67
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:70
  Self.RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns as ScriptObject, "defaultgroupspawnquestscript_SpawnGroupDoneEvent") ; #DEBUG_LINE_NO:71
  Self.SetStage(SpawnStage) ; #DEBUG_LINE_NO:74
  triggerRef = Trigger.GetRef() as retriggerscript ; #DEBUG_LINE_NO:77
EndEvent

Event RefCollectionAlias.OnAliasChanged(RefCollectionAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.CheckAndAddKeyword() ; #DEBUG_LINE_NO:82
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  Self.CheckAndAddKeyword() ; #DEBUG_LINE_NO:87
EndEvent

Event ReferenceAlias.OnLoad(ReferenceAlias akSender)
  If akSender == Trigger && settlementQuest == None ; #DEBUG_LINE_NO:91
    Self.StartRQ() ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function CheckAndAddKeyword()
  ObjectReference LeaderRef = NPC_Leader.GetReference() ; #DEBUG_LINE_NO:99
  If MissionTerminals.GetCount() > 0 && LeaderRef as Bool ; #DEBUG_LINE_NO:103
    LeaderRef.AddKeyword(OE_Civilians_MissionTerminalAvailable) ; #DEBUG_LINE_NO:105
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function SetupSpawnedNPCs()
  Int I = 0 ; #DEBUG_LINE_NO:111
  While I < NPC_Collections.Length ; #DEBUG_LINE_NO:112
    RefCollectionAlias SpawnCollection = NPC_Collections[I] ; #DEBUG_LINE_NO:114
    NPCs_All.AddRefCollection(SpawnCollection) ; #DEBUG_LINE_NO:116
    I += 1 ; #DEBUG_LINE_NO:117
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference[] spawnArray = NPCs_All.GetArray() ; #DEBUG_LINE_NO:121
  I = 0 ; #DEBUG_LINE_NO:123
  Bool nightShiftToggle = False ; #DEBUG_LINE_NO:124
  Int livingAreasIndex = 0 ; #DEBUG_LINE_NO:125
  While I < spawnArray.Length ; #DEBUG_LINE_NO:127
    ObjectReference theNPC = spawnArray[I] ; #DEBUG_LINE_NO:128
    If nightShiftToggle ; #DEBUG_LINE_NO:131
      theNPC.SetValue(OE_Civilian_NightShift, 1.0) ; #DEBUG_LINE_NO:133
    EndIf ; #DEBUG_LINE_NO:
    nightShiftToggle = !nightShiftToggle ; #DEBUG_LINE_NO:135
    theNPC.SetLinkedRef(LivingAreas.GetAt(livingAreasIndex), OE_Civilians_LinkLivingArea, False) ; #DEBUG_LINE_NO:139
    livingAreasIndex += 1 ; #DEBUG_LINE_NO:140
    If livingAreasIndex >= LivingAreas.GetCount() ; #DEBUG_LINE_NO:141
      livingAreasIndex = 0 ; #DEBUG_LINE_NO:142
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:145
  EndWhile ; #DEBUG_LINE_NO:
  Actor merchantRef = NPC_Merchant.GetActorRef() ; #DEBUG_LINE_NO:149
  Actor LeaderRef = NPC_Leader.GetActorRef() ; #DEBUG_LINE_NO:150
  If merchantRef as Bool && LeaderRef as Bool ; #DEBUG_LINE_NO:152
    ActorBase leaderBase = LeaderRef.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:153
    If leaderBase ; #DEBUG_LINE_NO:154
      LeaderRef.SetValue(OE_Civilians_DIAL_LeaderGender, leaderBase.GetSex() as Float) ; #DEBUG_LINE_NO:155
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:163
  If DefaultGroupSpawnQuestScriptIns.GroupSetupCompleted ; #DEBUG_LINE_NO:164
    Location myLocation = OE_Location.GetLocation() ; #DEBUG_LINE_NO:167
    Self.StartRQ() ; #DEBUG_LINE_NO:171
    Actor merchantRef = NPC_Merchant.GetActorRef() ; #DEBUG_LINE_NO:174
    If merchantRef ; #DEBUG_LINE_NO:175
      ObjectReference vendorContainer = merchantRef.GetLinkedRef(VendorContainerKeyword01) ; #DEBUG_LINE_NO:177
      If vendorContainer ; #DEBUG_LINE_NO:178
        SQ_TreasureMap_CreateMapStoryEvent.SendStoryEvent(myLocation, vendorContainer, None, SQ_TreasureMap_CreateAny.GetValueInt(), 0) ; #DEBUG_LINE_NO:179
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.SetupSpawnedNPCs() ; #DEBUG_LINE_NO:184
    If SQ_Parent.VisibleOnStarmap(myLocation) ; #DEBUG_LINE_NO:187
      If myLocation.HasRefType(Mission_CargoDestinationLocRefType) ; #DEBUG_LINE_NO:188
        myLocation.AddKeyword(Mission_CargoDestination) ; #DEBUG_LINE_NO:190
      EndIf ; #DEBUG_LINE_NO:
      If myLocation.HasRefType(Mission_PassengerDestinationLocRefType) ; #DEBUG_LINE_NO:193
        myLocation.AddKeyword(Mission_PassengerDestination) ; #DEBUG_LINE_NO:195
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartRQ()
  If settlementQuest == None ; #DEBUG_LINE_NO:206
    Quest[] settlementQuests = RQSettlementEvent.SendStoryEventAndWait(OE_Location.GetLocation(), Trigger.GetRef(), None, 0, 0) ; #DEBUG_LINE_NO:207
    If settlementQuests ; #DEBUG_LINE_NO:208
      settlementQuest = settlementQuests[0] ; #DEBUG_LINE_NO:210
      Self.RegisterForRemoteEvent(settlementQuest as ScriptObject, "OnQuestShutdown") ; #DEBUG_LINE_NO:212
      oescript myOE = (Self as Quest) as oescript ; #DEBUG_LINE_NO:213
      If myOE ; #DEBUG_LINE_NO:214
        myOE.StopQuestWhenPlayerLeavesPlanet = False ; #DEBUG_LINE_NO:215
      EndIf ; #DEBUG_LINE_NO:
      If settlementQuest is rqscript && myOE.OwningFaction as Bool ; #DEBUG_LINE_NO:219
        Int failsafeCount = 0 ; #DEBUG_LINE_NO:221
        While settlementQuest.IsStarting() && failsafeCount < 50 ; #DEBUG_LINE_NO:222
          failsafeCount += 1 ; #DEBUG_LINE_NO:224
          Utility.Wait(1.0) ; #DEBUG_LINE_NO:225
        EndWhile ; #DEBUG_LINE_NO:
        (settlementQuest as rqscript).SetLocationOwnership(myOE.OwningFaction) ; #DEBUG_LINE_NO:227
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event Quest.OnQuestShutdown(Quest akSource)
  If akSource == settlementQuest ; #DEBUG_LINE_NO:235
    Self.UnregisterForRemoteEvent(settlementQuest as ScriptObject, "OnQuestShutdown") ; #DEBUG_LINE_NO:236
    settlementQuest = None ; #DEBUG_LINE_NO:237
    rescript myRE = (Self as Quest) as rescript ; #DEBUG_LINE_NO:238
    If myRE ; #DEBUG_LINE_NO:239
      myRE.StopQuestWhenPlayerLeavesPlanet = True ; #DEBUG_LINE_NO:240
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnQuestShutdown()
  If triggerRef ; #DEBUG_LINE_NO:247
    triggerRef.ReArmTrigger() ; #DEBUG_LINE_NO:249
    triggerRef = None ; #DEBUG_LINE_NO:250
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:258
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:262
EndFunction
