ScriptName Fragments:Quests:QF_RQ_Settlement_Heal_01_Script Extends Quest Const hidden

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
Keyword Property SQ_Captive_HasFollowWaitTopics Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:8
  kmyQuest.SetQuestHookDialogueAVs() ; #DEBUG_LINE_NO:12
  kmyQuest.SetDialogueAV_Hello_Stressed_PreAccept() ; #DEBUG_LINE_NO:15
  Alias_WoundedPerson.GetRef().MoveTo(Alias_WoundedMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  Alias_WoundedPerson.GetActorRef().SetValue(SQ_WoundedState, SQ_WoundedState_1_Wounded.GetValue()) ; #DEBUG_LINE_NO:21
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_WoundedPerson.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:49
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:50
  kmyQuest.SetDialogueAV_Hello_None() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:62
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:63
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:66
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:68
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:69
  Alias_DungeonMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0125_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:79
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:80
  Self.SetStage(10) ; #DEBUG_LINE_NO:83
  Alias_WoundedPerson.GetActorRef().Enable(False) ; #DEBUG_LINE_NO:84
  kmyQuest.SetDialogueAV_PrimaryObjectiveKnown() ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:93
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:94
  kmyQuest.SetDialogueAV_Hello_Stressed_PostAccept() ; #DEBUG_LINE_NO:98
  If Self.IsObjectiveDisplayed(100) && !Self.IsObjectiveCompleted(100) ; #DEBUG_LINE_NO:100
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:104
EndFunction

Function Fragment_Stage_0250_Item_00()
  If Game.GetPlayer().GetItemCount(Aid_MedPack as Form) >= 1 ; #DEBUG_LINE_NO:112
    Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(300) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:124
EndFunction

Function Fragment_Stage_0300_Item_00()
  defaultcaptivewoundedalias captiveAlias = Alias_WoundedPerson as defaultcaptivewoundedalias ; #DEBUG_LINE_NO:133
  captiveAlias.HealActor(True) ; #DEBUG_LINE_NO:134
  Alias_WoundedPerson.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:137
  Alias_WoundedPerson.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:138
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:140
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0450_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:149
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:150
  kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:153
  kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:154
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0475_Item_00()
  Alias_QuestGiver.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:164
EndFunction

Function Fragment_Stage_0500_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:172
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:173
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:176
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:178
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:180
    Self.SetStage(995) ; #DEBUG_LINE_NO:181
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:190
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:191
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:195
    Self.SetStage(990) ; #DEBUG_LINE_NO:196
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:198
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:207
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:208
  If !Self.GetStageDone(995) ; #DEBUG_LINE_NO:211
    Self.SetStage(990) ; #DEBUG_LINE_NO:212
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0990_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:230
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:231
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:235
    Self.FailAllObjectives() ; #DEBUG_LINE_NO:236
    kmyQuest.SetDialogueAV_PrimaryObjectiveFail() ; #DEBUG_LINE_NO:237
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0995_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:248
  rq_heal_01_script kmyQuest = __temp as rq_heal_01_script ; #DEBUG_LINE_NO:249
  If !Self.GetStageDone(990) ; #DEBUG_LINE_NO:253
    Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:254
    kmyQuest.SetDialogueAV_PrimaryObjectiveSuccess() ; #DEBUG_LINE_NO:255
    kmyQuest.SetDialogueAV_Hello_Stressed_Success() ; #DEBUG_LINE_NO:256
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(999) ; #DEBUG_LINE_NO:259
EndFunction

Function Fragment_Stage_0999_Item_00()
  Alias_WoundedPerson.GetRef().Removekeyword(SQ_Captive_HasFollowWaitTopics) ; #DEBUG_LINE_NO:267
EndFunction
