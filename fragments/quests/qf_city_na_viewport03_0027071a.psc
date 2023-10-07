ScriptName Fragments:Quests:QF_City_NA_Viewport03_0027071A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
Faction Property City_NA_Viewport03_GangFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_Fizz Auto Const mandatory
Quest Property City_NA_Viewport01 Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
ReferenceAlias Property Alias_BackupActor01 Auto Const mandatory
ReferenceAlias Property Alias_BackupActor02 Auto Const mandatory
ReferenceAlias Property Alias_Sub12Door Auto Const mandatory
ReferenceAlias Property Alias_SashaAlessio Auto Const mandatory
Scene Property City_NA_Viewport03_003B_Fizz_PreScene Auto Const mandatory
GlobalVariable Property City_NA_Viewport02_Location Auto Const mandatory
Quest Property City_NA_Viewport03_PostQuest Auto Const mandatory
ReferenceAlias Property Alias_StateChangeMarker Auto Const mandatory
Quest Property City_NA_Viewport03_SpeechChallenges Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  City_NA_Viewport01.SetStage(1000) ; #DEBUG_LINE_NO:8
  City_NA_Viewport02.SetStage(200) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Fizz.GetReference().Enable(False) ; #DEBUG_LINE_NO:17
  Alias_SashaAlessio.GetReference().Enable(False) ; #DEBUG_LINE_NO:18
  City_NA_Viewport03_SpeechChallenges.Start() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:27
  Self.SetStage(15) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0015_Item_00()
  Alias_Sub12Door.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:36
  Alias_SashaAlessio.GetReference().Enable(False) ; #DEBUG_LINE_NO:37
  Alias_SashaAlessio.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:46
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:47
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:49
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:50
  If Self.GetStageDone(15) == False ; #DEBUG_LINE_NO:51
    Self.SetStage(15) ; #DEBUG_LINE_NO:52
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0040_Item_00()
  If Self.IsObjectiveDisplayed(30) ; #DEBUG_LINE_NO:71
    Self.SetObjectiveDisplayed(30, False, False) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:74
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(40) ; #DEBUG_LINE_NO:77
    Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:88
  City_NA_Viewport03_003B_Fizz_PreScene.Start() ; #DEBUG_LINE_NO:89
  Self.SetStage(100) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0111_Item_00()
  City_NA_Viewport03_GangFaction.SetEnemy(PlayerFaction, False, False) ; #DEBUG_LINE_NO:106
  Alias_Fizz.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_0119_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:123
  Self.SetStage(180) ; #DEBUG_LINE_NO:124
EndFunction

Function Fragment_Stage_0121_Item_00()
  Alias_Fizz.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:140
  Self.SetStage(180) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:157
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:166
  If City_NA_Viewport02.GetStageDone(130) ; #DEBUG_LINE_NO:168
    City_NA_Viewport02_Location.SetValue(1.0) ; #DEBUG_LINE_NO:169
  ElseIf City_NA_Viewport02.GetStageDone(140) ; #DEBUG_LINE_NO:170
    City_NA_Viewport02_Location.SetValue(2.0) ; #DEBUG_LINE_NO:171
  ElseIf City_NA_Viewport02.GetStageDone(150) ; #DEBUG_LINE_NO:172
    City_NA_Viewport02_Location.SetValue(3.0) ; #DEBUG_LINE_NO:173
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  Alias_StateChangeMarker.GetReference().Enable(False) ; #DEBUG_LINE_NO:182
  City_NA_Viewport03_PostQuest.Start() ; #DEBUG_LINE_NO:183
  Self.Stop() ; #DEBUG_LINE_NO:185
EndFunction
