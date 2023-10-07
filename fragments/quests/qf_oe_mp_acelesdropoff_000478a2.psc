ScriptName Fragments:Quests:QF_OE_MP_AcelesDropoff_000478A2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TerrorMorph Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_Vanguard Auto Const mandatory
LeveledItem Property LL_Ammo Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:7
  Self.SetStage(25) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0025_Item_00()
  Alias_TerrorMorph.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:16
  Alias_TerrorMorph.GetRef().Disable(False) ; #DEBUG_LINE_NO:17
  Self.SetStage(50) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_Aceles.GetRef().Enable(False) ; #DEBUG_LINE_NO:26
  Alias_Vanguard.GetRef().Enable(False) ; #DEBUG_LINE_NO:27
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:29
  Alias_Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:38
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0225_Item_00()
  Game.GetPlayer().AddItem(LL_Ammo as Form, 1, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
  Self.SetStage(200) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0260_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) ; #DEBUG_LINE_NO:64
    Self.SetStage(285) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0270_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) ; #DEBUG_LINE_NO:74
    Self.SetStage(285) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0280_Item_00()
  If Self.GetStageDone(260) && Self.GetStageDone(270) && Self.GetStageDone(280) ; #DEBUG_LINE_NO:84
    Self.SetStage(285) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0290_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:94
  Self.SetStage(300) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:103
  Alias_TerrorMorph.GetRef().Enable(False) ; #DEBUG_LINE_NO:105
  Alias_TerrorMorph.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:106
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:108
  Alias_Vanguard.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:118
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:119
    Self.SetStage(500) ; #DEBUG_LINE_NO:120
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:129
    Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetStage(980) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.SetStage(980) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0990_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:155
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:157
    Self.SetStage(995) ; #DEBUG_LINE_NO:158
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:160
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(999) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:177
  Self.Stop() ; #DEBUG_LINE_NO:178
EndFunction
