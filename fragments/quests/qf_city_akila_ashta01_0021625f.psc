ScriptName Fragments:Quests:QF_City_Akila_Ashta01_0021625F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_PlayerStartMarker Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static01 Auto Const mandatory
ReferenceAlias Property Alias_Sensor01 Auto Const mandatory
ReferenceAlias Property Alias_Sensor02 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static02 Auto Const mandatory
ReferenceAlias Property Alias_Sensor03 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static03 Auto Const mandatory
ReferenceAlias Property Alias_Sensor04 Auto Const mandatory
ReferenceAlias Property Alias_Sensor_Static04 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator01 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator02 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator03 Auto Const mandatory
ReferenceAlias Property Alias_SensorActivator04 Auto Const mandatory
ReferenceAlias Property Alias_Keoni Auto Const mandatory
Quest Property City_Akila_Ashta02 Auto Const mandatory
ReferenceAlias Property Alias_TowerGuard Auto Const mandatory
Scene Property City_Akila01_Scene01_StartScene Auto Const mandatory
ObjectReference Property City_Akila01_KeoniStartMarker Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_PlayerStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor aTarg = Alias_Keoni.GetActorRef() ; #DEBUG_LINE_NO:16
  aTarg.Enable(False) ; #DEBUG_LINE_NO:17
  aTarg.MoveTo(City_Akila01_KeoniStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  DialogueFCAkilaCity.SetStage(2015) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetObjectiveDisplayed(8, True, False) ; #DEBUG_LINE_NO:29
  City_Akila01_Scene01_StartScene.Start() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveCompleted(8, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:41
  Alias_Keoni.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0025_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveDisplayed(25, True, False) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0030_Item_00()
  If Self.IsObjectiveDisplayed(20) ; #DEBUG_LINE_NO:70
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(25) ; #DEBUG_LINE_NO:73
    Self.SetObjectiveCompleted(25, True) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:76
  Game.GetPlayer().AddItem(Alias_Sensor01.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:79
  Game.GetPlayer().AddItem(Alias_Sensor02.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:80
  Game.GetPlayer().AddItem(Alias_Sensor03.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:81
  Game.GetPlayer().AddItem(Alias_Sensor04.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:82
  Alias_SensorActivator01.GetReference().Enable(False) ; #DEBUG_LINE_NO:85
  Alias_SensorActivator02.GetReference().Enable(False) ; #DEBUG_LINE_NO:86
  Alias_SensorActivator03.GetReference().Enable(False) ; #DEBUG_LINE_NO:87
  Alias_SensorActivator04.GetReference().Enable(False) ; #DEBUG_LINE_NO:88
  If Self.GetStageDone(20) == False ; #DEBUG_LINE_NO:91
    Game.GetPlayer().MoveTo(Alias_Sensor_Static01.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
  Alias_Keoni.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0031_Item_00()
  Alias_Sensor_Static01.GetReference().Enable(False) ; #DEBUG_LINE_NO:104
  Game.GetPlayer().RemoveItem(Alias_Sensor01.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:105
  If Self.GetStageDone(34) && Self.GetStageDone(32) && Self.GetStageDone(33) ; #DEBUG_LINE_NO:107
    Self.SetStage(40) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0032_Item_00()
  Alias_Sensor_Static02.GetReference().Enable(False) ; #DEBUG_LINE_NO:117
  Game.GetPlayer().RemoveItem(Alias_Sensor02.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:118
  If Self.GetStageDone(31) && Self.GetStageDone(34) && Self.GetStageDone(33) ; #DEBUG_LINE_NO:120
    Self.SetStage(40) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0033_Item_00()
  Alias_Sensor_Static03.GetReference().Enable(False) ; #DEBUG_LINE_NO:130
  Game.GetPlayer().RemoveItem(Alias_Sensor03.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:131
  If Self.GetStageDone(31) && Self.GetStageDone(32) && Self.GetStageDone(34) ; #DEBUG_LINE_NO:133
    Self.SetStage(40) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0034_Item_00()
  Alias_Sensor_Static04.GetReference().Enable(False) ; #DEBUG_LINE_NO:143
  Game.GetPlayer().RemoveItem(Alias_Sensor04.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:144
  If Self.GetStageDone(31) && Self.GetStageDone(32) && Self.GetStageDone(33) ; #DEBUG_LINE_NO:146
    Self.SetStage(40) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:156
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:165
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:166
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:167
  Alias_Keoni.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:168
  Alias_TowerGuard.GetRef().Enable(False) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0059_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:179
  Self.SetStage(65) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0065_Item_00()
  If !Self.IsObjectiveDisplayed(55) ; #DEBUG_LINE_NO:188
    Self.SetObjectiveCompleted(55, False) ; #DEBUG_LINE_NO:189
  EndIf ; #DEBUG_LINE_NO:
  Alias_TowerGuard.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:192
  Alias_Keoni.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:193
  Utility.wait(5.0) ; #DEBUG_LINE_NO:194
  Self.SetStage(70) ; #DEBUG_LINE_NO:195
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:203
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:205
  Alias_Keoni.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:215
  City_Akila_Ashta02.SetStage(10) ; #DEBUG_LINE_NO:217
  City_Akila_Ashta02.SetActive(True) ; #DEBUG_LINE_NO:218
  Self.Stop() ; #DEBUG_LINE_NO:220
EndFunction
