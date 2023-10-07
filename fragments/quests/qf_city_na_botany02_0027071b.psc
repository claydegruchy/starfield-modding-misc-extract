ScriptName Fragments:Quests:QF_City_NA_Botany02_0027071B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EmilioHadek Auto Const mandatory
ReferenceAlias Property Alias_DataSlate Auto Const mandatory
ObjectReference Property City_NA_Botany01_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_KeltonFrush Auto Const mandatory
Quest Property City_NA_Botany03 Auto Const mandatory
Quest Property Botany02Pointer Auto Const
Quest Property Botany03Pointer Auto Const
GlobalVariable Property Botany3Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property Botany03 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0030_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(1) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(City_NA_Botany01_StartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_KeltonFrush.GetRef().Enable(False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:25
  Botany02Pointer.SetStage(1000) ; #DEBUG_LINE_NO:28
  Self.SetActive(True) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:38
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:39
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:41
  Botany02Pointer.SetStage(1000) ; #DEBUG_LINE_NO:44
  Alias_EmilioHadek.GetRef().Enable(False) ; #DEBUG_LINE_NO:47
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:48
  Alias_EmilioHadek.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:49
  Self.SetActive(True) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:94
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0150_Item_00()
  If Self.IsObjectiveDisplayed(40) ; #DEBUG_LINE_NO:103
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(30) ; #DEBUG_LINE_NO:107
    Self.SetObjectiveDisplayed(30, False, False) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:111
    Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:112
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(180) == False ; #DEBUG_LINE_NO:115
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0180_Item_00()
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:125
    Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:126
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(40) ; #DEBUG_LINE_NO:129
    Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:130
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) ; #DEBUG_LINE_NO:133
    Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:137
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:141
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_DataSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:153
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:154
  Botany03.Start() ; #DEBUG_LINE_NO:155
  Self.Stop() ; #DEBUG_LINE_NO:156
  Botany3Timer.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:159
  Botany03Pointer.SetStage(10) ; #DEBUG_LINE_NO:161
EndFunction
