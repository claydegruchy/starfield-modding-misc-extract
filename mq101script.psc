ScriptName MQ101Script Extends Quest

;-- Variables ---------------------------------------
Int timerInitID = 1 Const

;-- Properties --------------------------------------
Group VascoCrew_Properties
  sq_crewscript Property SQ_Crew Auto Const mandatory
  { SQ_Crew quest for assigning crew }
  sq_companionsscript Property SQ_Companions Auto Const mandatory
  { SQ_Companinos for assigning companion }
EndGroup

inputenablelayer Property VSEnableLayer Auto hidden
GlobalVariable Property MQ101Debug Auto Const mandatory
ReferenceAlias Property CharGenFurniture Auto Const mandatory
ReferenceAlias Property MineBoringMachine Auto Const mandatory
ObjectReference Property MQ101_Scene05_MarkerPlayer Auto Const mandatory
ReferenceAlias Property Heller Auto Const mandatory
ObjectReference Property MQ101_LGT_A Auto Const mandatory
ObjectReference Property MQ101_LGT_B Auto Const mandatory
Scene[] Property MQ101_013A_FlightScenes Auto Const
{ array of flight tutorial scenes that need to be stopped if player skips past tutorial }
ReferenceAlias Property Vasco Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
Bool Property setHomeShipOnInit = False Auto hidden
{ set by startup stages - since this calls SQ_PlayerShip, can't be done from startup stage during New Game start - SQ_PlayerShip isn't running yet }
Bool Property moveVascoToShipOnInit = False Auto hidden
{ same as above - need to do this after startup }
Bool Property setVascoAsCrewOnInit = False Auto hidden
{ same as above - need to do this after startup }
ReferenceAlias Property Alias_BarrettShip Auto Const mandatory
LocationAlias Property BarrettShip_ExteriorLocation Auto Const mandatory
LocationAlias Property BarrettShip_InteriorLocation Auto Const mandatory
ReferenceAlias Property BarrettPilotChair Auto Const mandatory
ReferenceAlias Property BarrettShipDoor Auto Const mandatory
ReferenceAlias Property BarrettShipCrewMarker Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker01 Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker02 Auto Const mandatory
ReferenceAlias Property BarrettShipSmallItemMarker03 Auto Const mandatory
ActorValue Property PlayerUnityTimesEntered Auto Const mandatory
spaceshipreference Property MQPlayerStarbornShipREF Auto Const mandatory
Message Property Tutorial_Inventory Auto Const mandatory
Message Property Tutorial_Inventory02 Auto Const mandatory
Message Property Tutorial_Inventory03 Auto Const mandatory
Message Property Tutorial_Inventory04 Auto Const mandatory
Message Property Tutorial_FastTravel_01 Auto Const mandatory
Message Property Tutorial_FastTravel_02 Auto Const mandatory
Message Property Tutorial_FastTravel_03 Auto Const mandatory
Int Property TutorialFastTravel01Stage = 900 Auto Const
Int Property TutorialFastTravel02Stage = 910 Auto Const
Int Property TutorialFastTravel03Stage = 920 Auto Const
Int Property TutorialFastTravel04Stage = 930 Auto Const
Int Property SetUpCharGenStage = 63 Auto Const
Int Property DrillerInPositionStage = 33 Auto Const
Int Property CharGenDoneStage = 105 Auto Const
Int Property PlanetViewPrereqStage = 606 Auto Const
Int Property PlanetViewMapOpenedStage = 608 Auto Const
Int Property PlanetViewAlreadyLandedStage = 607 Auto Const
Int Property SetCoursePrereqStage = 1000 Auto Const
Int Property SetCourseDataMenuStage = 1005 Auto Const
Int Property SetCourseMissionsMenuStage = 1010 Auto Const
Int Property SetCourseGalaxyMenuStage = 1020 Auto Const
Message Property Tutorial_SetCourse01 Auto Const mandatory
Message Property Tutorial_SetCourse02 Auto Const mandatory
Message Property Tutorial_SetCourse03 Auto Const mandatory
GlobalVariable Property MQ101VascoQuestFollower Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:74
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerModifiedShip") ; #DEBUG_LINE_NO:75
  If MQ101Debug.GetValueInt() == 1 ; #DEBUG_LINE_NO:77
    Self.SetStage(400) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnPlayerModifiedShip(Actor akSource, spaceshipreference akShip)
  spaceshipreference BarrettShipRef = Alias_BarrettShip.GetShipRef() ; #DEBUG_LINE_NO:83
  If akShip == BarrettShipRef ; #DEBUG_LINE_NO:84
    Self.ResetBarrettShip(akShip) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ResetBarrettShip(spaceshipreference newShip)
  Alias_BarrettShip.ForceRefTo(newShip as ObjectReference) ; #DEBUG_LINE_NO:91
  newShip.SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:94
  BarrettShip_ExteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:96
  BarrettShip_InteriorLocation.ClearAndRefillAlias() ; #DEBUG_LINE_NO:97
  BarrettPilotChair.ClearAndRefillAlias() ; #DEBUG_LINE_NO:98
  BarrettShipDoor.ClearAndRefillAlias() ; #DEBUG_LINE_NO:99
  BarrettShipCrewMarker.ClearAndRefillAlias() ; #DEBUG_LINE_NO:100
  BarrettShipSmallItemMarker01.ClearAndRefillAlias() ; #DEBUG_LINE_NO:101
  BarrettShipSmallItemMarker02.ClearAndRefillAlias() ; #DEBUG_LINE_NO:102
  BarrettShipSmallItemMarker03.ClearAndRefillAlias() ; #DEBUG_LINE_NO:103
