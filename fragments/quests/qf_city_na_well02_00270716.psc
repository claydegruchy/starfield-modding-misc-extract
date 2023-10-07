ScriptName Fragments:Quests:QF_City_NA_Well02_00270716 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_NA_Well02_002_Zoe_Louisa Auto Const mandatory
ReferenceAlias Property Alias_LouisaReyez Auto Const mandatory
ReferenceAlias Property Alias_Louisa_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_ZoeKaminski Auto Const mandatory
Scene Property City_NA_Well02_007_Stage70Scene Auto Const mandatory
Scene Property City_NA_Well02_009_Stage90Scene Auto Const mandatory
Scene Property City_NA_Well02_011_Stage110Scene Auto Const mandatory
Scene Property City_NA_Well02_012_Stage115Scene Auto Const mandatory
Scene Property City_NA_Well02_004_Zoe_Louisa_Stage40 Auto Const mandatory
Scene Property City_NA_Well02_013_Stage120Scene Auto Const mandatory
Scene Property City_NA_Well02_014_Stage150Scene Auto Const mandatory
Scene Property JunctionBoxScene01 Auto Const
Quest Property City_NA_Well01 Auto Const mandatory
Scene Property JunctionBoxScene02 Auto Const
Scene Property JunctionBoxScene03 Auto Const
Scene Property JunctionBoxScene04 Auto Const
ReferenceAlias Property Alias_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor04 Auto Const mandatory
Scene Property City_NA_Well02_Stage60_LouisaFollowUp Auto Const mandatory
ReferenceAlias Property Alias_ApartmentDoor Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
Scene Property City_NA_Well02_WrapUp_Stage190Done Auto Const mandatory
Scene Property City_NA_Well02_WrapUp_Stage180Done Auto Const mandatory
Quest Property pCity_NA_Well02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  City_NA_Well01.SetStage(200) ; #DEBUG_LINE_NO:7
  Alias_LouisaReyez.GetReference().MoveTo(Alias_Louisa_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0001_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:19
  Self.SetActive(True) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:29
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:32
  City_NA_Well02_002_Zoe_Louisa.Start() ; #DEBUG_LINE_NO:33
  Alias_LouisaReyez.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:43
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_LouisaReyez.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:52
  City_NA_Well02_004_Zoe_Louisa_Stage40.Start() ; #DEBUG_LINE_NO:53
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:55
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0045_Item_00()
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:72
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:73
  Alias_ZoeKaminski.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:74
  Alias_BoxDoor01.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:75
  City_NA_Well02_Stage60_LouisaFollowUp.Start() ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0060_Item_00()
  JunctionBoxScene01.Start() ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0065_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0070_Item_00()
  If JunctionBoxScene01.IsPlaying() ; #DEBUG_LINE_NO:101
    JunctionBoxScene01.Stop() ; #DEBUG_LINE_NO:102
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:106
  City_NA_Well02_007_Stage70Scene.Start() ; #DEBUG_LINE_NO:107
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveDisplayed(71, True, False) ; #DEBUG_LINE_NO:109
  pCity_NA_Well02.SetObjectiveDisplayedAtTop(70) ; #DEBUG_LINE_NO:110
  Alias_BoxDoor02.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:111
  Alias_BoxDoor03.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0080_Item_00()
  If Self.GetStageDone(110) == False ; #DEBUG_LINE_NO:120
    JunctionBoxScene02.Start() ; #DEBUG_LINE_NO:121
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(71, True) ; #DEBUG_LINE_NO:130
  Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:131
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0090_Item_00()
  If JunctionBoxScene02.IsPlaying() ; #DEBUG_LINE_NO:140
    JunctionBoxScene02.Stop() ; #DEBUG_LINE_NO:141
    Self.SetObjectiveCompleted(71, True) ; #DEBUG_LINE_NO:142
    Self.SetObjectiveDisplayed(70, False, False) ; #DEBUG_LINE_NO:143
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(80) ; #DEBUG_LINE_NO:146
    Self.SetObjectiveDisplayed(80, False, False) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:149
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:150
  City_NA_Well02_011_Stage110Scene.Start() ; #DEBUG_LINE_NO:151
  Alias_BoxDoor04.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:152
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(90) == False ; #DEBUG_LINE_NO:160
    JunctionBoxScene03.Start() ; #DEBUG_LINE_NO:161
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0105_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:170
  Self.SetObjectiveDisplayed(71, False, False) ; #DEBUG_LINE_NO:171
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0110_Item_00()
  If JunctionBoxScene03.IsPlaying() ; #DEBUG_LINE_NO:180
    JunctionBoxScene03.Stop() ; #DEBUG_LINE_NO:181
    Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:182
    Self.SetObjectiveDisplayed(71, False, False) ; #DEBUG_LINE_NO:183
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(100) ; #DEBUG_LINE_NO:186
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:187
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(80) ; #DEBUG_LINE_NO:189
    Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:192
  If Self.GetStageDone(90) == False ; #DEBUG_LINE_NO:193
    City_NA_Well02_009_Stage90Scene.Start() ; #DEBUG_LINE_NO:194
  EndIf ; #DEBUG_LINE_NO:
  Alias_BoxDoor04.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:196
EndFunction

Function Fragment_Stage_0115_Item_00()
  City_NA_Well02_012_Stage115Scene.Start() ; #DEBUG_LINE_NO:204
EndFunction

Function Fragment_Stage_0120_Item_00()
  JunctionBoxScene04.Start() ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0125_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0150_Item_00()
  If JunctionBoxScene04.IsPlaying() ; #DEBUG_LINE_NO:229
    JunctionBoxScene04.Stop() ; #DEBUG_LINE_NO:230
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveCompleted(110) == False ; #DEBUG_LINE_NO:234
    Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:237
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:238
  City_NA_Well02_014_Stage150Scene.Start() ; #DEBUG_LINE_NO:239
  Alias_ApartmentDoor.GetReference().SetLockLevel(25) ; #DEBUG_LINE_NO:240
EndFunction

Function Fragment_Stage_0151_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:248
  Self.SetObjectiveDisplayed(151, True, False) ; #DEBUG_LINE_NO:249
EndFunction

Function Fragment_Stage_0152_Item_00()
  Game.GetPlayer().AddItem(Digipick as Form, 3, False) ; #DEBUG_LINE_NO:257
EndFunction

Function Fragment_Stage_0160_Item_00()
  Self.SetObjectiveCompleted(151, True) ; #DEBUG_LINE_NO:265
  Self.SetObjectiveDisplayed(160, True, False) ; #DEBUG_LINE_NO:266
EndFunction

Function Fragment_Stage_0170_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:274
  Self.SetObjectiveDisplayed(170, True, False) ; #DEBUG_LINE_NO:275
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:276
EndFunction

Function Fragment_Stage_0180_Item_00()
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:284
  Self.SetObjectiveDisplayed(170, False, False) ; #DEBUG_LINE_NO:285
  Self.SetStage(200) ; #DEBUG_LINE_NO:286
EndFunction

Function Fragment_Stage_0190_Item_00()
  Self.SetObjectiveCompleted(170, True) ; #DEBUG_LINE_NO:294
  Self.SetObjectiveDisplayed(180, False, False) ; #DEBUG_LINE_NO:295
  Self.SetStage(200) ; #DEBUG_LINE_NO:296
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:304
  If Self.GetStageDone(180) ; #DEBUG_LINE_NO:306
    City_NA_Well02_WrapUp_Stage180Done.Start() ; #DEBUG_LINE_NO:307
  Else ; #DEBUG_LINE_NO:
    City_NA_Well02_WrapUp_Stage190Done.Start() ; #DEBUG_LINE_NO:309
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:318
EndFunction
