ScriptName Fragments:Quests:QF_RQ_Settlement_Heal_01_001C3290 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_WoundedPerson Auto Const mandatory
RefCollectionAlias Property Alias_Actors Auto Const mandatory
Potion Property Aid_MedPack Auto Const
ReferenceAlias Property Alias_DungeonMapMarker Auto Const
ActorValue Property SQ_WoundedState Auto Const mandatory
GlobalVariable Property SQ_WoundedState_1_Wounded Auto Const mandatory
GlobalVariable Property SQ_WoundedState_2_Healed Auto Const mandatory
ReferenceAlias Property Alias_WoundedMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:8
  kmyQuest.SetQuestHookDialogueAVs() ; #DEBUG_LINE_NO:12
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:15
  Alias_WoundedPerson.GetRef().MoveTo(Alias_WoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue()) ; #DEBUG_LINE_NO:21
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:24
  Alias_WoundedPerson.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:36
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:48
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:52
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:54
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:55
  Alias_DungeonMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:57
  Alias_WoundedPerson.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:68
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:69
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:73
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:75
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:76
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Game.GetPlayer().GetItemCount(Aid_MedPack as Form) >= 1 ; #DEBUG_LINE_NO:87
    Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(270) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(270) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0270_Item_00()
  Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, 0.0) ; #DEBUG_LINE_NO:108
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:109
  Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, SQ_WoundedState_2_Healed.GetValue()) ; #DEBUG_LINE_NO:112
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:115
  Alias_WoundedPerson.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:119
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0280_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:128
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:129
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:132
  kmyQuest.SetDialogueAV_Hello_Stressed_Failure() ; #DEBUG_LINE_NO:133
  kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:142
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:143
  kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:146
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0390_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:155
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:156
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:159
  Self.SetStage(990) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:168
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:169
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:173
    Self.SetStage(990) ; #DEBUG_LINE_NO:174
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:176
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:186
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:194
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:195
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:199
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:200
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:212
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:213
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:217
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:218
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:219
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:220
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:223
EndFunction
