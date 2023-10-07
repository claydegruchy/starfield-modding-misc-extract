ScriptName Fragments:Quests:QF_City_NA_Botany01_00270718 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Sensor_Suburbs Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Bridge Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Commercial Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Residential Auto Const mandatory
Quest Property City_NA_Botany02 Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
Scene Property City_NA_Botany01_006_KeltonScene Auto Const mandatory
GlobalVariable Property City_NA_Botany01_WenPayment Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Kid Auto Const mandatory
Quest Property PointerQuest Auto Const
GlobalVariable Property Botany2Timer Auto Const
GlobalVariable Property DaysPassed Auto Const
Quest Property Botany02Pointer Auto Const
ReferenceAlias Property Alias_KeltonFrush Auto Const mandatory
Quest Property City_NA_GuardPointer_Botany Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:15
  PointerQuest.SetStage(1000) ; #DEBUG_LINE_NO:16
  Self.SetActive(True) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:26
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:29
  Alias_Sensor_Bridge.GetReference().Enable(False) ; #DEBUG_LINE_NO:31
  Alias_Sensor_Commercial.GetReference().Enable(False) ; #DEBUG_LINE_NO:32
  Alias_Sensor_Residential.GetReference().Enable(False) ; #DEBUG_LINE_NO:33
  Alias_Sensor_Suburbs.GetReference().Enable(False) ; #DEBUG_LINE_NO:34
  PointerQuest.SetStage(1000) ; #DEBUG_LINE_NO:37
  City_NA_GuardPointer_Botany.SetStage(200) ; #DEBUG_LINE_NO:40
  Self.SetActive(True) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.GetStageDone(40) == True && Self.GetStageDone(50) == True && Self.GetStageDone(70) == True ; #DEBUG_LINE_NO:50
    Self.SetStage(100) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  If Self.GetStageDone(30) == True && Self.GetStageDone(50) == True && Self.GetStageDone(70) == True ; #DEBUG_LINE_NO:60
    Self.SetStage(100) ; #DEBUG_LINE_NO:61
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(40) == True && Self.GetStageDone(30) == True && Self.GetStageDone(70) == True ; #DEBUG_LINE_NO:70
    Self.SetStage(100) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0056_Item_00()
  If Self.GetStageDone(58) == False ; #DEBUG_LINE_NO:80
    Self.SetObjectiveDisplayed(58, True, False) ; #DEBUG_LINE_NO:81
  EndIf ; #DEBUG_LINE_NO:
  Alias_Kid.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0058_Item_00()
  If Self.GetStageDone(56) == False ; #DEBUG_LINE_NO:92
    Self.SetStage(56) ; #DEBUG_LINE_NO:93
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(58) ; #DEBUG_LINE_NO:95
    Self.SetObjectiveCompleted(58, True) ; #DEBUG_LINE_NO:96
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:98
  Alias_Kid.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0061_Item_00()
  Self.SetStage(60) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0062_Item_00()
  Self.SetStage(60) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_0063_Item_00()
  Self.SetStage(60) ; #DEBUG_LINE_NO:124
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().Additem(Alias_Sensor_Commercial.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:132
  Game.GetPlayer().RemoveItem(Credits as Form, City_NA_Botany01_WenPayment.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:133
  Self.SetStage(70) ; #DEBUG_LINE_NO:134
  If Self.IsObjectiveDisplayed(69) ; #DEBUG_LINE_NO:137
    Self.SetObjectiveDisplayed(69, False, False) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0066_Item_00()
  Game.GetPlayer().Additem(Alias_Sensor_Commercial.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:147
  Self.SetStage(70) ; #DEBUG_LINE_NO:148
  If Self.IsObjectiveDisplayed(69) ; #DEBUG_LINE_NO:152
    Self.SetObjectiveDisplayed(69, False, False) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0068_Item_00()
  Self.SetObjectiveDisplayed(69, True, False) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0069_Item_00()
  Self.SetObjectiveCompleted(69, True) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:171
  Self.SetStage(70) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_0070_Item_00()
  If Self.GetStageDone(40) == True && Self.GetStageDone(50) == True && Self.GetStageDone(30) == True ; #DEBUG_LINE_NO:181
    Self.SetStage(100) ; #DEBUG_LINE_NO:182
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(60) ; #DEBUG_LINE_NO:185
    Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:186
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:205
  Game.GetPlayer().RemoveItem(Alias_Sensor_Suburbs.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:206
  Game.GetPlayer().RemoveItem(Alias_Sensor_Bridge.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:207
  Game.GetPlayer().RemoveItem(Alias_Sensor_Residential.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:208
  Game.GetPlayer().RemoveItem(Alias_Sensor_Commercial.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:209
  City_NA_Botany01_006_KeltonScene.Start() ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:219
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:220
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:228
  City_NA_Botany02.Start() ; #DEBUG_LINE_NO:229
  Self.Stop() ; #DEBUG_LINE_NO:230
  Botany2Timer.SetValue(DaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:232
  Botany02Pointer.SetStage(10) ; #DEBUG_LINE_NO:234
EndFunction