EndFunction

Function StartInitTimer(Bool setVascoAsCrew, Bool moveVasco, Bool setHomeShip)
  setVascoAsCrewOnInit = setVascoAsCrew ; #DEBUG_LINE_NO:108
  moveVascoToShipOnInit = moveVasco ; #DEBUG_LINE_NO:109
  setHomeShipOnInit = setHomeShip ; #DEBUG_LINE_NO:110
  Self.startTimer(1.0, timerInitID) ; #DEBUG_LINE_NO:111
EndFunction

Event OnTimer(Int aiTimerID)
  If aiTimerID == timerInitID ; #DEBUG_LINE_NO:116
    If SQ_PlayerShip.IsRunning() == False ; #DEBUG_LINE_NO:117
      Self.startTimer(1.0, timerInitID) ; #DEBUG_LINE_NO:120
    ElseIf Self.IsStarting() == True ; #DEBUG_LINE_NO:121
      Self.startTimer(1.0, timerInitID) ; #DEBUG_LINE_NO:124
    Else ; #DEBUG_LINE_NO:
      If setHomeShipOnInit ; #DEBUG_LINE_NO:126
        Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:127
        If PlayerREF.GetValueInt(PlayerUnityTimesEntered) > 0 ; #DEBUG_LINE_NO:128
          SQ_PlayerShip.ResetHomeShip(MQPlayerStarbornShipREF) ; #DEBUG_LINE_NO:129
          Game.SetInCharGen(False, False, False) ; #DEBUG_LINE_NO:130
          Game.RequestSave() ; #DEBUG_LINE_NO:131
        Else ; #DEBUG_LINE_NO:
          spaceshipreference FrontierShipREF = Alias_BarrettShip.GetShipRef() ; #DEBUG_LINE_NO:133
          SQ_PlayerShip.ResetHomeShip(FrontierShipREF) ; #DEBUG_LINE_NO:134
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      If setVascoAsCrewOnInit ; #DEBUG_LINE_NO:138
        Self.AssignVascoAsCrew() ; #DEBUG_LINE_NO:139
      EndIf ; #DEBUG_LINE_NO:
      If moveVascoToShipOnInit ; #DEBUG_LINE_NO:142
        SQ_PlayerShip.LoadVascoInterior() ; #DEBUG_LINE_NO:143
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StartCharGen()
  Actor HellerREF = Heller.GetActorRef() ; #DEBUG_LINE_NO:150
  If !Self.RegisterForAnimationEvent(HellerREF as ObjectReference, "CharacterGenStart") ; #DEBUG_LINE_NO:151
    Self.RegisterForRemoteEvent(HellerREF as ScriptObject, "OnLoad") ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function RegisterForDrill()
  Self.RegisterForAnimationEvent(MineBoringMachine.GetRef(), "ExitLoopEnd") ; #DEBUG_LINE_NO:158
EndFunction

