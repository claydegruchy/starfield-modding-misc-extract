ScriptName Fragments:Quests:QF_MQ404_0006CD98 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ201 Auto Const mandatory
Quest Property MQ201B Auto Const mandatory
ReferenceAlias Property Alias_ArmillaryMount Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
Scene Property MQ404_002_HunterScene Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property MQ206B Auto Const mandatory
ReferenceAlias Property Alias_TheScow Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
Static Property XMarkerHeading Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory
ObjectReference Property ArmillaryMountSwapEnableMarker Auto Const mandatory
Spell Property AbStarbornTeleport Auto Const mandatory
Spell Property AbStarbornDeath Auto Const mandatory
Message Property MQ204ArmillaryBuildMSG_NGPlus Auto Const mandatory
Message Property MQ204ArmillaryBuildMSG Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property Alias_HomeShipArmillaryScreenTrigger Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory
EffectShader Property Starborn_EntryShader Auto Const mandatory
ObjectReference Property MQ202TurretEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If MQ201.IsRunning() ; #DEBUG_LINE_NO:8
    MQ201.SetStage(2000) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
  If MQ201B.IsRunning() ; #DEBUG_LINE_NO:12
    MQ201B.SetStage(2000) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:16
  ArmillaryMountSwapEnableMarker.Disable(False) ; #DEBUG_LINE_NO:19
  Self.SetActive(True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:29
  mq404script kmyQuest = __temp as mq404script ; #DEBUG_LINE_NO:30
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:33
  ObjectReference ArmillaryMountREF = Alias_ArmillaryMount.GetRef() ; #DEBUG_LINE_NO:34
  ObjectReference ArmillaryREF = Alias_Armillary.GetRef() ; #DEBUG_LINE_NO:35
  (ArmillaryREF as armillaryscript).PackupArmillary(PlayerREF) ; #DEBUG_LINE_NO:37
  ArmillaryMountREF.BlockActivation(True, True) ; #DEBUG_LINE_NO:38
  ArmillaryREF.DisableNoWait(False) ; #DEBUG_LINE_NO:39
  kmyQuest.WaitForWorkshopMenuClose() ; #DEBUG_LINE_NO:42
  MQAlllowArmillaryGravDrive.SetValueInt(1) ; #DEBUG_LINE_NO:45
  Alias_HomeShipArmillaryScreenTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:46
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:48
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:50
  MQ204ArmillaryBuildMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0120_Item_01()
  Self.SetStage(130) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0130_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:68
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:69
  ObjectReference HunterMarker = PlayerREF.PlaceAtMe(XMarkerHeading as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:70
  HunterMarker.MoveToNearestNavmeshLocation() ; #DEBUG_LINE_NO:71
  HunterREF.moveto(HunterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:72
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:73
  Starborn_EntryShader.Play(HunterREF as ObjectReference, -1.0) ; #DEBUG_LINE_NO:74
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:75
  MQ404_002_HunterScene.Start() ; #DEBUG_LINE_NO:77
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:79
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:80
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:90
  MQ404_002_HunterScene.Stop() ; #DEBUG_LINE_NO:91
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:93
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:95
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:96
  Starborn_DeathShader.Play(HunterREF as ObjectReference, -1.0) ; #DEBUG_LINE_NO:97
  AbStarbornDeath.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference) ; #DEBUG_LINE_NO:98
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:99
  HunterREF.moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  AbStarbornTeleport.Cast(HunterREF as ObjectReference, HunterREF as ObjectReference) ; #DEBUG_LINE_NO:103
  Alias_TheScow.GetShipRef().DisableNoWait(False) ; #DEBUG_LINE_NO:106
  MQ202TurretEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:115
  MQ206B.SetStage(100) ; #DEBUG_LINE_NO:116
  Self.Stop() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_2000_Item_00()
  MQ_EmissaryRandom.SetValueInt(1) ; #DEBUG_LINE_NO:126
  MQ_EmissaryRevealed.SetValueInt(1) ; #DEBUG_LINE_NO:127
EndFunction
