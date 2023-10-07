ScriptName Fragments:Quests:QF_RIR05_002A3945 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI01 Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_PrototypeSchematic Auto Const mandatory
GlobalVariable Property RIR05_RadiantCount Auto Const mandatory
Quest Property RI03 Auto Const mandatory
MiscObject Property RIR05_Schematic Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_ChosenContainer Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
LocationAlias Property Alias_ChosenLocation_System Auto Const mandatory
Keyword Property LocSystemFactionFreestarCollective Auto Const mandatory
Keyword Property LocSystemFactionUnitedColonies Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
Quest Property RI08 Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
ReferenceAlias Property Alias_ChosenContainerRef Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
LocationAlias Property Alias_TridentLuxuryLinesLocation Auto Const mandatory
Keyword Property LocTypeRadiantsNotAllowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:7
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:8
  RIR04.Start() ; #DEBUG_LINE_NO:9
  RIR04.SetStage(100) ; #DEBUG_LINE_NO:10
  RIR04.SetStage(200) ; #DEBUG_LINE_NO:11
  RIR04.SetStage(300) ; #DEBUG_LINE_NO:12
  LC044.SetStage(350) ; #DEBUG_LINE_NO:13
  LC044.SetStage(400) ; #DEBUG_LINE_NO:14
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:16
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:17
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:26
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:27
  Self.SetStage(100) ; #DEBUG_LINE_NO:28
  LC044.SetStage(350) ; #DEBUG_LINE_NO:29
  LC044.SetStage(400) ; #DEBUG_LINE_NO:30
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:32
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:33
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:42
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:43
  Self.SetStage(100) ; #DEBUG_LINE_NO:44
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:45
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:47
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:48
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue() ; #DEBUG_LINE_NO:62
  If fQuestGiver == 0.0 ; #DEBUG_LINE_NO:65
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef()) ; #DEBUG_LINE_NO:66
  ElseIf fQuestGiver == 1.0 ; #DEBUG_LINE_NO:67
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:68
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference ContainerRef = Alias_ChosenContainer.GetRef() ; #DEBUG_LINE_NO:71
  ContainerRef.Enable(False) ; #DEBUG_LINE_NO:72
  ContainerRef.Lock(True, False, True) ; #DEBUG_LINE_NO:73
  ContainerRef.SetLockLevel(25) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:82
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:83
  If RIR05_RadiantCount.GetValueInt() == 0 ; #DEBUG_LINE_NO:85
    RIR04.Stop() ; #DEBUG_LINE_NO:86
  Else ; #DEBUG_LINE_NO:
    RI_RadiantPointerQuest.SetStage(10000) ; #DEBUG_LINE_NO:88
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:97
  If RI_RadiantPointerQuest.IsRunning() ; #DEBUG_LINE_NO:100
    RI_RadiantPointerQuest.SetStage(10000) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:110
  Location ChosenLocation = Alias_ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:112
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation) ; #DEBUG_LINE_NO:114
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:115
    If ChosenLocation.HasKeyword(LocTypeStarstationInterior) ; #DEBUG_LINE_NO:116
      Self.SetStage(155) ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:119
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:120
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
  Game.GetPlayer().AddItem(Digipick as Form, 2, False) ; #DEBUG_LINE_NO:125
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:133
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:134
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:135
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:136
  Alias_ChosenContainer.GetRef().AddAliasedItem(RIR05_Schematic as Form, Alias_PrototypeSchematic as Alias, 1, True) ; #DEBUG_LINE_NO:139
  Location ChosenSystem = Alias_ChosenLocation_System.GetLocation() ; #DEBUG_LINE_NO:142
  ObjectReference Schematic = Alias_PrototypeSchematic.GetRef() ; #DEBUG_LINE_NO:143
  If ChosenSystem.HasKeyword(LocSystemFactionUnitedColonies) ; #DEBUG_LINE_NO:144
    Schematic.SetFactionOwner(CrimeFactionUC, False) ; #DEBUG_LINE_NO:145
  ElseIf ChosenSystem.HasKeyword(LocSystemFactionFreestarCollective) ; #DEBUG_LINE_NO:146
    Schematic.SetFactionOwner(CrimeFactionFreestar, False) ; #DEBUG_LINE_NO:147
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:156
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:157
  Alias_ChosenContainer.Clear() ; #DEBUG_LINE_NO:159
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:161
  PlayerRef.RemoveItem(RIR05_Schematic as Form, 99, True, None) ; #DEBUG_LINE_NO:162
  PlayerRef.AddAliasedItem(RIR05_Schematic as Form, Alias_PrototypeSchematic as Alias, 1, True) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(RIR05_Schematic as Form, 99, False, None) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:179
  Alias_ChosenContainerRef.GetRef().Disable(False) ; #DEBUG_LINE_NO:180
  Float fCurrentRadiantCount = RIR05_RadiantCount.GetValue() ; #DEBUG_LINE_NO:182
  If fCurrentRadiantCount >= 1.0 ; #DEBUG_LINE_NO:187
    (RI_Support as ri_radiantsupportquestscript).ResetMBCount() ; #DEBUG_LINE_NO:188
    RI_LastChosenRadiant.SetValue(2.0) ; #DEBUG_LINE_NO:189
    RIR05_RadiantCount.SetValue(fCurrentRadiantCount + 1.0) ; #DEBUG_LINE_NO:190
    Self.Stop() ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
  If fCurrentRadiantCount == 0.0 ; #DEBUG_LINE_NO:195
    RI03.SetStage(100) ; #DEBUG_LINE_NO:196
    RIR05_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:197
    Alias_TridentLuxuryLinesLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed) ; #DEBUG_LINE_NO:198
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:207
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:208
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:211
EndFunction
