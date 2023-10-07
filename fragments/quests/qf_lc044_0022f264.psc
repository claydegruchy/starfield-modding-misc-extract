ScriptName Fragments:Quests:QF_LC044_0022F264 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property RI04GuardEnableMarker Auto Const
Faction Property LC044RyujinGuardCrimeFaction Auto Const
Cell Property LC044RyujinIndustriesHQ Auto Const
ObjectReference Property RI04SettlementNPCEnableMarker Auto Const
ReferenceAlias Property Alias_ElevFloor03 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor04 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor05 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor06 Auto Const mandatory
Faction Property LC044RyujinGuardEnemeyFaction Auto Const
RefCollectionAlias Property Alias_AllGuardsTrespass Auto Const mandatory
RefCollectionAlias Property Alias_AllGuardsSafe Auto Const mandatory
Float Property Speed Auto Const
ObjectReference Property CraneRotationHelper Auto Const
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Camden Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_DoorFloor02 Auto Const mandatory
ObjectReference Property OfficeConstructionEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_Nina Auto Const mandatory
ReferenceAlias Property Alias_NinaRyujinMarker Auto Const mandatory
ReferenceAlias Property Alias_Yuko Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor01 Auto Const mandatory
ReferenceAlias Property Alias_ElevFloor02 Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter04Enable Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter06Enable Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter07Enable Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter04 Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter06 Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter07 Auto Const mandatory
ObjectReference Property RI04LightEnableMarker Auto Const
Quest Property LC044Jail Auto Const
ReferenceAlias Property Alias_LightsEnableMarkerFloor03 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor04 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor05 Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor06 Auto Const mandatory
RefCollectionAlias Property Alias_VentDoors Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellDoor Auto Const mandatory
ReferenceAlias Property Alias_CamdenOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_ElevatorManager Auto Const mandatory
Message Property LC044LoadElevatorFloorNames_PostQuest Auto Const mandatory
GlobalVariable Property RI06_Track_PlayerWitholdsClinicNames Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
ReferenceAlias Property Alias_LightsEnableMarkerFloor03Construction Auto Const mandatory
ReferenceAlias Property Alias_InfinityConstructionEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_InfinityOfficeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_ExecutiveGenericNPCs Auto Const mandatory
ReferenceAlias Property Alias_RobotBoss Auto Const mandatory
wwiseevent Property QST_RI04_CraneMove Auto Const
ReferenceAlias Property Alias_CraneSound Auto Const mandatory
ReferenceAlias Property Alias_LobbyGuardEnableMarker Auto Const mandatory
GlobalVariable Property CrowdDisableRyujin Auto Const mandatory
ReferenceAlias Property Alias_FC_Neon_CT_CityLife_Encounter05Enable Auto Const mandatory
Quest Property FC_Neon_CT_CityLife_Encounter05 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  LC044Jail.Start() ; #DEBUG_LINE_NO:7
  CrowdDisableRyujin.SetValue(1.0) ; #DEBUG_LINE_NO:8
  RI04SettlementNPCEnableMarker.Disable(False) ; #DEBUG_LINE_NO:9
  Alias_ExecutiveGenericNPCs.GetRef().Disable(False) ; #DEBUG_LINE_NO:10
  Alias_Masako.GetRef().Disable(False) ; #DEBUG_LINE_NO:11
  Alias_Ularu.GetRef().Disable(False) ; #DEBUG_LINE_NO:12
  Alias_Imogene.GetRef().Disable(False) ; #DEBUG_LINE_NO:13
  Alias_Camden.GetRef().Disable(False) ; #DEBUG_LINE_NO:14
  Alias_Yuko.GetRef().Disable(False) ; #DEBUG_LINE_NO:15
  Alias_LobbyGuardEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:16
  Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Disable(False) ; #DEBUG_LINE_NO:18
  Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Disable(False) ; #DEBUG_LINE_NO:19
  Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Disable(False) ; #DEBUG_LINE_NO:20
  Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Disable(False) ; #DEBUG_LINE_NO:21
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:26
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(False) ; #DEBUG_LINE_NO:29
  Alias_DoorFloor02.GetRef().Lock(False, True, True) ; #DEBUG_LINE_NO:32
  Alias_VentDoors.BlockActivation(False, False) ; #DEBUG_LINE_NO:35
  Alias_HoldingCellDoor.GetRef().BlockActivation(False, False) ; #DEBUG_LINE_NO:36
  (RI_Support as ri_radiantsupportquestscript).UnlockVentDoors() ; #DEBUG_LINE_NO:37
  Alias_CamdenOfficeDoor.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:40
  Alias_CamdenOfficeDoor.GetRef().SetLockLevel(25) ; #DEBUG_LINE_NO:41
  Alias_MasakoOfficeDoor.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:42
  Alias_MasakoOfficeDoor.GetRef().SetLockLevel(100) ; #DEBUG_LINE_NO:43
  Alias_LobbyGuardEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:45
  RI04GuardEnableMarker.Enable(False) ; #DEBUG_LINE_NO:47
  Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe) ; #DEBUG_LINE_NO:49
  Alias_AllGuardsSafe.RemoveAll() ; #DEBUG_LINE_NO:50
  Alias_AllGuardsTrespass.EvaluateAll() ; #DEBUG_LINE_NO:51
  (Alias_RobotBoss.GetRef() as robotpodscript).WakeRobotFromPod() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0011_Item_00()
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0013_Item_00()
  Alias_AllGuardsTrespass.EvaluateAll() ; #DEBUG_LINE_NO:71
  LC044Jail.SetStage(27) ; #DEBUG_LINE_NO:72
  Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass) ; #DEBUG_LINE_NO:73
  Alias_AllGuardsTrespass.RemoveAll() ; #DEBUG_LINE_NO:74
  Alias_AllGuardsSafe.EvaluateAll() ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_AllGuardsTrespass.EvaluateAll() ; #DEBUG_LINE_NO:83
  Alias_AllGuardsSafe.AddRefCollection(Alias_AllGuardsTrespass) ; #DEBUG_LINE_NO:84
  Alias_AllGuardsTrespass.RemoveAll() ; #DEBUG_LINE_NO:85
  Alias_AllGuardsSafe.EvaluateAll() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0017_Item_00()
  Alias_AllGuardsTrespass.AddRefCollection(Alias_AllGuardsSafe) ; #DEBUG_LINE_NO:94
  Alias_AllGuardsSafe.RemoveAll() ; #DEBUG_LINE_NO:95
  Alias_AllGuardsTrespass.EvaluateAll() ; #DEBUG_LINE_NO:96
  Game.GetPlayer().AddToFaction(LC044RyujinGuardEnemeyFaction) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0020_Item_00()
  LC044Jail.Stop() ; #DEBUG_LINE_NO:106
  CrowdDisableRyujin.SetValue(0.0) ; #DEBUG_LINE_NO:107
  RI04GuardEnableMarker.Disable(False) ; #DEBUG_LINE_NO:108
  RI04SettlementNPCEnableMarker.Enable(False) ; #DEBUG_LINE_NO:109
  Alias_ExecutiveGenericNPCs.GetRef().Enable(False) ; #DEBUG_LINE_NO:110
  Alias_Masako.GetRef().Enable(False) ; #DEBUG_LINE_NO:111
  Alias_Ularu.GetRef().Enable(False) ; #DEBUG_LINE_NO:112
  Alias_Imogene.GetRef().Enable(False) ; #DEBUG_LINE_NO:113
  Alias_Camden.GetRef().Enable(False) ; #DEBUG_LINE_NO:114
  Alias_Yuko.GetRef().Enable(False) ; #DEBUG_LINE_NO:115
  Alias_RobotBoss.Clear() ; #DEBUG_LINE_NO:116
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetElevatorOperational(True) ; #DEBUG_LINE_NO:119
  If !FC_Neon_CT_CityLife_Encounter04.GetStageDone(100) ; #DEBUG_LINE_NO:122
    Alias_FC_Neon_CT_CityLife_Encounter04Enable.GetRef().Enable(False) ; #DEBUG_LINE_NO:124
  EndIf ; #DEBUG_LINE_NO:
  If !FC_Neon_CT_CityLife_Encounter05.GetStageDone(100) ; #DEBUG_LINE_NO:126
    Alias_FC_Neon_CT_CityLife_Encounter05Enable.GetRef().Enable(False) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
  If !FC_Neon_CT_CityLife_Encounter06.GetStageDone(100) ; #DEBUG_LINE_NO:130
    Alias_FC_Neon_CT_CityLife_Encounter06Enable.GetRef().Enable(False) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
  If !FC_Neon_CT_CityLife_Encounter07.GetStageDone(100) ; #DEBUG_LINE_NO:133
    Alias_FC_Neon_CT_CityLife_Encounter07Enable.GetRef().Enable(False) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Alias_VentDoors.BlockActivation(True, True) ; #DEBUG_LINE_NO:137
  Alias_HoldingCellDoor.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:138
  (RI_Support as ri_radiantsupportquestscript).LockVentDoors() ; #DEBUG_LINE_NO:139
  Alias_CamdenOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:142
  Alias_MasakoOfficeDoor.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:143
  Alias_LightsEnableMarkerFloor03.GetRef().Disable(False) ; #DEBUG_LINE_NO:146
  Alias_LightsEnableMarkerFloor03Construction.GetRef().Enable(False) ; #DEBUG_LINE_NO:147
  Alias_LightsEnableMarkerFloor04.GetRef().Disable(False) ; #DEBUG_LINE_NO:148
  Alias_LightsEnableMarkerFloor05.GetRef().Disable(False) ; #DEBUG_LINE_NO:149
  Alias_LightsEnableMarkerFloor06.GetRef().Disable(False) ; #DEBUG_LINE_NO:150
  (Alias_RobotBoss.GetRef() as robotpodscript).SendRobotToPod() ; #DEBUG_LINE_NO:153
  If Alias_RobotBoss.getactorref().IsDead() ; #DEBUG_LINE_NO:154
    Alias_RobotBoss.getactorref().Disable(False) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor03.GetRef() as loadelevatorfloorscript ; #DEBUG_LINE_NO:164
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0350_Item_00()
  Alias_DoorFloor02.GetRef().Lock(False, True, True) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0400_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor04.GetRef() as loadelevatorfloorscript ; #DEBUG_LINE_NO:181
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0500_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor05.GetRef() as loadelevatorfloorscript ; #DEBUG_LINE_NO:190
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:191
EndFunction

