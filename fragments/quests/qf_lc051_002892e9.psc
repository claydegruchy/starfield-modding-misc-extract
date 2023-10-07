ScriptName Fragments:Quests:QF_LC051_002892E9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TestGuard Auto Const mandatory
ReferenceAlias Property Alias_GuardEnableMarker Auto Const mandatory
RefCollectionAlias Property Alias_RDGuards Auto Const mandatory
ReferenceAlias Property Alias_EmployeeEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorRD Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorOffice Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorMarketing Auto Const mandatory
ReferenceAlias Property Alias_ElevFloorExecutive Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerRD Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerOffice Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerMarketing Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerExecutive Auto Const mandatory
RefCollectionAlias Property Alias_Turrets Auto Const mandatory
RefCollectionAlias Property Alias_MarketingEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_MarketingEmployeesSafe Auto Const mandatory
Faction Property TestAustinFFactionInfinity Auto Const
Faction Property TestAustinFFactionInfinityPlayer Auto Const
RefCollectionAlias Property Alias_RDEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_RDEmployeesSafe Auto Const mandatory
ReferenceAlias Property Alias_TrespassTriggerRD02 Auto Const mandatory
RefCollectionAlias Property Alias_OfficeEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_OfficeEmployeesSafe Auto Const mandatory
RefCollectionAlias Property Alias_ExecutiveEmployeesTrespass Auto Const mandatory
RefCollectionAlias Property Alias_ExecutiveEmployeesSafe Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Starstation_Hostile Auto Const
ReferenceAlias Property Alias_ElevFloorRoof Auto Const mandatory
Explosion Property GrenadeLauncherExplosion Auto Const
ReferenceAlias Property Alias_ExplosionXmarker Auto Const mandatory
ReferenceAlias Property Alias_NueroampSecuirtyDoor Auto Const mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const
ReferenceAlias Property Alias_DrexlerOfficeDoor Auto Const mandatory
ReferenceAlias Property Alias_DamagedPipe Auto Const mandatory
RefCollectionAlias Property Alias_DamagedPipes Auto Const mandatory
wwiseevent Property WwiseEvent_QST_RI07_Machine_Malfunction Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Machine_Malfunction_Alarm Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Security_Alarm_Play Auto Const
wwiseevent Property WwiseEvent_QST_RI07_Security_Alarm_Stop Auto Const
ReferenceAlias Property Alias_Harper Auto Const mandatory
ReferenceAlias Property Alias_Stanley Auto Const mandatory
ReferenceAlias Property Alias_Angelo Auto Const mandatory
ReferenceAlias Property Alias_ExteriorElevator Auto Const mandatory
ReferenceAlias Property Alias_Lucas Auto Const mandatory
ReferenceAlias Property Alias_Faye Auto Const mandatory
ReferenceAlias Property Alias_PostQuestGuardDisableMarker Auto Const mandatory
ReferenceAlias Property Alias_GasEnableMarker Auto Const mandatory
wwiseevent Property Wwise_Event_OBJ_Alarm_Generic_Play Auto Const
ReferenceAlias Property Alias_GeneratorAlarmSoundMarker Auto Const mandatory
Quest Property RI_Support Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  WwiseEvent_QST_RI07_Security_Alarm_Play.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddToFaction(LC051InfinityLTDPEnemyFaction) ; #DEBUG_LINE_NO:9
  Alias_GuardEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:10
  Self.setstage(605) ; #DEBUG_LINE_NO:12
  Alias_RDEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:14
  Alias_OfficeEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:15
  Alias_MarketingEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:16
  Alias_ExecutiveEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:17
  Int GuardCount = Alias_RDGuards.GetCount() ; #DEBUG_LINE_NO:19
  Int currentGuardIndex = 0 ; #DEBUG_LINE_NO:20
  While currentGuardIndex < GuardCount ; #DEBUG_LINE_NO:22
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0) ; #DEBUG_LINE_NO:23
    currentGuardIndex += 1 ; #DEBUG_LINE_NO:24
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  WwiseEvent_QST_RI07_Machine_Malfunction.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:34
  WwiseEvent_QST_RI07_Machine_Malfunction_Alarm.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:35
  Alias_EmployeeEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:37
  Alias_Harper.getref().disable(False) ; #DEBUG_LINE_NO:38
  Alias_Stanley.getref().disable(False) ; #DEBUG_LINE_NO:39
  Alias_Angelo.getref().disable(False) ; #DEBUG_LINE_NO:40
  Alias_Lucas.getref().disable(False) ; #DEBUG_LINE_NO:41
  Alias_Faye.getref().disable(False) ; #DEBUG_LINE_NO:42
  Alias_GuardEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:43
  Alias_GasEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:44
  Int GuardCount = Alias_RDGuards.GetCount() ; #DEBUG_LINE_NO:46
  Int currentGuardIndex = 0 ; #DEBUG_LINE_NO:47
  While currentGuardIndex < GuardCount ; #DEBUG_LINE_NO:49
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0) ; #DEBUG_LINE_NO:50
    currentGuardIndex += 1 ; #DEBUG_LINE_NO:51
  EndWhile ; #DEBUG_LINE_NO:
  Int TurretCount = Alias_Turrets.GetCount() ; #DEBUG_LINE_NO:55
  Int currentTurretIndex = 0 ; #DEBUG_LINE_NO:56
  While currentTurretIndex < TurretCount ; #DEBUG_LINE_NO:58
    (Alias_Turrets.GetAt(currentTurretIndex) as Actor).SetUnconscious(False) ; #DEBUG_LINE_NO:59
    currentTurretIndex += 1 ; #DEBUG_LINE_NO:60
  EndWhile ; #DEBUG_LINE_NO:
  Alias_DrexlerOfficeDoor.getref().Unlock(False) ; #DEBUG_LINE_NO:64
  Alias_DrexlerOfficeDoor.getref().SetOpen(True) ; #DEBUG_LINE_NO:65
  Int PipeCount = Alias_DamagedPipes.GetCount() ; #DEBUG_LINE_NO:68
  Int currentPipeIndex = 0 ; #DEBUG_LINE_NO:69
  While currentPipeIndex < PipeCount ; #DEBUG_LINE_NO:71
    Alias_DamagedPipes.GetAt(currentPipeIndex).DamageObject(2000.0) ; #DEBUG_LINE_NO:72
    currentPipeIndex += 1 ; #DEBUG_LINE_NO:73
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_ExplosionXmarker.getref().PlaceatMe(GrenadeLauncherExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:82
  Alias_NueroampSecuirtyDoor.getref().SetOpen(True) ; #DEBUG_LINE_NO:83
  Actor Linkedguard = Alias_ExplosionXmarker.getref().GetLinkedRef(None) as Actor ; #DEBUG_LINE_NO:84
  Linkedguard.kill(None) ; #DEBUG_LINE_NO:86
  Alias_RDEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:90
  Int GuardCount = Alias_RDGuards.GetCount() ; #DEBUG_LINE_NO:92
  Int currentGuardIndex = 0 ; #DEBUG_LINE_NO:93
  While currentGuardIndex < GuardCount ; #DEBUG_LINE_NO:95
    Alias_RDGuards.GetAt(currentGuardIndex).SetValue(Game.GetSuspiciousAV(), 1.0) ; #DEBUG_LINE_NO:96
    currentGuardIndex += 1 ; #DEBUG_LINE_NO:97
  EndWhile ; #DEBUG_LINE_NO:
  Alias_GeneratorAlarmSoundMarker.getref().enable(False) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0500_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorRD.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:108
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0510_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorOffice.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:117
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0520_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:126
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0530_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorExecutive.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:135
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0540_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorRoof.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:144
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0600_Item_00()
  If !Self.GetStageDone(10) ; #DEBUG_LINE_NO:153
    Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass) ; #DEBUG_LINE_NO:154
    Alias_RDEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:155
    Alias_RDEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:156
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0605_Item_00()
  Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe) ; #DEBUG_LINE_NO:165
  Alias_RDEmployeesSafe.RemoveAll() ; #DEBUG_LINE_NO:166
  Alias_RDEmployeesTrespass.EvaluateAll() ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_0610_Item_00()
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass) ; #DEBUG_LINE_NO:175
  Alias_OfficeEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:176
  Alias_OfficeEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0620_Item_00()
  loadelevatorfloorscript floorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:185
  floorScript.SetAccessible(True) ; #DEBUG_LINE_NO:186
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass) ; #DEBUG_LINE_NO:188
  Alias_MarketingEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:189
  Alias_MarketingEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0630_Item_00()
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass) ; #DEBUG_LINE_NO:198
  Alias_ExecutiveEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:199
  Alias_ExecutiveEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:200
