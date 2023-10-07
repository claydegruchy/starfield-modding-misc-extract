ScriptName Fragments:Quests:QF_MQ401b_001A9053 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
ReferenceAlias Property Alias_OtherPlayer Auto Const mandatory
Faction Property AvailableCrewFaction Auto Const mandatory
Scene Property MQ401b_001_LodgeIntro Auto Const mandatory
Faction Property PotentialCrewFaction Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Quest Property OtherYouEliteCrewQuest Auto Const
ObjectReference Property MQ401B_OtherPlayerMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript ; #DEBUG_LINE_NO:8
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:11
  (MQ401 as mq401questscript).NormalStart() ; #DEBUG_LINE_NO:13
  kmyQuest.EnableQuestActors() ; #DEBUG_LINE_NO:15
  Actor OtherPlayerREF = Alias_OtherPlayer.GetActorRef() ; #DEBUG_LINE_NO:17
  OtherPlayerREF.Disable(False) ; #DEBUG_LINE_NO:18
  OtherPlayerREF.moveto(MQ401B_OtherPlayerMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
  OtherPlayerREF.Enable(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ401b_001_LodgeIntro.Start() ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_OtherPlayer.GetActorRef().AddtoFaction(PotentialCrewFaction) ; #DEBUG_LINE_NO:36
  OtherYouEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:37
  MQ401.SetStage(300) ; #DEBUG_LINE_NO:38
  Self.Stop() ; #DEBUG_LINE_NO:39
EndFunction