Function Fragment_Stage_0600_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloor06.GetRef() as loadelevatorfloorscript ; #DEBUG_LINE_NO:199
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:200
EndFunction

Function Fragment_Stage_0750_Item_00()
  CraneRotationHelper.PlayAnimation("Play01") ; #DEBUG_LINE_NO:212
  QST_RI04_CraneMove.Play(Alias_CraneSound.GetRef(), None, None) ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_0800_Item_00()
  Alias_LightsEnableMarkerFloor03.GetRef().Enable(False) ; #DEBUG_LINE_NO:221
  Alias_LightsEnableMarkerFloor03Construction.GetRef().Disable(False) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0810_Item_00()
  Alias_LightsEnableMarkerFloor04.GetRef().Enable(False) ; #DEBUG_LINE_NO:230
EndFunction

Function Fragment_Stage_0820_Item_00()
  Alias_LightsEnableMarkerFloor05.GetRef().Enable(False) ; #DEBUG_LINE_NO:238
EndFunction

Function Fragment_Stage_0830_Item_00()
  Alias_LightsEnableMarkerFloor06.GetRef().Enable(False) ; #DEBUG_LINE_NO:246
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:254
  Self.SetStage(200) ; #DEBUG_LINE_NO:255
  Self.SetStage(300) ; #DEBUG_LINE_NO:256
  Self.SetStage(350) ; #DEBUG_LINE_NO:257
  Self.SetStage(400) ; #DEBUG_LINE_NO:258
  Self.SetStage(500) ; #DEBUG_LINE_NO:259
  Self.SetStage(600) ; #DEBUG_LINE_NO:260
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_InfinityOfficeEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:268
  Alias_InfinityConstructionEnableMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:269
  Alias_Nina.GetRef().MoveTo(Alias_NinaRyujinMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:270
  (Alias_ElevatorManager.GetRef() as loadelevatormanagerscript).SetFloorNames(LC044LoadElevatorFloorNames_PostQuest) ; #DEBUG_LINE_NO:272
  Self.Stop() ; #DEBUG_LINE_NO:274
EndFunction
