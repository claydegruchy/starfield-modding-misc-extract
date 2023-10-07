ScriptName Fragments:Quests:QF_DialogueRedDevilsHQ_001E7A0B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property UCR04 Auto Const mandatory
GlobalVariable Property UC04_JakobSandboxing_PostUC03 Auto Const mandatory
ReferenceAlias Property Alias_Jakob Auto Const mandatory
ObjectReference Property UC07_JakobTeleportMarker Auto Const mandatory
GlobalVariable Property UC09_KaiserSandboxing_PostUC08 Auto Const mandatory
ReferenceAlias Property Alias_Kaiser Auto Const mandatory
ObjectReference Property UCR04_DebugMarker Auto Const mandatory
Quest Property UC09 Auto Const mandatory
ObjectReference Property UC09_KaiserTeleportMarker Auto Const mandatory
Quest Property DialogueUCNewAtlantisUCFaction Auto Const mandatory
Scene Property DialogueRedDevilsHQ_000_Hadrian_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06 Auto Const mandatory
ReferenceAlias Property Alias_ExteriorGuard Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage02_LateUC07 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage02_LateUC07 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Aliens_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_Hadrian Auto Const mandatory
GlobalVariable Property UC05_HadrianSandboxing_PostUC05 Auto Const mandatory
Quest Property UC09_PostQuestline_HadrianScene Auto Const mandatory
Key Property UC03_RedDevilsHQKey Auto Const mandatory
Quest Property UC07 Auto Const mandatory
Quest Property UC08 Auto Const mandatory
GlobalVariable Property UC_RHQ_RCAllowed Auto Const mandatory
Quest Property CREW_EliteCrew_Hadrian Auto Const mandatory
Quest Property UCR04_MiscPointer Auto Const mandatory
ReferenceAlias Property Alias_ExteriorMarine Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects Auto Const mandatory
ObjectReference Property RHQ_ExtDebugMarker Auto Const
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09 Auto Const mandatory
ReferenceAlias Property Alias_RHQEnableMarker_Mine_Stage03_PostUC09 Auto Const mandatory
RefCollectionAlias Property Alias_IntroSceneNPCs Auto Const mandatory
ReferenceAlias Property Alias_ShipServices Auto Const mandatory
ReferenceAlias Property Alias_HQMapMarker Auto Const mandatory
LocationAlias Property Alias_LC028FreightElevatorLoc Auto Const mandatory
LocationAlias Property Alias_LandingCellNameOverride Auto Const mandatory
LocationAlias Property Alias_InteriorCellNameOverride Auto Const mandatory
LocationAlias Property Alias_POI064RedDevilsHQ Auto Const mandatory
ReferenceAlias Property Alias_RHQElevatorManager Auto Const mandatory
Message Property UC_RHQ_TMDNameOverride Auto Const mandatory
ReferenceAlias Property Alias_RHQ_FloorMarker_Int Auto Const mandatory
ReferenceAlias Property Alias_RHQ_FloorMarker_Ext Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True) ; #DEBUG_LINE_NO:7
  ObjectReference MMRef = Alias_HQMapMarker.GetRef() ; #DEBUG_LINE_NO:8
  MMRef.Enable(False) ; #DEBUG_LINE_NO:9
  MMRef.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:10
  UC04_JakobSandboxing_PostUC03.SetValue(1.0) ; #DEBUG_LINE_NO:14
  Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
  UC09_KaiserSandboxing_PostUC08.SetValue(1.0) ; #DEBUG_LINE_NO:18
  Actor KaiACT = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:19
  KaiACT.MoveTo(UC09_KaiserTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:20
  KaiACT.Enable(False) ; #DEBUG_LINE_NO:21
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0) ; #DEBUG_LINE_NO:24
  Actor HadACT = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:25
  HadACT.MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
  HadACT.Enable(False) ; #DEBUG_LINE_NO:27
  UC08.SetStage(150) ; #DEBUG_LINE_NO:29
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:30
  UC08.SetStage(1000) ; #DEBUG_LINE_NO:31
  UC09.Start() ; #DEBUG_LINE_NO:32
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:33
  UC09.SetStage(500) ; #DEBUG_LINE_NO:34
  Self.SetStage(7) ; #DEBUG_LINE_NO:35
  Self.SetStage(10) ; #DEBUG_LINE_NO:36
  Self.SetStage(20) ; #DEBUG_LINE_NO:37
  Self.SetStage(30) ; #DEBUG_LINE_NO:38
  Self.SetStage(35) ; #DEBUG_LINE_NO:39
  DialogueUCNewAtlantisUCFaction.SetStage(550) ; #DEBUG_LINE_NO:40
  DialogueUCNewAtlantisUCFaction.SetStage(600) ; #DEBUG_LINE_NO:41
  DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:42
  UC_RHQ_RCAllowed.SetValue(1.0) ; #DEBUG_LINE_NO:45
  If !UCR04.IsRunning() ; #DEBUG_LINE_NO:47
    Game.GetPlayer().MoveTo(UCR04_DebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:48
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0002_Item_00()
  UC07.SetStage(1) ; #DEBUG_LINE_NO:57
  UC_RHQ_RCAllowed.SetValue(1.0) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0003_Item_00()
  UC07.SetStage(9) ; #DEBUG_LINE_NO:68
  UC07.SetStage(1000) ; #DEBUG_LINE_NO:69
  UC08.SetStage(150) ; #DEBUG_LINE_NO:70
  UC_RHQ_RCAllowed.SetValue(1.0) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(12) ; #DEBUG_LINE_NO:81
  Self.SetStage(32) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0005_Item_00()
  Game.GetPlayer().AddItem(UC03_RedDevilsHQKey as Form, 1, True) ; #DEBUG_LINE_NO:90
  ObjectReference MMRef = Alias_HQMapMarker.GetRef() ; #DEBUG_LINE_NO:91
  MMRef.Enable(False) ; #DEBUG_LINE_NO:92
  MMRef.SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:93
  UC04_JakobSandboxing_PostUC03.SetValue(1.0) ; #DEBUG_LINE_NO:96
  Alias_Jakob.GetRef().MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:97
  UC09_KaiserSandboxing_PostUC08.SetValue(1.0) ; #DEBUG_LINE_NO:100
  Actor KaiACT = Alias_Kaiser.GetActorRef() ; #DEBUG_LINE_NO:101
  KaiACT.MoveTo(UC09_KaiserTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  KaiACT.Enable(False) ; #DEBUG_LINE_NO:103
  UC05_HadrianSandboxing_PostUC05.SetValue(1.0) ; #DEBUG_LINE_NO:106
  Actor HadACT = Alias_Hadrian.GetActorRef() ; #DEBUG_LINE_NO:107
  HadACT.MoveTo(UC07_JakobTeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:108
  HadACT.Enable(False) ; #DEBUG_LINE_NO:109
  UC08.SetStage(150) ; #DEBUG_LINE_NO:111
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:112
  UC08.SetStage(1000) ; #DEBUG_LINE_NO:113
  UC09.Start() ; #DEBUG_LINE_NO:114
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:115
  UC09.SetStage(500) ; #DEBUG_LINE_NO:116
  Self.SetStage(7) ; #DEBUG_LINE_NO:117
  Self.SetStage(10) ; #DEBUG_LINE_NO:118
  Self.SetStage(20) ; #DEBUG_LINE_NO:119
  Self.SetStage(30) ; #DEBUG_LINE_NO:120
  Self.SetStage(35) ; #DEBUG_LINE_NO:121
  Self.SetStage(500) ; #DEBUG_LINE_NO:122
  DialogueUCNewAtlantisUCFaction.SetStage(550) ; #DEBUG_LINE_NO:123
  DialogueUCNewAtlantisUCFaction.SetStage(600) ; #DEBUG_LINE_NO:124
  DialogueUCNewAtlantisUCFaction.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:125
  If !UCR04.IsRunning() ; #DEBUG_LINE_NO:127
    Game.GetPlayer().MoveTo(RHQ_ExtDebugMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0007_Item_00()
  (Alias_RHQ_FloorMarker_Ext.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:137
  (Alias_RHQ_FloorMarker_Int.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_ExteriorGuard.GetRef().Enable(False) ; #DEBUG_LINE_NO:146
  Alias_ShipServices.GetRef().Enable(False) ; #DEBUG_LINE_NO:147
  Alias_RHQEnableMarker_General_Stage01_PostUC06.GetRef().Enable(False) ; #DEBUG_LINE_NO:148
  Alias_RHQEnableMarker_General_Stage01_PostUC06_Objects.GetRef().Disable(False) ; #DEBUG_LINE_NO:149
  Alias_RHQEnableMarker_General_Stage01_PostUC06_DeepMines.GetRef().Disable(False) ; #DEBUG_LINE_NO:150
  Alias_RHQEnableMarker_General_Stage01_PostUC06_Freight.GetRef().Disable(False) ; #DEBUG_LINE_NO:151
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_RHQEnableMarker_FCObservers_Stage01_PostUC06.GetRef().Enable(False) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_RHQEnableMarker_General_Stage02_LateUC07.GetRef().Enable(False) ; #DEBUG_LINE_NO:167
  Alias_RHQEnableMarker_Aliens_Stage02_LateUC07.GetRef().Enable(False) ; #DEBUG_LINE_NO:168
  Alias_ExteriorMarine.GetRef().Enable(False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_RHQEnableMarker_General_Stage03_PostUC09.GetRef().Enable(False) ; #DEBUG_LINE_NO:177
  Alias_RHQEnableMarker_Aliens_Stage03_PostUC09.GetRef().Enable(False) ; #DEBUG_LINE_NO:178
  Alias_RHQEnableMarker_FreightElevator_Stage03_PostUC09.GetRef().Enable(False) ; #DEBUG_LINE_NO:179
  Alias_RHQEnableMarker_Mine_Stage03_PostUC09.GetRef().Enable(False) ; #DEBUG_LINE_NO:180
  Self.SetStage(35) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_RHQEnableMarker_FCObservers_Stage03_PostUC09.GetRef().Enable(False) ; #DEBUG_LINE_NO:189
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_LandingCellNameOverride.ForceLocationTo(Alias_LC028FreightElevatorLoc.GetLocation()) ; #DEBUG_LINE_NO:197
  Alias_InteriorCellNameOverride.ForceLocationTo(Alias_POI064RedDevilsHQ.GetLocation()) ; #DEBUG_LINE_NO:198
  (Alias_RHQElevatorManager.GetRef() as loadelevatormanagerscript).SetFirstFloorName(UC_RHQ_TMDNameOverride) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0120_Item_00()
  UCR04_MiscPointer.Start() ; #DEBUG_LINE_NO:207
  CREW_EliteCrew_Hadrian.SetStage(1) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0200_Item_00()
  DialogueUCNewAtlantisUCFaction.SetStage(650) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0350_Item_00()
  UCR04.SetStage(350) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0401_Item_00()
  Self.SetStage(400) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0500_Item_00()
  UC_RHQ_RCAllowed.SetValue(0.0) ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_0505_Item_00()
  DialogueRedDevilsHQ_000_Hadrian_IntroScene.Start() ; #DEBUG_LINE_NO:250
EndFunction

Function Fragment_Stage_0510_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:258
  rhq_questscript kmyQuest = __temp as rhq_questscript ; #DEBUG_LINE_NO:259
  UC_RHQ_RCAllowed.SetValue(1.0) ; #DEBUG_LINE_NO:263
  kmyQuest.StaggerEVP(Alias_IntroSceneNPCs) ; #DEBUG_LINE_NO:266
EndFunction

Function Fragment_Stage_0600_Item_00()
  If UC08.IsRunning() && !UC08.GetStageDone(165) && !UC08.GetStageDone(1000) ; #DEBUG_LINE_NO:275
    UC08.SetStage(151) ; #DEBUG_LINE_NO:276
  EndIf ; #DEBUG_LINE_NO:
EndFunction