Event ObjectReference.OnLoad(ObjectReference akSender)
  Actor HellerREF = Heller.GetActorRef() ; #DEBUG_LINE_NO:162
  If !Self.RegisterForAnimationEvent(HellerREF as ObjectReference, "CharacterGenStart") ; #DEBUG_LINE_NO:163
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAnimationEvent(ObjectReference akSource, String asEventName)
  Actor HellerREF = Heller.GetActorRef() ; #DEBUG_LINE_NO:172
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:173
  ObjectReference DrillerREF = MineBoringMachine.GetRef() ; #DEBUG_LINE_NO:174
  If akSource == HellerREF as ObjectReference ; #DEBUG_LINE_NO:176
    Self.SetStage(SetUpCharGenStage) ; #DEBUG_LINE_NO:177
  ElseIf akSource == DrillerREF ; #DEBUG_LINE_NO:178
    Self.SetStage(DrillerInPositionStage) ; #DEBUG_LINE_NO:179
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function SetUpChargen()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:184
  Game.FadeOutGame(True, True, 0.0, 0.100000001, True) ; #DEBUG_LINE_NO:185
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:186
  MQ101_LGT_A.DisableNoWait(False) ; #DEBUG_LINE_NO:187
  MQ101_LGT_B.EnableNoWait(False) ; #DEBUG_LINE_NO:188
  Self.RegisterForMenuOpenCloseEvent("ChargenMenu") ; #DEBUG_LINE_NO:189
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnGetUp") ; #DEBUG_LINE_NO:190
  CharGenFurniture.GetRef().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:191
EndFunction

