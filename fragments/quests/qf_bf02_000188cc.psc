ScriptName Fragments:Quests:QF_BF02_000188CC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BF02ContainerSceneIntro Auto Const mandatory
Message Property BF02_Stage10Temp_Message Auto Const mandatory
ObjectReference Property BF02PlayerSceneStartMarker Auto Const mandatory
Scene Property BF02ContainerSceneFollowUp Auto Const mandatory
ReferenceAlias Property Alias_BF02MathisAlias Auto Const mandatory
Message Property BF02_Stage130Temp_Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0080_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(BF02PlayerSceneStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:9
  Self.SetStage(5) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:19
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:21
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:23
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:24
  BF02_Stage10Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:63
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0060_Item_00()
  BF02ContainerSceneIntro.Start() ; #DEBUG_LINE_NO:73
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0070_Item_00()
  BF02ContainerSceneFollowUp.Start() ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0090_Item_00()
  Alias_BF02MathisAlias.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:107
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:108
  Alias_BF02MathisAlias.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0130_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:118
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_0140_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:129
  BF02_Stage130Temp_Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:139
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:149
  Self.SetStage(255) ; #DEBUG_LINE_NO:150
EndFunction

Function Fragment_Stage_0255_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:158
  Self.Stop() ; #DEBUG_LINE_NO:159
EndFunction
