ScriptName Fragments:Quests:QF_MQ401f_00172F8B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
Scene Property MQ401c_001_IntroScene Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact01 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact02 Auto Const mandatory
ReferenceAlias Property Alias_ArtifaceDataSlate Auto Const mandatory
ReferenceAlias Property Alias_Zealot02 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact03 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact04 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact05 Auto Const mandatory
ReferenceAlias Property Alias_LodgeArtifact06 Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Zealot01 Auto Const mandatory
ReferenceAlias Property Alias_Zealot03 Auto Const mandatory
ReferenceAlias Property Alias_Zealot04 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property MQ204HunterInvisibility Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript ; #DEBUG_LINE_NO:8
  Actor AndrejaREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:11
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:13
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:15
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:17
  kmyQuest.EnableQuestActors() ; #DEBUG_LINE_NO:19
  Alias_Andreja.GetActorRef().AddSpell(MQ204HunterInvisibility, True) ; #DEBUG_LINE_NO:21
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:23
  Self.SetActive(True) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor HunterREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:33
  HunterREF.RemoveSpell(MQ204HunterInvisibility) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:38
  MQ401c_001_IntroScene.Start() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:48
  MQ401c_001_IntroScene.Stop() ; #DEBUG_LINE_NO:49
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:51
  Actor HunterREF = Alias_Andreja.GetActorRef() ; #DEBUG_LINE_NO:52
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:53
  HunterREF.Moveto(MQHoldingCellCenterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
  HunterREF.DisableNoWait(False) ; #DEBUG_LINE_NO:57
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:59
  PlayerREF.additem(LodgeKey as Form, 1, False) ; #DEBUG_LINE_NO:60
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:61
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:63
  MQ402.SetStage(100) ; #DEBUG_LINE_NO:64
  MQ402.SetStage(510) ; #DEBUG_LINE_NO:65
EndFunction
