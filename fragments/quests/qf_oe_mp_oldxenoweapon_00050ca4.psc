ScriptName Fragments:Quests:QF_OE_MP_OldXenoweapon_00050CA4 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_AcelesCreature Auto Const mandatory
ReferenceAlias Property Alias_BonusTerrormorphCreature Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCreature Auto Const mandatory
ReferenceAlias Property Alias_AmbushSpawnMarker Auto Const mandatory
ReferenceAlias Property Alias_NPCSearchingFloorFurniture Auto Const mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerA Auto Const mandatory
ReferenceAlias Property Alias_AmbushDecoySpawnMarkerB Auto Const mandatory
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(55) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0055_Item_00()
  Actor Terrormorph = Alias_BonusTerrormorphCreature.GetActorRef() ; #DEBUG_LINE_NO:23
  ObjectReference Marker = Alias_AmbushSpawnMarker.GetRef() ; #DEBUG_LINE_NO:24
  If Terrormorph as Bool && Marker as Bool ; #DEBUG_LINE_NO:26
    Terrormorph.MoveTo(Marker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:27
    Terrormorph.Enable(False) ; #DEBUG_LINE_NO:28
    Terrormorph.Kill(None) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0210_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0220_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0230_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0300_Item_00()
  If Self.GetStageDone(220) ; #DEBUG_LINE_NO:62
    Self.SetStage(400) ; #DEBUG_LINE_NO:63
  ElseIf Self.GetStageDone(210) ; #DEBUG_LINE_NO:64
    Self.SetStage(405) ; #DEBUG_LINE_NO:65
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:74
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:75
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:92
  If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:94
    Self.SetStage(450) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(420) && Self.GetStageDone(430) ; #DEBUG_LINE_NO:98
    Self.SetStage(600) ; #DEBUG_LINE_NO:99
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:110
  If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:112
    Self.SetStage(450) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(410) && Self.GetStageDone(430) ; #DEBUG_LINE_NO:116
    Self.SetStage(600) ; #DEBUG_LINE_NO:117
  ElseIf !Self.GetStageDone(410) && !Self.GetStageDone(430) ; #DEBUG_LINE_NO:118
    If Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:119
      Self.SetStage(410) ; #DEBUG_LINE_NO:120
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(430) ; #DEBUG_LINE_NO:122
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(410) ; #DEBUG_LINE_NO:124
    Self.SetStage(430) ; #DEBUG_LINE_NO:125
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(410) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:136
  If Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:138
    Self.SetStage(450) ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(410) && Self.GetStageDone(420) ; #DEBUG_LINE_NO:142
    Self.SetStage(600) ; #DEBUG_LINE_NO:143
  ElseIf !Self.GetStageDone(410) && !Self.GetStageDone(420) ; #DEBUG_LINE_NO:144
    If Utility.RandomInt(0, 1) == 0 ; #DEBUG_LINE_NO:145
      Self.SetStage(410) ; #DEBUG_LINE_NO:146
    Else ; #DEBUG_LINE_NO:
      Self.SetStage(420) ; #DEBUG_LINE_NO:148
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(410) ; #DEBUG_LINE_NO:150
    Self.SetStage(420) ; #DEBUG_LINE_NO:151
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(410) ; #DEBUG_LINE_NO:153
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0450_Item_00()
  Actor Terrormorph = Alias_TerrormorphCreature.GetActorRef() ; #DEBUG_LINE_NO:162
  ObjectReference AmbushFurniture = Alias_AmbushSpawnMarker.GetRef() ; #DEBUG_LINE_NO:163
  Self.SetObjectiveDisplayed(450, True, False) ; #DEBUG_LINE_NO:165
  If Terrormorph as Bool && AmbushFurniture as Bool ; #DEBUG_LINE_NO:167
    Terrormorph.MoveTo(AmbushFurniture, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:168
    Terrormorph.Enable(False) ; #DEBUG_LINE_NO:169
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:178
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:179
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:180
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:181
  If !Self.GetStageDone(450) ; #DEBUG_LINE_NO:183
    If Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:184
      Self.SetStage(450) ; #DEBUG_LINE_NO:185
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  If Self.GetStageDone(205) ; #DEBUG_LINE_NO:195
    If Utility.RandomInt(1, 5) == 1 ; #DEBUG_LINE_NO:196
      Self.SetStage(450) ; #DEBUG_LINE_NO:197
    EndIf ; #DEBUG_LINE_NO:
  ElseIf Utility.RandomInt(1, 2) == 1 ; #DEBUG_LINE_NO:199
    Self.SetStage(450) ; #DEBUG_LINE_NO:200
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(999) ; #DEBUG_LINE_NO:202
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:211
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:212
EndFunction

Function Fragment_Stage_0810_Item_00()
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:220
  Self.SetObjectiveCompleted(475, True) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0820_Item_00()
  If Self.GetStageDone(450) || Self.GetStageDone(475) ; #DEBUG_LINE_NO:229
    Self.SetStage(450) ; #DEBUG_LINE_NO:230
    Self.SetStage(475) ; #DEBUG_LINE_NO:231
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  If !Self.GetStageDone(450) && Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:240
    Self.SetStage(450) ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(475) && Utility.RandomInt(1, 3) == 1 ; #DEBUG_LINE_NO:244
    Self.SetStage(475) ; #DEBUG_LINE_NO:245
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(475) && !Self.GetStageDone(450) ; #DEBUG_LINE_NO:248
    Self.SetStage(999) ; #DEBUG_LINE_NO:249
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0860_Item_00()
  If !Self.GetStageDone(450) && Utility.RandomInt(1, 10) == 1 ; #DEBUG_LINE_NO:258
    Self.SetStage(450) ; #DEBUG_LINE_NO:259
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(475) && Utility.RandomInt(1, 10) == 1 ; #DEBUG_LINE_NO:262
    Self.SetStage(475) ; #DEBUG_LINE_NO:263
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(475) && !Self.GetStageDone(450) ; #DEBUG_LINE_NO:266
    Self.SetStage(999) ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
EndFunction
