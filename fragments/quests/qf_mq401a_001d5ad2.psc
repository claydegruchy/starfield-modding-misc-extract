ScriptName Fragments:Quests:QF_MQ401a_001D5AD2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property ConstellationFaction Auto Const mandatory
Key Property LodgeKey Auto Const mandatory
Quest Property MQ402 Auto Const mandatory
Quest Property MQ401 Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
ReferenceAlias Property Alias_Armillary Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  mq401variantquestscript kmyQuest = __temp as mq401variantquestscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
  MQ401_SkipMQ.SetValueInt(1) ; #DEBUG_LINE_NO:13
  (MQ401 as mq401questscript).CleanUpNormalMainQuest() ; #DEBUG_LINE_NO:15
  kmyQuest.EnableQuestActors() ; #DEBUG_LINE_NO:17
  Alias_Armillary.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:19
  Self.SetActive(True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:38
  PlayerREF.AddtoFaction(ConstellationFaction) ; #DEBUG_LINE_NO:40
  PlayerREF.additem(LodgeKey as Form, 1, False) ; #DEBUG_LINE_NO:41
  PlayerREF.AddtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:42
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:44
  MQ402.SetStage(100) ; #DEBUG_LINE_NO:45
  MQ402.SetStage(510) ; #DEBUG_LINE_NO:46
EndFunction
