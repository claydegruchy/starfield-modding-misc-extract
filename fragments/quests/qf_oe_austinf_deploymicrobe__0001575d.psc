ScriptName Fragments:Quests:QF_OE_AustinF_DeployMicrobe__0001575D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Vanguard Auto Const mandatory
Faction Property HostileFaction Auto Const
RefCollectionAlias Property Settlers Auto Const mandatory
ReferenceAlias Property SettlerLeader Auto Const mandatory
Scene Property IntroScene Auto Const
ReferenceAlias Property Alias_Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  IntroScene.Start() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
  SettlerLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:24
  Settlers.EvaluateAll() ; #DEBUG_LINE_NO:25
  If !Self.GetStageDone(50) ; #DEBUG_LINE_NO:27
    Self.SetStage(50) ; #DEBUG_LINE_NO:28
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  IntroScene.Stop() ; #DEBUG_LINE_NO:37
  Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:39
  SettlerLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:40
  Settlers.EvaluateAll() ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:49
  Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:51
  SettlerLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0500_Item_00()
  Int level = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:76
  Int chance = 0 ; #DEBUG_LINE_NO:77
  If level > 100 ; #DEBUG_LINE_NO:79
    level = 99 ; #DEBUG_LINE_NO:80
  EndIf ; #DEBUG_LINE_NO:
  If Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:83
    If Utility.RandomInt(0, 100) < level ; #DEBUG_LINE_NO:85
      Self.SetStage(510) ; #DEBUG_LINE_NO:86
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(510) ; #DEBUG_LINE_NO:91
    Self.SetStage(520) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0510_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0520_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetStage(700) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0620_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:133
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0700_Item_00()
  Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:149
  SettlerLeader.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:150
  Settlers.EvaluateAll() ; #DEBUG_LINE_NO:151
  Self.SetStage(900) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:161
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:169
EndFunction
