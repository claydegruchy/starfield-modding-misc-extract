ScriptName Fragments:Quests:QF_City_NA_Well01_0027071C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
Scene Property City_NA_Well01_003_Stage50Scene Auto Const mandatory
Scene Property City_NA_Well01_005_Stage100Scene Auto Const mandatory
Scene Property City_NA_Well01_007_Stage150Scene Auto Const mandatory
Scene Property City_NA_Well01_009_Stage190Scene Auto Const mandatory
Quest Property City_NA_Well02 Auto Const mandatory
Scene Property JunctionBox01Scene Auto Const
Scene Property JunctionBox02Scene Auto Const
Scene Property JunctionBox03Scene Auto Const
Scene Property JunctionBox04Scene Auto Const
ReferenceAlias Property Alias_LouisaReyez Auto Const mandatory
Quest Property City_NA_GuardPointer_Well Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_BoxDoor04 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor01 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor02 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor03 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BoxDoor04 Auto Const mandatory
ReferenceAlias Property Alias_Puzzle_BlockingDoor Auto Const mandatory
GlobalVariable Property StoryManager_NewAtlantisLoad Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().Moveto(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  Self.SetStage(1) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0001_Item_00()
  StoryManager_NewAtlantisLoad.SetValue(1.0) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:25
  City_NA_GuardPointer_Well.SetStage(200) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.IsObjectiveDisplayed(10) ; #DEBUG_LINE_NO:36
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:37
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:39
  Alias_LouisaReyez.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:40
  City_NA_GuardPointer_Well.SetStage(200) ; #DEBUG_LINE_NO:43
  Alias_BoxDoor01.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0030_Item_00()
  JunctionBox01Scene.Start() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0050_Item_00()
  If JunctionBox01Scene.IsPlaying() ; #DEBUG_LINE_NO:71
    JunctionBox01Scene.Stop() ; #DEBUG_LINE_NO:72
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  City_NA_Well01_003_Stage50Scene.Start() ; #DEBUG_LINE_NO:76
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:78
  Alias_BoxDoor02.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0080_Item_00()
  JunctionBox02Scene.Start() ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0085_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveDisplayed(90, True, False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0100_Item_00()
  If JunctionBox02Scene.IsPlaying() ; #DEBUG_LINE_NO:106
    JunctionBox02Scene.Stop() ; #DEBUG_LINE_NO:107
    Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:108
  EndIf ; #DEBUG_LINE_NO:
  City_NA_Well01_005_Stage100Scene.Start() ; #DEBUG_LINE_NO:112
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:113
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:114
  Alias_BoxDoor03.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0130_Item_00()
  JunctionBox03Scene.Start() ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0135_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveDisplayed(140, True, False) ; #DEBUG_LINE_NO:134
EndFunction

Function Fragment_Stage_0150_Item_00()
  If JunctionBox03Scene.IsPlaying() ; #DEBUG_LINE_NO:142
    JunctionBox03Scene.Stop() ; #DEBUG_LINE_NO:143
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
  City_NA_Well01_007_Stage150Scene.Start() ; #DEBUG_LINE_NO:148
  Self.SetObjectiveCompleted(140, True) ; #DEBUG_LINE_NO:149
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:150
  Alias_BoxDoor04.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:153
  Alias_Puzzle_BoxDoor01.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:154
  Alias_Puzzle_BoxDoor02.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:155
  Alias_Puzzle_BoxDoor03.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:156
  Alias_Puzzle_BoxDoor04.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:157
EndFunction

Function Fragment_Stage_0170_Item_00()
  JunctionBox04Scene.Start() ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0175_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:173
  Self.SetObjectiveDisplayed(180, True, False) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0185_Item_00()
  Alias_Puzzle_BlockingDoor.GetReference().Lock(False, False, True) ; #DEBUG_LINE_NO:182
  Alias_Puzzle_BlockingDoor.GetReference().SetOpen(True) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0190_Item_00()
  If JunctionBox04Scene.IsPlaying() ; #DEBUG_LINE_NO:191
    JunctionBox04Scene.Stop() ; #DEBUG_LINE_NO:192
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
  City_NA_Well01_009_Stage190Scene.Start() ; #DEBUG_LINE_NO:197
  Self.SetObjectiveCompleted(180, True) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveDisplayed(190, True, False) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:207
  City_NA_Well02.Start() ; #DEBUG_LINE_NO:208
  Self.Stop() ; #DEBUG_LINE_NO:209
EndFunction
