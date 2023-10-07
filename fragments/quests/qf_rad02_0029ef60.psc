ScriptName Fragments:Quests:QF_RAD02_0029EF60 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NadiaMuffaz Auto Const mandatory
ReferenceAlias Property Alias_TommyBitlow Auto Const mandatory
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory
Scene Property RAD02_0010_TommyWave Auto Const mandatory
Quest Property City_NewAtlantis_Z_PrimarySources Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor aTarg = Alias_NadiaMuffaz.GetActorRef() ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(aTarg as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  Self.SetStage(100) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0005_Item_00()
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:21
    Alias_TommyBitlow.GetRef().Enable(False) ; #DEBUG_LINE_NO:22
    Alias_TommyBitlow.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:32
  Alias_TommyBitlow.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:41
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:52
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:55
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(200) ; #DEBUG_LINE_NO:58
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:59
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(300) ; #DEBUG_LINE_NO:61
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:64
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:67
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(600) || Self.GetStageDone(700) ; #DEBUG_LINE_NO:70
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
  City_NewAtlantis_Z_PrimarySources.Start() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:90
    Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:91
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(5) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0199_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:102
  RAD02_InterviewCount.Mod(1.0) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:114
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:115
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0299_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:124
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:125
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:128
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:140
    Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0399_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:150
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:151
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:154
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:166
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0499_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:176
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:177
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:180
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0500_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:192
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0505_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:204
    RAD02_InterviewCount.Mod(1.0) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0599_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:214
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:215
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:218
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0600_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:230
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0699_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:240
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:241
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:244
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:247
EndFunction

Function Fragment_Stage_0700_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:256
    Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:257
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0799_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:266
  rad02script kmyQuest = __temp as rad02script ; #DEBUG_LINE_NO:267
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:270
  kmyQuest.StoryCheck() ; #DEBUG_LINE_NO:273
EndFunction

Function Fragment_Stage_8000_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:281
  Self.SetObjectiveDisplayed(8000, True, False) ; #DEBUG_LINE_NO:282
EndFunction

Function Fragment_Stage_8100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:298
EndFunction
