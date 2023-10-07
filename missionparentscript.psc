ScriptName MissionParentScript Extends Quest
{ parent script for Mission handling }

;-- Structs -----------------------------------------
Struct MissionBoardSurveyTraitData
  Int minTraitValue = 0
  GlobalVariable RewardXP
EndStruct

Struct MissionEnemyType
  Faction enemyFaction
  Form enemyName
EndStruct

Struct MissionLocRefType
  LocationRefType cargoSource
  LocationRefType cargoDestination
  Form cargoSourceBase
  Form cargoDestinationBase
EndStruct

Struct MissionSupplyType
  ActorValue supplyAV
EndStruct

Struct MissionType
  Keyword missionTypeKeyword
  { story manager keyword to try to start }
  Message MissionCompleteMessage
  { OPTIONAL: Extra notification to the player that the mission is complete }
  Message MissionFailMessage
  { OPTIONAL: Extra notification to the player that the mission has failed }
  GlobalVariable MissionCompletedCount
  { global to track how many of this type of mission the player has completed }
  Bool RandomStoryEventOrder = False
  { mission types with RandomStoryEventOrder = true are sent in a random order since there is a limited number allowed to start }
EndStruct


;-- Variables ---------------------------------------
Location lastResetLocation
Float lastResetTimestamp
Int resetTimerID = 1 Const

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard MissionCompletedFailedGuard
Guard resetMissionGuard

