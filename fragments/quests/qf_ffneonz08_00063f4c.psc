ScriptName Fragments:Quests:QF_FFNeonZ08_00063F4C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property DialogueQuestNeon Auto Const
ReferenceAlias Property Alias_HeadlockMarker Auto Const mandatory
ReferenceAlias Property Alias_Headlock Auto Const mandatory
Faction Property HeadlockEnemyFaction Auto Const
GlobalVariable Property TLTimer Auto Const
GlobalVariable Property DaysPassed Auto Const
RefCollectionAlias Property Alias_HeadlockGang Auto Const mandatory
Quest Property FFNeonGuardPointer_Z08 Auto Const mandatory
ReferenceAlias Property Alias_Thug Auto Const mandatory
ReferenceAlias Property Alias_ThugCOPY001 Auto Const mandatory
ReferenceAlias Property Alias_ThugCOPY002 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  FFNeonGuardPointer_Z08.SetStage(200) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetObjectiveDisplayed(14, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0018_Item_00()
  If Self.IsObjectiveDisplayed(14) ; #DEBUG_LINE_NO:26
    Self.SetObjectiveCompleted(14, True) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(13) ; #DEBUG_LINE_NO:30
    Self.SetObjectiveDisplayed(14, False, False) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:41
  Alias_HeadlockMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0028_Item_00()
  Game.GetPlayer().AddToFaction(HeadlockEnemyFaction) ; #DEBUG_LINE_NO:51
  Alias_Headlock.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:52
  Alias_Headlock.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:53
  Alias_Thug.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:54
  Alias_Thug.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:55
  Alias_ThugCOPY001.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:56
  Alias_ThugCOPY001.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:57
  Alias_ThugCOPY002.GetActorRef().setvalue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:58
  Alias_ThugCOPY002.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:67
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_1000_Item_00()
  DialogueQuestNeon.SetStage(480) ; #DEBUG_LINE_NO:76
  TLTimer.setvalue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:79
  Alias_HeadlockMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:81
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:83
  Self.Stop() ; #DEBUG_LINE_NO:85
EndFunction
