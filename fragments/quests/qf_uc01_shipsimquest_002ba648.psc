ScriptName Fragments:Quests:QF_UC01_ShipSimQuest_002BA648 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SimShip Auto Const mandatory
ReferenceAlias Property Alias_SimShipSeat Auto Const mandatory
ReferenceAlias Property Alias_ExitRock Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_600_PlayerDefeated Auto Const mandatory
ReferenceAlias Property Alias_ExitMarker Auto Const mandatory
Quest Property UC01 Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_200_Intro Auto Const mandatory
Scene Property UC01_ShipSimulatorHelperQuest_1000_ExitSequence Auto Const mandatory
Message Property UC01_DEBUG_ShipSim Auto Const
GlobalVariable Property UC01_ShipSim_PlayerPassedSequence Auto Const mandatory
ReferenceAlias Property Alias_BleedoutTestShip Auto Const mandatory
ReferenceAlias Property Alias_ActiveEnemy Auto Const mandatory
Message Property UC01_DEBUG_ExitingShipSim Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC01_PlayerInSimulator_True Auto Const mandatory
wwiseevent Property WwiseEvent_QST_UC01_PlayerInSimulator_False Auto Const mandatory
ReferenceAlias Property Alias_TeleportMarker Auto Const mandatory
GlobalVariable Property UC01_ShipSim_HighestTierReached Auto Const mandatory
GlobalVariable Property UC01_ShipSim_CurrentTier Auto Const mandatory
GlobalVariable Property UC01_ShipSim_PlayedThroughOnce Auto Const mandatory
GlobalVariable Property UC01_ShipSim_HeardIntroOnce Auto Const mandatory
Scene Property UC01_ShipSimQuest_125_FirstTimeEntry Auto Const mandatory
sq_playershipscript Property SQ_PlayerShip Auto Const mandatory
wwiseevent Property DRS_UC01_ShipSimulator_Hatch Auto Const mandatory
ReferenceAlias Property Alias_Proctor Auto Const mandatory
ReferenceAlias Property Alias_ProctorMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
ReferenceAlias Property Alias_WaitMarker Auto Const mandatory
GlobalVariable Property UC01_PilotSeatGlobal Auto Const mandatory
Message Property UC01_ShipSim_ExitPilotSeat Auto Const mandatory
Perk Property UC01_PilotingPerk Auto Const mandatory
RefCollectionAlias Property Alias_ActiveEnemies Auto Const mandatory
Message Property UC01_ShipSim_ExitPilotSeat_Controller Auto Const mandatory
RefCollectionAlias Property Alias_Companions Auto Const mandatory
ReferenceAlias Property Alias_AnimatedDoor Auto Const mandatory
ReferenceAlias Property Alias_ShipInteriorDoor Auto Const mandatory
RefCollectionAlias Property availableCompanions Auto Const mandatory
ActorValue Property FollowerState Auto Const mandatory
Faction Property CurrentCompanionFaction Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference myShip = Alias_BleedoutTestShip.GetRef() ; #DEBUG_LINE_NO:7
  myShip.Enable(False) ; #DEBUG_LINE_NO:8
  Alias_ActiveEnemy.ForceRefTo(myShip) ; #DEBUG_LINE_NO:9
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0010_Item_00()
  If Game.UsingGamepad() ; #DEBUG_LINE_NO:18
    UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:19
  Else ; #DEBUG_LINE_NO:
    UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
  UC01_PilotSeatGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:32
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:33
  If UC01_ShipSim_HeardIntroOnce.GetValue() >= 1.0 ; #DEBUG_LINE_NO:39
    Self.SetStage(130) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  Alias_ShipInteriorDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:44
  ObjectReference SimREF = Alias_SimShip.GetRef() ; #DEBUG_LINE_NO:46
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:48
  PlayerREF.AddPerk(UC01_PilotingPerk, False) ; #DEBUG_LINE_NO:49
  PlayerREF.MoveTo(Alias_TeleportMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
  kmyQuest.SimShipEnablePlayer = inputenablelayer.Create() ; #DEBUG_LINE_NO:52
  kmyQuest.SimShipEnablePlayer.EnableMenu(False) ; #DEBUG_LINE_NO:53
  kmyQuest.SimShipEnablePlayer.EnableFastTravel(False) ; #DEBUG_LINE_NO:54
  kmyQuest.SimShipEnablePlayer.EnableGravJump(False) ; #DEBUG_LINE_NO:55
  kmyQuest.SimShipEnablePlayer.EnableFarTravel(False) ; #DEBUG_LINE_NO:56
  kmyQuest.SimShipEnablePlayer.EnableLocationDiscovery(False) ; #DEBUG_LINE_NO:57
  WwiseEvent_QST_UC01_PlayerInSimulator_True.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:59
  If UC01.IsRunning() && !UC01.GetStageDone(590) && !UC01.GetStageDone(600) ; #DEBUG_LINE_NO:61
    UC01.SetStage(590) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  If UC01.IsRunning() ; #DEBUG_LINE_NO:65
    UC01.SetActive(False) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  Self.SetActive(True) ; #DEBUG_LINE_NO:69
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:70
  If !UC01.GetStageDone(1000) ; #DEBUG_LINE_NO:72
    Alias_Proctor.GetRef().MoveTo(Alias_ProctorMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  Actor[] teleportedFollowers = availableCompanions.GetActorArray() ; #DEBUG_LINE_NO:77
  Int I = 0 ; #DEBUG_LINE_NO:78
  While I < teleportedFollowers.Length ; #DEBUG_LINE_NO:79
    If teleportedFollowers[I].IsinFaction(CurrentCompanionFaction) || teleportedFollowers[I].IsinFaction(AvailableCrewFaction) ; #DEBUG_LINE_NO:80
      If teleportedFollowers[I].GetValue(FollowerState) != 2.0 ; #DEBUG_LINE_NO:81
        Alias_Companions.AddRef(teleportedFollowers[I] as ObjectReference) ; #DEBUG_LINE_NO:82
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:85
  EndWhile ; #DEBUG_LINE_NO:
  Actor[] eligibleCompanions = Alias_Companions.GetActorArray() ; #DEBUG_LINE_NO:88
  If eligibleCompanions != None ; #DEBUG_LINE_NO:89
    SQ_Followers.TeleportFollowers(Alias_WaitMarker.GetRef(), eligibleCompanions, True, False, False, True, False) ; #DEBUG_LINE_NO:90
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0125_Item_00()
  UC01_ShipSimQuest_125_FirstTimeEntry.Start() ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0130_Item_00()
  If UC01_ShipSim_HeardIntroOnce.GetValue() < 1.0 ; #DEBUG_LINE_NO:107
    UC01_ShipSim_HeardIntroOnce.SetValue(1.0) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  UC01_ShipSimQuest_125_FirstTimeEntry.Stop() ; #DEBUG_LINE_NO:117
  UC01_ShipSimulatorHelperQuest_200_Intro.Start() ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0250_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:126
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:127
  If !Self.GetStageDone(1) ; #DEBUG_LINE_NO:130
    kmyQuest.BeginSequence() ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(999, True, False) ; #DEBUG_LINE_NO:140
  If UC01_ShipSim_PlayerPassedSequence.GetValue() == 0.0 ; #DEBUG_LINE_NO:142
    UC01_ShipSim_PlayerPassedSequence.SetValue(1.0) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  If Game.UsingGamepad() ; #DEBUG_LINE_NO:152
    UC01_ShipSim_ExitPilotSeat_Controller.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:153
  Else ; #DEBUG_LINE_NO:
    UC01_ShipSim_ExitPilotSeat.ShowAsHelpMessage("", 5.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0600_Item_00()
  UC01_ShipSimulatorHelperQuest_600_PlayerDefeated.Start() ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetStage(900) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.SetObjectiveDisplayed(250, False, False) ; #DEBUG_LINE_NO:188
  Self.SetObjectiveDisplayed(300, False, False) ; #DEBUG_LINE_NO:189
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:190
    Self.SetObjectiveDisplayed(999, True, False) ; #DEBUG_LINE_NO:191
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(999, False, False) ; #DEBUG_LINE_NO:193
    Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  DRS_UC01_ShipSimulator_Hatch.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:204
  UC01_ShipSimulatorHelperQuest_1000_ExitSequence.Start() ; #DEBUG_LINE_NO:206
  UC01_ShipSimQuest_125_FirstTimeEntry.Stop() ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_1005_Item_00()
  Alias_ShipInteriorDoor.GetRef().SetOpen(True) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_1010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:224
  uc01_shipsimulationquestscript kmyQuest = __temp as uc01_shipsimulationquestscript ; #DEBUG_LINE_NO:225
  kmyQuest.SimShipEnablePlayer.Delete() ; #DEBUG_LINE_NO:228
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:229
  WwiseEvent_QST_UC01_PlayerInSimulator_False.Play(PlayerREF as ObjectReference, None, None) ; #DEBUG_LINE_NO:230
  If UC01_ShipSim_PlayedThroughOnce.GetValue() < 1.0 ; #DEBUG_LINE_NO:232
    UC01_ShipSim_PlayedThroughOnce.SetValue(1.0) ; #DEBUG_LINE_NO:233
  EndIf ; #DEBUG_LINE_NO:
  PlayerREF.RemovePerk(UC01_PilotingPerk) ; #DEBUG_LINE_NO:235
  PlayerREF.MoveTo(Alias_ExitMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:236
  Self.SetActive(False) ; #DEBUG_LINE_NO:237
  If UC01.IsRunning() ; #DEBUG_LINE_NO:238
    UC01.SetActive(True) ; #DEBUG_LINE_NO:239
  EndIf ; #DEBUG_LINE_NO:
  If !UC01.GetStageDone(630) ; #DEBUG_LINE_NO:244
    Int HighestTierInt = UC01_ShipSim_HighestTierReached.GetValueInt() ; #DEBUG_LINE_NO:245
    Int CurrentTierInt = UC01_ShipSim_CurrentTier.GetValueInt() ; #DEBUG_LINE_NO:246
    If HighestTierInt < CurrentTierInt ; #DEBUG_LINE_NO:248
      UC01_ShipSim_HighestTierReached.SetValue(CurrentTierInt as Float) ; #DEBUG_LINE_NO:249
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference SimShipRef = Alias_SimShip.GetShipRef() ; #DEBUG_LINE_NO:254
  SimShipRef.DisableNoWait(False) ; #DEBUG_LINE_NO:255
  SimShipRef.Delete() ; #DEBUG_LINE_NO:256
  SQ_PlayerShip.ResetPlayerShip(SQ_PlayerShip.HomeShip.GetShipRef()) ; #DEBUG_LINE_NO:259
  Alias_ActiveEnemies.DisableAll(False) ; #DEBUG_LINE_NO:262
  Actor[] teleportedFollowers = Alias_Companions.GetActorArray() ; #DEBUG_LINE_NO:265
  If teleportedFollowers != None ; #DEBUG_LINE_NO:266
    SQ_Followers.AllFollowersFollow(teleportedFollowers) ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
  Alias_AnimatedDoor.GetRef().SetOpen(False) ; #DEBUG_LINE_NO:271
  Self.SetStage(1005) ; #DEBUG_LINE_NO:274
  Self.Stop() ; #DEBUG_LINE_NO:276
  Self.Reset() ; #DEBUG_LINE_NO:277
EndFunction