;-- Properties --------------------------------------
Group MissionData
  missionparentscript:missiontype[] Property MissionTypes Auto Const
  { array of mission types }
  Int Property NoMissionIndex = 0 Auto Const
  { index of the entry to use if there are no missions available }
  missionquestscript[] Property missionQuests Auto Const
  { array of all mission quests }
  missioncargoparentscript[] Property cargoQuests Auto Const
  { cargo quests - needed to update before displaying and after cargo space changes }
  missionpassengerquestscript[] Property passengerQuests Auto Const
  { passenger quests - needed to update before displaying and after passenger space changes }
  missionsurveyquestscript[] Property surveyQuests Auto Const
  { survey mission quests - needed to check if planet is a survey target }
  missionparentscript:missionlocreftype[] Property cargoTypes Auto Const
  { array of cargo type data { }
  missionparentscript:missionlocreftype[] Property passengerTypes Auto Const
  { array of cargo type data }
  missionparentscript:missionsupplytype[] Property resourceAVs Auto Const
  { array of resourceAVs }
  ActorValue[] Property supplyNeedAVs Auto Const
  { array of supply need resource AVs }
  missionparentscript:missionenemytype[] Property enemyTypes Auto Const
  { array of enemy types to match faction with name marker (for text replacement) }
  ActorValue Property MissionRewardMultiplier Auto Const mandatory
  { if on appropriate mission refs, acts as a multiplier on mission rewards }
  Message Property MissionBoardAcceptMessage Auto Const mandatory
  { confirmation message box for accepting a mission }
  GlobalVariable Property MB_MissionsLastSurveyTrait Auto Const mandatory
  { tracks the trait index of last completed survey trait mission }
  GlobalVariable Property MB_MissionsLastSurveyTraitTimestamp Auto Const mandatory
  { timestamp of last completed survey trait mission }
  GlobalVariable Property MissionBoardSurveyTraitRewardOverlayMult Auto Const mandatory
  { multiplier based on total number of overlays needed to be explored for this trait }
  GlobalVariable Property MissionBoardSurveyTraitSystemValueMult Auto Const mandatory
  { multiplier based on total trait value of the target system }
  missionparentscript:missionboardsurveytraitdata[] Property MissionBoardSurveyTraitXPRewards Auto Const
  { array of xp rewards for completing survey trait missions }
  GlobalVariable Property MissionBoardSurveyXPRewardBase Auto Const mandatory
  { base XP reward for survey planet missions }
EndGroup

Group MissionBoardAliases
  LocationAlias Property TargetSystemLocation Auto Const
  LocationAlias Property TargetPlanetLocation Auto Const
  LocationAlias Property TargetLocation Auto Const
  ReferenceAlias Property PrimaryRef Auto Const mandatory
  ReferenceAlias Property PlayerShip Auto Const mandatory
EndGroup

Group RQ_Hellos
  ActorValue Property RQ_AV_Hello Auto Const mandatory
  { used to condition for RQ hellos }
  GlobalVariable Property RQ_Hello_AboardShipValue Auto Const mandatory
  GlobalVariable Property RQ_Hello_DepartingShipValue Auto Const mandatory
EndGroup

Keyword Property LocTypeStarSystem Auto Const mandatory
Keyword Property LocTypeMajorOrbital Auto Const mandatory
{ used to check if something is a planet or moon }
Keyword Property LocTypeSettlement Auto Const mandatory
{ used to check if something is a settlement - try to start new missions }
Keyword Property LocTypeMissionSource Auto Const mandatory
{ used to check if something is a mission source - try to start new missions }
Keyword Property SpaceshipKeyword Auto Const mandatory
{ used to check if a location is a spaceship }
Keyword Property OutpostCargoLinkFueledKeyword Auto Const mandatory
{ keyword to find fueled cargo links }
ActorValue Property CarryWeight Auto Const mandatory
{ used to check cargo space }
ActorValue Property CarryWeightShielded Auto Const mandatory
{ used to check shielded cargo space }
Float Property resetTimeInterval = 1.0 Auto Const
{ time in game time days before mission board will reset even if player hasn't changed location }

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:155
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:158
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:159
EndEvent

Event ReferenceAlias.OnLocationChange(ReferenceAlias akSender, Location akOldLoc, Location akNewLoc)
  Self.CheckLocationChange(akOldLoc, akNewLoc) ; #DEBUG_LINE_NO:164
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Self.CheckLocationChange(akOldLoc, akNewLoc) ; #DEBUG_LINE_NO:169
EndEvent

Function CheckLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc as Bool && akNewLoc as Bool ; #DEBUG_LINE_NO:175
    If akOldLoc.HasKeyword(SpaceshipKeyword) || akNewLoc.HasKeyword(SpaceshipKeyword) ; #DEBUG_LINE_NO:176
       ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Guard resetMissionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:183
        Location[] newLocParentSettlements = akNewLoc.GetParentLocations(LocTypeSettlement) ; #DEBUG_LINE_NO:184
        Location newLocParentSettlement = None ; #DEBUG_LINE_NO:185
        If newLocParentSettlements.Length > 0 ; #DEBUG_LINE_NO:186
          newLocParentSettlement = newLocParentSettlements[0] ; #DEBUG_LINE_NO:187
        EndIf ; #DEBUG_LINE_NO:
        Bool enteringSettlement = newLocParentSettlement as Bool || akNewLoc.HasKeyword(LocTypeSettlement) ; #DEBUG_LINE_NO:189
        If akOldLoc.IsSameLocation(akNewLoc, LocTypeStarSystem) == False ; #DEBUG_LINE_NO:192
          Self.ResetMissions(True, False, akNewLoc, False) ; #DEBUG_LINE_NO:195
        ElseIf enteringSettlement && akOldLoc.IsSameLocation(akNewLoc, LocTypeSettlement) == False || akNewLoc.HasKeyword(LocTypeMissionSource) ; #DEBUG_LINE_NO:196
          Self.ResetMissions(False, False, akNewLoc, False) ; #DEBUG_LINE_NO:199
        EndIf ; #DEBUG_LINE_NO:
      EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function ResetMissions(Bool bShutDownUnstarted, Bool bShutDownAll, Location resetLocation, Bool resetLocationOverride)
  Guard resetMissionGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:212
    If resetLocation != lastResetLocation || resetLocationOverride ; #DEBUG_LINE_NO:215
      lastResetLocation = resetLocation ; #DEBUG_LINE_NO:216
      lastResetTimestamp = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:217
      Self.StartTimerGameTime(resetTimeInterval * 24.0, resetTimerID) ; #DEBUG_LINE_NO:218
      Self.StopMissions(bShutDownUnstarted, bShutDownAll) ; #DEBUG_LINE_NO:220
      Int I = 0 ; #DEBUG_LINE_NO:222
      Int missionCount = 0 ; #DEBUG_LINE_NO:223
      Keyword[] randomMissionEvents = new Keyword[0] ; #DEBUG_LINE_NO:224
      While I < MissionTypes.Length ; #DEBUG_LINE_NO:227
        missionparentscript:missiontype theMissionType = MissionTypes[I] ; #DEBUG_LINE_NO:228
        If theMissionType.RandomStoryEventOrder ; #DEBUG_LINE_NO:229
          randomMissionEvents.add(theMissionType.missionTypeKeyword, 1) ; #DEBUG_LINE_NO:230
        Else ; #DEBUG_LINE_NO:
          theMissionType.missionTypeKeyword.SendStoryEvent(resetLocation, None, None, 0, 0) ; #DEBUG_LINE_NO:233
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:235
      EndWhile ; #DEBUG_LINE_NO:
      While randomMissionEvents.Length > 0 ; #DEBUG_LINE_NO:238
        Int randomIndex = Utility.RandomInt(0, randomMissionEvents.Length - 1) ; #DEBUG_LINE_NO:240
        randomMissionEvents[randomIndex].SendStoryEvent(resetLocation, None, None, 0, 0) ; #DEBUG_LINE_NO:242
        randomMissionEvents.remove(randomIndex, 1) ; #DEBUG_LINE_NO:243
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Event OnTimerGameTime(Int aiTimerID)
  If aiTimerID == resetTimerID ; #DEBUG_LINE_NO:250
    Float currentTimestamp = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:251
    Float timeSinceReset = currentTimestamp - lastResetTimestamp ; #DEBUG_LINE_NO:252
    If timeSinceReset > resetTimeInterval ; #DEBUG_LINE_NO:257
      Self.ResetMissions(False, False, Game.GetPlayer().GetCurrentLocation(), True) ; #DEBUG_LINE_NO:260
    Else ; #DEBUG_LINE_NO:
      Self.StartTimerGameTime(resetTimeInterval * 24.0, resetTimerID) ; #DEBUG_LINE_NO:264
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StopMissions(Bool bShutDownUnstarted, Bool bShutDownAll)
  If bShutDownUnstarted || bShutDownAll ; #DEBUG_LINE_NO:271
    Int I = 0 ; #DEBUG_LINE_NO:273
    While I < missionQuests.Length ; #DEBUG_LINE_NO:274
      missionquestscript theMission = missionQuests[I] ; #DEBUG_LINE_NO:275
      If theMission.IsRunning() && (theMission.PlayerAcceptedQuest == False || bShutDownAll) ; #DEBUG_LINE_NO:277
        theMission.Stop() ; #DEBUG_LINE_NO:278
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:280
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function UpdateMissions()
  Int I = 0 ; #DEBUG_LINE_NO:288
  While I < cargoQuests.Length ; #DEBUG_LINE_NO:289
    missioncargoparentscript theMission = cargoQuests[I] ; #DEBUG_LINE_NO:290
    If theMission.IsRunning() && theMission.PlayerAcceptedQuest == False ; #DEBUG_LINE_NO:292
      theMission.UpdatePlayerCargoSpace() ; #DEBUG_LINE_NO:293
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:295
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:298
  While I < passengerQuests.Length ; #DEBUG_LINE_NO:299
    missionpassengerquestscript themission = passengerQuests[I] ; #DEBUG_LINE_NO:300
    If themission.IsRunning() && themission.PlayerAcceptedQuest == False ; #DEBUG_LINE_NO:302
      themission.UpdatePlayerPassengerSpace() ; #DEBUG_LINE_NO:303
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:305
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Bool Function IsPlanetSurveyTarget(ObjectReference refToCheck)
  Bool isTarget = False ; #DEBUG_LINE_NO:310
  planet planetToCheck = refToCheck.GetCurrentPlanet() ; #DEBUG_LINE_NO:311
  If planetToCheck ; #DEBUG_LINE_NO:312
    Int I = 0 ; #DEBUG_LINE_NO:314
    While I < surveyQuests.Length && isTarget == False ; #DEBUG_LINE_NO:315
      missionsurveyquestscript theSurveyQuest = surveyQuests[I] ; #DEBUG_LINE_NO:316
      If theSurveyQuest.IsRunning() && theSurveyQuest.PlayerAcceptedQuest ; #DEBUG_LINE_NO:317
        If theSurveyQuest.TargetPlanetLocation.GetLocation().GetCurrentPlanet() == planetToCheck ; #DEBUG_LINE_NO:318
          isTarget = True ; #DEBUG_LINE_NO:320
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:323
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return isTarget ; #DEBUG_LINE_NO:326
EndFunction

Function HandleMissionCompleted(missionquestscript theMission)
  Guard MissionCompletedFailedGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:332
    Int missionTypeIndex = theMission.MissionType ; #DEBUG_LINE_NO:333
    missionparentscript:missiontype theMissionType = MissionTypes[missionTypeIndex] ; #DEBUG_LINE_NO:334
    If theMissionType.MissionCompleteMessage ; #DEBUG_LINE_NO:336
      TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation()) ; #DEBUG_LINE_NO:338
      TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation()) ; #DEBUG_LINE_NO:339
      TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation()) ; #DEBUG_LINE_NO:340
      PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef()) ; #DEBUG_LINE_NO:341
      theMissionType.MissionCompleteMessage.Show(theMission.RewardAmountGlobalActual.GetValueInt() as Float, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:343
    EndIf ; #DEBUG_LINE_NO:
    If theMissionType.MissionCompletedCount ; #DEBUG_LINE_NO:345
      theMissionType.MissionCompletedCount.Mod(1.0) ; #DEBUG_LINE_NO:347
    EndIf ; #DEBUG_LINE_NO:
    If theMission is missionsurveytraitscript ; #DEBUG_LINE_NO:350
      missionsurveytraitscript theSurveyMission = theMission as missionsurveytraitscript ; #DEBUG_LINE_NO:351
      Int traitIndex = theSurveyMission.SQ_Parent.PlanetTraits.findstruct("PlanetTrait", theSurveyMission.PlanetTrait, 0) ; #DEBUG_LINE_NO:353
      If traitIndex > -1 ; #DEBUG_LINE_NO:354
        MB_MissionsLastSurveyTrait.SetValueInt(traitIndex) ; #DEBUG_LINE_NO:355
        MB_MissionsLastSurveyTraitTimestamp.SetValue(Utility.GetCurrentGameTime()) ; #DEBUG_LINE_NO:356
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    Self.SendMissionCompletedEvent(theMission, False) ; #DEBUG_LINE_NO:361
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function HandleMissionFailed(missionquestscript theMission)
  Guard MissionCompletedFailedGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:367
    Int missionTypeIndex = theMission.MissionType ; #DEBUG_LINE_NO:368
    missionparentscript:missiontype theMissionType = MissionTypes[missionTypeIndex] ; #DEBUG_LINE_NO:369
    If theMissionType.MissionFailMessage ; #DEBUG_LINE_NO:370
      TargetSystemLocation.ForceLocationTo(theMission.TargetSystemLocation.GetLocation()) ; #DEBUG_LINE_NO:372
      TargetPlanetLocation.ForceLocationTo(theMission.TargetPlanetLocation.GetLocation()) ; #DEBUG_LINE_NO:373
      TargetLocation.ForceLocationTo(theMission.TargetLocation.GetLocation()) ; #DEBUG_LINE_NO:374
      PrimaryRef.ForceRefTo(theMission.PrimaryRef.GetRef()) ; #DEBUG_LINE_NO:375
      theMissionType.MissionFailMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:377
    EndIf ; #DEBUG_LINE_NO:
    Self.SendMissionCompletedEvent(theMission, True) ; #DEBUG_LINE_NO:379
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function SendMissionAcceptedEvent(missionquestscript theQuest)
  Var[] kargs = new Var[1] ; #DEBUG_LINE_NO:385
  kargs[0] = theQuest as Var ; #DEBUG_LINE_NO:386
  Self.SendCustomEvent("missionparentscript_MissionAccepted", kargs) ; #DEBUG_LINE_NO:387
EndFunction

Function SendMissionCompletedEvent(missionquestscript theQuest, Bool missionFailed)
  Var[] kargs = new Var[2] ; #DEBUG_LINE_NO:392
  kargs[0] = theQuest as Var ; #DEBUG_LINE_NO:393
  kargs[1] = missionFailed as Var ; #DEBUG_LINE_NO:394
  Self.SendCustomEvent("missionparentscript_MissionCompleted", kargs) ; #DEBUG_LINE_NO:395
EndFunction

Function TestGetMatchingLocations(Location parentLocation, LocationRefType wantedrefType)
  LocationRefType[] targetRefTypes = new LocationRefType[1] ; #DEBUG_LINE_NO:399
  targetRefTypes[0] = wantedrefType ; #DEBUG_LINE_NO:400
EndFunction

Function DebugResetMissions()
  Self.ResetMissions(True, True, None, True) ; #DEBUG_LINE_NO:406
EndFunction