EndFunction

Function Fragment_Stage_0700_Item_00()
  Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass) ; #DEBUG_LINE_NO:209
  Alias_RDEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:210
  Alias_RDEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:211
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass) ; #DEBUG_LINE_NO:214
  Alias_OfficeEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:215
  Alias_OfficeEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:216
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass) ; #DEBUG_LINE_NO:219
  Alias_MarketingEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:220
  Alias_MarketingEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:221
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass) ; #DEBUG_LINE_NO:224
  Alias_ExecutiveEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:225
  Alias_ExecutiveEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_0710_Item_00()
  Alias_RDEmployeesTrespass.AddRefCollection(Alias_RDEmployeesSafe) ; #DEBUG_LINE_NO:235
  Alias_RDEmployeesSafe.RemoveAll() ; #DEBUG_LINE_NO:236
  Alias_RDEmployeesTrespass.EvaluateAll() ; #DEBUG_LINE_NO:237
  Alias_OfficeEmployeesTrespass.AddRefCollection(Alias_OfficeEmployeesSafe) ; #DEBUG_LINE_NO:240
  Alias_OfficeEmployeesSafe.RemoveAll() ; #DEBUG_LINE_NO:241
  Alias_OfficeEmployeesTrespass.EvaluateAll() ; #DEBUG_LINE_NO:242
  Alias_MarketingEmployeesTrespass.AddRefCollection(Alias_MarketingEmployeesSafe) ; #DEBUG_LINE_NO:245
  Alias_MarketingEmployeesSafe.RemoveAll() ; #DEBUG_LINE_NO:246
  Alias_MarketingEmployeesTrespass.EvaluateAll() ; #DEBUG_LINE_NO:247
  Alias_ExecutiveEmployeesTrespass.AddRefCollection(Alias_ExecutiveEmployeesSafe) ; #DEBUG_LINE_NO:250
  Alias_ExecutiveEmployeesSafe.RemoveAll() ; #DEBUG_LINE_NO:251
  Alias_ExecutiveEmployeesTrespass.EvaluateAll() ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_1000_Item_00()
  RI_Support.setstage(6020) ; #DEBUG_LINE_NO:261
  loadelevatorfloorscript RDFloorScript = Alias_ElevFloorRD.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:263
  RDFloorScript.SetAccessible(True) ; #DEBUG_LINE_NO:264
  loadelevatorfloorscript GenOFficeFloorScript = Alias_ElevFloorOffice.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:265
  GenOFficeFloorScript.SetAccessible(True) ; #DEBUG_LINE_NO:266
  loadelevatorfloorscript MarketingFloorScript = Alias_ElevFloorMarketing.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:267
  MarketingFloorScript.SetAccessible(True) ; #DEBUG_LINE_NO:268
  loadelevatorfloorscript ExecutiveFloorScript = Alias_ElevFloorExecutive.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:269
  ExecutiveFloorScript.SetAccessible(True) ; #DEBUG_LINE_NO:270
  loadelevatorfloorscript RoofFloorScript = Alias_ElevFloorRoof.getref() as loadelevatorfloorscript ; #DEBUG_LINE_NO:271
  RoofFloorScript.SetAccessible(True) ; #DEBUG_LINE_NO:272
  Alias_RDEmployeesSafe.AddRefCollection(Alias_RDEmployeesTrespass) ; #DEBUG_LINE_NO:275
  Alias_RDEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:276
  Alias_RDEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:277
  Alias_OfficeEmployeesSafe.AddRefCollection(Alias_OfficeEmployeesTrespass) ; #DEBUG_LINE_NO:280
  Alias_OfficeEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:281
  Alias_OfficeEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:282
  Alias_MarketingEmployeesSafe.AddRefCollection(Alias_MarketingEmployeesTrespass) ; #DEBUG_LINE_NO:285
  Alias_MarketingEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:286
  Alias_MarketingEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:287
  Alias_ExecutiveEmployeesSafe.AddRefCollection(Alias_ExecutiveEmployeesTrespass) ; #DEBUG_LINE_NO:290
  Alias_ExecutiveEmployeesTrespass.RemoveAll() ; #DEBUG_LINE_NO:291
  Alias_ExecutiveEmployeesSafe.EvaluateAll() ; #DEBUG_LINE_NO:292
  Alias_Lucas.getref().disable(False) ; #DEBUG_LINE_NO:294
  Alias_Faye.getref().disable(False) ; #DEBUG_LINE_NO:295
  Alias_GasEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:297
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_EmployeeEnableMarker.getref().disable(False) ; #DEBUG_LINE_NO:305
  Alias_PostQuestGuardDisableMarker.getref().disable(False) ; #DEBUG_LINE_NO:306
  Alias_Harper.getref().disable(False) ; #DEBUG_LINE_NO:307
  Alias_Stanley.getref().disable(False) ; #DEBUG_LINE_NO:308
  Alias_Angelo.getref().disable(False) ; #DEBUG_LINE_NO:309
  Alias_Lucas.getref().disable(False) ; #DEBUG_LINE_NO:310
  Alias_Faye.getref().disable(False) ; #DEBUG_LINE_NO:311
  (Alias_ExteriorElevator.getref() as loadelevatormanagerscript).SetElevatorOperational(False) ; #DEBUG_LINE_NO:312
EndFunction
