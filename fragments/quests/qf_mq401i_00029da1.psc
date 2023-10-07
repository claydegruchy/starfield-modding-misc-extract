ScriptName Fragments:Quests:QF_MQ401i_00029DA1 Extends Quest Const hidden

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
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Child_SarahMorgan Auto Const mandatory
ReferenceAlias Property Alias_Child_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_Child_Noel Auto Const mandatory
ReferenceAlias Property Alias_Child_Barrett Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:9
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:11
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:13
  Self.SetActive(True) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:23
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:24
  MQ401c_001_IntroScene.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:34
  MQ401i_002_OutroScene.Start() ; #DEBUG_LINE_NO:36
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:38
  PlayerREF.additem(LodgeKey as Form, 1, False) ; #DEBUG_LINE_NO:39
  PlayerREF.additem(MQ401I_ArtifactLocations as Form, 1, False) ; #DEBUG_LINE_NO:40
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:41
  Alias_Child_SarahMorgan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:43
  Alias_Child_SamCoe.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:44
  Alias_Child_Noel.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:45
  Alias_Child_Barrett.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:46
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:48
  MQ402.SetStage(100) ; #DEBUG_LINE_NO:49
  MQ402.SetStage(510) ; #DEBUG_LINE_NO:50
EndFunction
