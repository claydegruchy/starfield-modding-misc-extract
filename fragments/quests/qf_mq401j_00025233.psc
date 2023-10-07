ScriptName Fragments:Quests:QF_MQ401j_00025233 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Book Property MQ401I_ArtifactLocations Auto Const mandatory
Scene Property MQ401i_002_OutroScene Auto Const mandatory
Scene Property MQ401j_001_IntroScene Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_Plant Auto Const mandatory
Scene Property MQ401j_002_OutroScene Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference PlantREF = Alias_Plant.GetRef() ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:10
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:12
  PlantREF.Enable(False) ; #DEBUG_LINE_NO:14
  PlantREF.BlockActivation(True, False) ; #DEBUG_LINE_NO:15
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:17
  Self.SetActive(True) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ401j_001_IntroScene.Start() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:44
  MQ401j_001_IntroScene.Stop() ; #DEBUG_LINE_NO:45
  Alias_Plant.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:46
  Alias_Noel.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:47
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:49
  MQ401j_002_OutroScene.Start() ; #DEBUG_LINE_NO:51
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:62
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:64
  PlayerREF.additem(LodgeKey as Form, 1, False) ; #DEBUG_LINE_NO:65
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:66
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:68
  MQ402.SetStage(100) ; #DEBUG_LINE_NO:69
  MQ402.SetStage(510) ; #DEBUG_LINE_NO:70
EndFunction