Event Actor.OnGetUp(Actor akSender, ObjectReference akFurniture)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:195
  Game.FadeOutGame(False, True, 0.5, 0.100000001, False) ; #DEBUG_LINE_NO:196
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:197
  CharGenFurniture.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:198
  Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnGetUp") ; #DEBUG_LINE_NO:199
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  If asMenuName == "ChargenMenu" ; #DEBUG_LINE_NO:215
    If abOpening == False ; #DEBUG_LINE_NO:216
      Self.SetStage(CharGenDoneStage) ; #DEBUG_LINE_NO:217
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "DataMenu" ; #DEBUG_LINE_NO:221
    If abOpening ; #DEBUG_LINE_NO:222
      If Self.GetStageDone(165) && !Self.GetStageDone(168) && !Self.GetStageDone(167) ; #DEBUG_LINE_NO:223
        Self.RegisterForTutorialEvent("OnHelmetTabOpened") ; #DEBUG_LINE_NO:224
        Self.RegisterForMenuOpenCloseEvent("InventoryMenu") ; #DEBUG_LINE_NO:225
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:226
        Tutorial_Inventory02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:227
        Self.SetStage(166) ; #DEBUG_LINE_NO:228
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.GetStageDone(168) ; #DEBUG_LINE_NO:231
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:232
    EndIf ; #DEBUG_LINE_NO:
    If !abOpening ; #DEBUG_LINE_NO:236
      If Self.GetStageDone(165) && !Self.GetStageDone(168) && !Self.GetStageDone(167) ; #DEBUG_LINE_NO:237
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:238
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If abOpening ; #DEBUG_LINE_NO:242
      Self.ClearStarMapTutorial() ; #DEBUG_LINE_NO:243
    EndIf ; #DEBUG_LINE_NO:
    If abOpening && Self.GetStageDone(SetCoursePrereqStage) ; #DEBUG_LINE_NO:246
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:247
      Self.SetStage(SetCourseDataMenuStage) ; #DEBUG_LINE_NO:248
      Self.RegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:249
      Tutorial_SetCourse02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:250
    EndIf ; #DEBUG_LINE_NO:
    If !abOpening && Self.GetStageDone(SetCoursePrereqStage) && !Self.GetStageDone(SetCourseGalaxyMenuStage) ; #DEBUG_LINE_NO:253
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:254
      Tutorial_SetCourse01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:255
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "InventoryMenu" ; #DEBUG_LINE_NO:259
    If abOpening ; #DEBUG_LINE_NO:260
      If !Self.GetStageDone(167) ; #DEBUG_LINE_NO:261
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:262
        Tutorial_Inventory03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:263
        Self.SetStage(167) ; #DEBUG_LINE_NO:264
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "MonocleMenu" ; #DEBUG_LINE_NO:269
    If abOpening ; #DEBUG_LINE_NO:270
      If Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage) && !Self.GetStageDone(TutorialFastTravel04Stage) ; #DEBUG_LINE_NO:271
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:272
        Tutorial_FastTravel_02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:273
        Self.SetStage(TutorialFastTravel02Stage) ; #DEBUG_LINE_NO:274
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage) ; #DEBUG_LINE_NO:277
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:278
      Tutorial_FastTravel_01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:279
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "BSMissionMenu" ; #DEBUG_LINE_NO:284
    If abOpening && !Self.GetStageDone(SetCourseGalaxyMenuStage) ; #DEBUG_LINE_NO:285
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:286
      Self.SetStage(SetCourseMissionsMenuStage) ; #DEBUG_LINE_NO:287
      Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:288
      Tutorial_SetCourse03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:289
    ElseIf !abOpening && !Self.GetStageDone(SetCourseGalaxyMenuStage) ; #DEBUG_LINE_NO:290
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:291
      Tutorial_SetCourse02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:292
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "GalaxyStarMapMenu" ; #DEBUG_LINE_NO:296
    If abOpening ; #DEBUG_LINE_NO:297
      If Self.GetStageDone(TutorialFastTravel01Stage) && !Self.GetStageDone(TutorialFastTravel03Stage) && !Self.GetStageDone(TutorialFastTravel04Stage) ; #DEBUG_LINE_NO:298
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:299
        Tutorial_FastTravel_03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:300
        Self.SetStage(TutorialFastTravel03Stage) ; #DEBUG_LINE_NO:301
      EndIf ; #DEBUG_LINE_NO:
    ElseIf Self.GetStageDone(TutorialFastTravel03Stage) ; #DEBUG_LINE_NO:304
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:305
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(PlanetViewPrereqStage) && !Self.GetStageDone(PlanetViewAlreadyLandedStage) && !Self.GetStageDone(PlanetViewMapOpenedStage) ; #DEBUG_LINE_NO:310
      Self.SetStage(PlanetViewMapOpenedStage) ; #DEBUG_LINE_NO:311
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:312
    EndIf ; #DEBUG_LINE_NO:
    If Self.GetStageDone(SetCourseMissionsMenuStage) ; #DEBUG_LINE_NO:316
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:317
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:318
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:319
      Self.UnRegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:320
      Self.UnRegisterForPlayerTeleport() ; #DEBUG_LINE_NO:321
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnPlayerTeleport()
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:327
  If Self.GetStageDone(TutorialFastTravel04Stage) == False ; #DEBUG_LINE_NO:329
    Message.ClearHelpMessages() ; #DEBUG_LINE_NO:330
    Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:331
    Self.UnRegisterForPlayerTeleport() ; #DEBUG_LINE_NO:332
    Self.SetStage(TutorialFastTravel04Stage) ; #DEBUG_LINE_NO:333
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(SetCourseDataMenuStage) ; #DEBUG_LINE_NO:336
    Message.ClearHelpMessages() ; #DEBUG_LINE_NO:337
    Self.UnRegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:338
    Self.UnRegisterForPlayerTeleport() ; #DEBUG_LINE_NO:339
    Self.SetStage(SetCourseGalaxyMenuStage) ; #DEBUG_LINE_NO:340
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  If asEventName == "OnHelmetTabOpened" ; #DEBUG_LINE_NO:345
    Message.ClearHelpMessages() ; #DEBUG_LINE_NO:346
    Tutorial_Inventory04.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:347
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function StopFlightTutorialScenes()
  Int I = 0 ; #DEBUG_LINE_NO:352
  While I < MQ101_013A_FlightScenes.Length ; #DEBUG_LINE_NO:353
    MQ101_013A_FlightScenes[I].Stop() ; #DEBUG_LINE_NO:354
    I += 1 ; #DEBUG_LINE_NO:355
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function AssignVascoAsCrew()
  MQ101VascoQuestFollower.SetValueInt(1) ; #DEBUG_LINE_NO:363
  Vasco.GetActorRef().SetPlayerTeammate(True, False, False) ; #DEBUG_LINE_NO:364
EndFunction

Function MQ101DisablePlayerControls()
  VSEnableLayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:368
  VSEnableLayer.DisablePlayerControls(True, True, False, False, False, True, True, False, True, True, False) ; #DEBUG_LINE_NO:369
EndFunction

Function MQ101EnablePlayerControls()
  VSEnableLayer = None ; #DEBUG_LINE_NO:373
EndFunction

Function StarMapTutorial()
  Self.RegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:377
EndFunction

Function ClearStarMapTutorial()
  If Self.GetStageDone(510) ; #DEBUG_LINE_NO:381
    Message.ClearHelpMessages() ; #DEBUG_LINE_NO:382
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function InventoryTutorial()
  Tutorial_Inventory.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:387
  Self.RegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:388
EndFunction

Function FastTravelTutorial()
  Tutorial_FastTravel_01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:392
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:393
  Self.RegisterForPlayerTeleport() ; #DEBUG_LINE_NO:394
EndFunction

Function PlanetViewTutorial()
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:398
EndFunction

Function SetCourseTutorial()
  Self.RegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:402
  Self.RegisterForPlayerTeleport() ; #DEBUG_LINE_NO:403
  Tutorial_SetCourse01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:404
EndFunction
