ScriptName Fragments:Quests:QF_City_Akila_Ashta02_00212B4F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Davis Auto Const mandatory
ReferenceAlias Property Alias_Keoni Auto Const mandatory
ReferenceAlias Property Alias_Bailey Auto Const mandatory
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Creature01 Auto Const mandatory
ReferenceAlias Property Alias_Creature02 Auto Const mandatory
ReferenceAlias Property Alias_Creature03 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_DeadRobot Auto Const mandatory
Quest Property City_Akila_Ashta01 Auto Const mandatory
Quest Property City_Akila_Ashta03 Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory
ReferenceAlias Property Alias_AmbushTrigger Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_Akila_Ashta01.Stop() ; #DEBUG_LINE_NO:8
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef() ; #DEBUG_LINE_NO:19
  aTarg.Enable(False) ; #DEBUG_LINE_NO:20
  If Self.GetStageDone(0) ; #DEBUG_LINE_NO:22
    Alias_Keoni.GetReference().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  DialogueFCAkilaCity.SetStage(2015) ; #DEBUG_LINE_NO:28
  Self.SetStage(5) ; #DEBUG_LINE_NO:31
  Self.SetStage(10) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0005_Item_00()
  Alias_Keoni.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:40
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:41
  Alias_Bailey.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:50
  city_akila_ashta02_script kmyQuest = __temp as city_akila_ashta02_script ; #DEBUG_LINE_NO:51
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:54
  kmyQuest.Wait24() ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(15, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:83
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:84
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:95
  Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveCompleted(35, True) ; #DEBUG_LINE_NO:105
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:106
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:107
  Alias_DeadRobot.GetRef().Enable(False) ; #DEBUG_LINE_NO:110
  Alias_DeadRobot.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Davis.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetStage(80) ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0080_Item_00()
  (Alias_AmbushTrigger.GetRef() as defaultrefambushtrigger2).TriggerAmbush() ; #DEBUG_LINE_NO:148
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:150
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:151
EndFunction

Function Fragment_Stage_0081_Item_00()
  If Self.GetStageDone(82) && Self.GetStageDone(83) ; #DEBUG_LINE_NO:159
    Self.SetStage(85) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0082_Item_00()
  If Self.GetStageDone(81) && Self.GetStageDone(83) ; #DEBUG_LINE_NO:169
    Self.SetStage(85) ; #DEBUG_LINE_NO:170
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0083_Item_00()
  If Self.GetStageDone(81) && Self.GetStageDone(82) ; #DEBUG_LINE_NO:179
    Self.SetStage(85) ; #DEBUG_LINE_NO:180
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:189
  Self.SetObjectiveDisplayed(85, True, False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(85, True) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:207
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:216
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0121_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:225
  Game.GetPlayer().AddItem(Credits as Form, 275, False) ; #DEBUG_LINE_NO:228
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:236
  City_Akila_Ashta03.SetStage(5) ; #DEBUG_LINE_NO:239
  City_Akila_Ashta03.SetActive(True) ; #DEBUG_LINE_NO:240
  Self.Stop() ; #DEBUG_LINE_NO:242
EndFunction
