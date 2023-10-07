ScriptName Fragments:Quests:QF_City_NA_Botany03_00270717 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Branch Auto Const mandatory
ReferenceAlias Property Alias_DebugStartMarker Auto Const mandatory
Scene Property City_NA_Botany03_005_Kelton Auto Const mandatory
Quest Property City_NA_Botany01 Auto Const mandatory
Quest Property City_NA_Botany02 Auto Const mandatory
GlobalVariable Property RAD02_InterviewCount Auto Const mandatory
ReferenceAlias Property Alias_Kelton_Slate Auto Const mandatory
ReferenceAlias Property Alias_EarlFulton Auto Const mandatory
ReferenceAlias Property Alias_Branch_Earl Auto Const mandatory
ReferenceAlias Property Alias_DebugAkilaMarker01 Auto Const mandatory
ReferenceAlias Property Alias_DebugAkilaMarker02 Auto Const mandatory
ReferenceAlias Property Alias_SSNNDebugMarker Auto Const mandatory
Quest Property Botany03Pointer Auto Const
ReferenceAlias Property Alias_Leah_Safe Auto Const
ReferenceAlias Property Alias_KeltonFrush Auto Const mandatory
Quest Property pCity_NA_Botany03_FlowerStateChange Auto Const mandatory
ObjectReference Property TreeSoundMarker Auto Const
ObjectReference Property KioskSoundMarker Auto Const
ObjectReference Property TreeSap_Enabler Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NA_Botany01.SetStage(200) ; #DEBUG_LINE_NO:8
  City_NA_Botany02.SetStage(200) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().MoveTo(Alias_DebugStartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Self.SetStage(1) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().MoveTo(Alias_DebugAkilaMarker01.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:30
  Self.SetStage(40) ; #DEBUG_LINE_NO:31
  Self.SetStage(42) ; #DEBUG_LINE_NO:32
  Game.GetPlayer().MoveTo(Alias_DebugAkilaMarker02.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0004_Item_00()
  Self.SetStage(20) ; #DEBUG_LINE_NO:41
  Self.SetStage(40) ; #DEBUG_LINE_NO:42
  Self.SetStage(50) ; #DEBUG_LINE_NO:43
  Self.SetStage(60) ; #DEBUG_LINE_NO:44
  Game.GetPlayer().MoveTo(Alias_SSNNDebugMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:53
  Botany03Pointer.SetStage(1000) ; #DEBUG_LINE_NO:56
  Self.SetActive(True) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Branch.GetReference().Enable(False) ; #DEBUG_LINE_NO:66
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:67
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:68
  Botany03Pointer.SetStage(1000) ; #DEBUG_LINE_NO:71
  Self.SetActive(True) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:82
  Self.SetObjectiveDisplayed(45, True, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0042_Item_00()
  Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0046_Item_00()
  Self.SetObjectiveDisplayed(46, True, False) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0047_Item_00()
  Self.SetObjectiveCompleted(46, True) ; #DEBUG_LINE_NO:107
  Self.SetObjectiveDisplayed(47, True, False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0048_Item_00()
  If Self.GetStageDone(42) ; #DEBUG_LINE_NO:116
    Self.SetObjectiveDisplayed(45, False, False) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(46) ; #DEBUG_LINE_NO:120
    Self.SetObjectiveCompleted(46, True) ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(47, True) ; #DEBUG_LINE_NO:124
  Alias_EarlFulton.GetActorRef().RemoveItem(Alias_Branch_Earl.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:126
  Game.GetPlayer().AddItem(Alias_Branch_Earl.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:127
  Alias_Leah_Safe.GetRef().RemoveItem(Alias_Branch.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(47) == False ; #DEBUG_LINE_NO:139
    If Self.GetStageDone(41) ; #DEBUG_LINE_NO:141
      Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:142
      Self.SetObjectiveDisplayed(45, False, False) ; #DEBUG_LINE_NO:143
    Else ; #DEBUG_LINE_NO:
      Self.SetObjectiveDisplayed(40, False, False) ; #DEBUG_LINE_NO:146
      Self.SetObjectiveCompleted(45, True) ; #DEBUG_LINE_NO:147
    EndIf ; #DEBUG_LINE_NO:
    Alias_EarlFulton.GetReference().RemoveItem(Alias_Branch_Earl.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:150
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(45, False, False) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(46) == False ; #DEBUG_LINE_NO:157
    Self.SetObjectiveDisplayed(46, False, False) ; #DEBUG_LINE_NO:158
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(20) == False ; #DEBUG_LINE_NO:162
    Self.SetObjectiveDisplayed(20, False, False) ; #DEBUG_LINE_NO:163
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0055_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Branch.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:174
  Game.GetPlayer().RemoveItem(Alias_Branch_Earl.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:175
  City_NA_Botany03_005_Kelton.Start() ; #DEBUG_LINE_NO:176
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:177
  Self.SetObjectiveDisplayed(55, True, False) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0056_Item_00()
  Self.SetObjectiveCompleted(55, True) ; #DEBUG_LINE_NO:186
  Self.SetObjectiveDisplayed(56, True, False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(56, True) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:196
  If RAD02_InterviewCount.GetValue() >= 3.0 ; #DEBUG_LINE_NO:199
    Self.SetStage(70) ; #DEBUG_LINE_NO:200
  EndIf ; #DEBUG_LINE_NO:
  Alias_KeltonFrush.GetActorRef().RemoveItem(Alias_Kelton_Slate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:204
  Game.GetPlayer().AddItem(Alias_Kelton_Slate.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:205
EndFunction

Function Fragment_Stage_0065_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:213
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:215
  Self.SetObjectiveDisplayed(65, True, False) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:224
EndFunction

Function Fragment_Stage_0074_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Kelton_Slate.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:232
  Self.SetStage(75) ; #DEBUG_LINE_NO:233
EndFunction

Function Fragment_Stage_0075_Item_00()
  If Self.GetStageDone(65) ; #DEBUG_LINE_NO:241
    Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:242
    If Self.IsObjectiveDisplayed(70) ; #DEBUG_LINE_NO:244
      Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:245
    EndIf ; #DEBUG_LINE_NO:
    If Self.IsObjectiveDisplayed(65) ; #DEBUG_LINE_NO:247
      Self.SetObjectiveCompleted(65, True) ; #DEBUG_LINE_NO:248
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(74) ; #DEBUG_LINE_NO:250
    Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:251
    Self.SetObjectiveDisplayed(60, False, False) ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(75, True, False) ; #DEBUG_LINE_NO:254
  KioskSoundMarker.Enable(False) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetObjectiveCompleted(75, True) ; #DEBUG_LINE_NO:265
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:266
  TreeSap_Enabler.Disable(False) ; #DEBUG_LINE_NO:269
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:277
  pCity_NA_Botany03_FlowerStateChange.Start() ; #DEBUG_LINE_NO:280
  pCity_NA_Botany03_FlowerStateChange.SetStage(10) ; #DEBUG_LINE_NO:281
  TreeSoundMarker.Disable(False) ; #DEBUG_LINE_NO:284
  KioskSoundMarker.Disable(False) ; #DEBUG_LINE_NO:285
  Self.Stop() ; #DEBUG_LINE_NO:288
EndFunction
