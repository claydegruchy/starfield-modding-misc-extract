ScriptName Fragments:Quests:QF_BE_KT01_0003BC4F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
GlobalVariable Property PBE_DerelictCreaturesMax Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Scene Property BE_KT01_SceneWelcome Auto Const mandatory
Hazard Property CreateVacuumHazard Auto Const mandatory
Hazard Property myHazard01 Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
GlobalVariable Property BE_KT01_InstanceID Auto Const mandatory
Scene Property BE_KT01_SceneStart Auto Const mandatory
LeveledItem Property LL_OE_Default_Reward Auto Const mandatory
Hazard Property myHazard02 Auto Const mandatory
Hazard Property myHazard03 Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_Announcer Auto Const mandatory
Quest Property SE_KT01 Auto Const mandatory
ReferenceAlias Property Alias_Captain01 Auto Const mandatory
ReferenceAlias Property Alias_Captain02 Auto Const mandatory
ReferenceAlias Property Alias_Captain03 Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
LeveledActor Property SEDerelict_LChar_HexapodAGlider Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACockroach Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidACoralbug Auto Const mandatory
LeveledActor Property SEDerelict_LChar_MantidAHookneck Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAExocrawler Auto Const mandatory
LeveledActor Property SEDerelict_LChar_OctopedeAMaggotCrab Auto Const mandatory
RefCollectionAlias Property Alias_creatures Auto Const mandatory
RefCollectionAlias Property Alias_turretSpawnMarkers Auto Const mandatory
RefCollectionAlias Property Alias_Computers Auto Const mandatory
Keyword Property LinkTerminalSecurityDoor Auto Const mandatory
Keyword Property LinkTerminalTurret Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_SoftAlarm Auto Const mandatory
Faction Property CaptiveFaction Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarkerCaptain Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0009_Item_00()
  Actor CaptainRef = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:7
  CaptainRef.RemoveFromFaction(CaptiveFaction) ; #DEBUG_LINE_NO:9
  CaptainRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference[] MarkersRef = Alias_CrewSpawnMarkers.GetArray() ; #DEBUG_LINE_NO:18
  Int k = Utility.RandomInt(0, 5) ; #DEBUG_LINE_NO:19
  Int I = 0 ; #DEBUG_LINE_NO:20
  If k == 0 ; #DEBUG_LINE_NO:22
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:23
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_HexapodAGlider as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:24
      I += 1 ; #DEBUG_LINE_NO:25
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 1 ; #DEBUG_LINE_NO:27
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:28
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACockroach as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:29
      I += 1 ; #DEBUG_LINE_NO:30
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 2 ; #DEBUG_LINE_NO:32
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:33
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidACoralbug as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:34
      I += 1 ; #DEBUG_LINE_NO:35
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 3 ; #DEBUG_LINE_NO:37
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:38
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_MantidAHookneck as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:39
      I += 1 ; #DEBUG_LINE_NO:40
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 4 ; #DEBUG_LINE_NO:42
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:43
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAExocrawler as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:44
      I += 1 ; #DEBUG_LINE_NO:45
    EndWhile ; #DEBUG_LINE_NO:
  ElseIf k == 5 ; #DEBUG_LINE_NO:47
    While I < 7 && I < MarkersRef.Length ; #DEBUG_LINE_NO:48
      Alias_creatures.AddRef(MarkersRef[I].PlaceAtMe(SEDerelict_LChar_OctopedeAMaggotCrab as Form, 1, False, False, True, None, None, True)) ; #DEBUG_LINE_NO:49
      I += 1 ; #DEBUG_LINE_NO:50
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] ComputerRefs = Alias_Computers.GetArray() ; #DEBUG_LINE_NO:54
  Int p = 0 ; #DEBUG_LINE_NO:57
  While p < ComputerRefs.Length ; #DEBUG_LINE_NO:58
    If ComputerRefs[p].GetLinkedRef(LinkTerminalTurret) == None && ComputerRefs[I].GetLinkedRef(LinkTerminalSecurityDoor) == None ; #DEBUG_LINE_NO:59
      ComputerRefs[p].SetLockLevel(255) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    p += 1 ; #DEBUG_LINE_NO:62
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Captain.GetRef().IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0010_Item_01()
  ObjectReference CaptainRef = Alias_Captain01.GetRef() ; #DEBUG_LINE_NO:75
  CaptainRef.EnableNoWait(False) ; #DEBUG_LINE_NO:77
  Alias_Captain.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0010_Item_02()
  ObjectReference CaptainRef = Alias_Captain02.GetRef() ; #DEBUG_LINE_NO:88
  CaptainRef.EnableNoWait(False) ; #DEBUG_LINE_NO:90
  Alias_Captain.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0010_Item_03()
  ObjectReference CaptainRef = Alias_Captain03.GetRef() ; #DEBUG_LINE_NO:101
  CaptainRef.EnableNoWait(False) ; #DEBUG_LINE_NO:103
  Alias_Captain.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0015_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:112
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:113
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:116
  If !Self.GetStageDone(66) && !SE_KT01.GetStageDone(6) ; #DEBUG_LINE_NO:117
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:118
    BE_KT01_SceneStart.Start() ; #DEBUG_LINE_NO:119
  EndIf ; #DEBUG_LINE_NO:
  Alias_SoftAlarm.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:123
  kmyQuest.SetShipHazard(None) ; #DEBUG_LINE_NO:124
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:125
  Alias_Captain.GetRef().IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:127
  Alias_EnemyShip.GetShipRef().SetValue(SpaceshipCrew, 1.0) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_KT01_SceneWelcome.Start() ; #DEBUG_LINE_NO:139
  SE_KT01.SetStage(30) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:149
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:150
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:153
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:155
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:156
  Alias_EnemyShip.GetShipRef().SetGhost(False) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0050_Item_00()
  If !Self.GetStageDone(15) ; #DEBUG_LINE_NO:184
    wwiseevent.StopInstance(BE_KT01_InstanceID.GetValueInt()) ; #DEBUG_LINE_NO:185
    Alias_Captain.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:186
  EndIf ; #DEBUG_LINE_NO:
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:189
  If Self.GetStageDone(100) && !Self.GetStageDone(66) ; #DEBUG_LINE_NO:191
    enemyShipRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:192
    enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Captain.GetRef().MoveTo(Alias_SpawnMarkerCaptain.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_PilotSeat.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:210
  Alias_EnemyShip.GetShipRef().SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:211
  SE_KT01.SetStage(66) ; #DEBUG_LINE_NO:212
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_1000_Item_00()
  wwiseevent.StopInstance(BE_KT01_InstanceID.GetValueInt()) ; #DEBUG_LINE_NO:224
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:225
  Self.Stop() ; #DEBUG_LINE_NO:226
EndFunction
