ScriptName Fragments:Quests:QF_RIR03_002BABF3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
MiscObject Property RIR03_Keycard Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_Keycard Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
GlobalVariable Property RIR03_RadiantCount Auto Const mandatory
Armor Property Clothes_UCPolice Auto Const mandatory
Armor Property Clothes_BusinessFashionable_Male_01 Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property LC044 Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RI_RadiantSupport Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RI07_PlayerHasInternalNeuroamp Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
ReferenceAlias Property Alias_UlaruQS Auto Const mandatory
Quest Property RI08 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
ReferenceAlias Property Alias_MasakoQS Auto Const mandatory
ReferenceAlias Property Alias_KeyCardSafe Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:7
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:8
  RIR01.CompleteQuest() ; #DEBUG_LINE_NO:9
  RIR02.SetStage(100) ; #DEBUG_LINE_NO:10
  RIR02.SetStage(150) ; #DEBUG_LINE_NO:11
  RIR02.SetStage(200) ; #DEBUG_LINE_NO:12
  RIR02.SetStage(300) ; #DEBUG_LINE_NO:13
  LC044.SetStage(350) ; #DEBUG_LINE_NO:14
  LC044.SetStage(400) ; #DEBUG_LINE_NO:15
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:17
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:19
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False) ; #DEBUG_LINE_NO:20
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:29
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:30
  RIR01.CompleteQuest() ; #DEBUG_LINE_NO:31
  RIR02.CompleteQuest() ; #DEBUG_LINE_NO:32
  Self.SetStage(100) ; #DEBUG_LINE_NO:33
  LC044.SetStage(350) ; #DEBUG_LINE_NO:34
  LC044.SetStage(400) ; #DEBUG_LINE_NO:35
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:37
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:38
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:39
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False) ; #DEBUG_LINE_NO:40
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:49
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:50
  Alias_QuestGiver.Clear() ; #DEBUG_LINE_NO:51
  Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:52
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:53
  Self.SetStage(100) ; #DEBUG_LINE_NO:54
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:55
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:57
  PlayerRef.MoveTo(Alias_MasakoQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:58
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:59
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False) ; #DEBUG_LINE_NO:60
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False) ; #DEBUG_LINE_NO:61
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:62
  RI07_PlayerHasInternalNeuroamp.SetValue(1.0) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:72
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:73
  Alias_QuestGiver.Clear() ; #DEBUG_LINE_NO:74
  Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:75
  RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:76
  Self.SetStage(100) ; #DEBUG_LINE_NO:77
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:78
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:80
  PlayerRef.MoveTo(Alias_UlaruQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:81
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:82
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False) ; #DEBUG_LINE_NO:83
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False) ; #DEBUG_LINE_NO:84
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:85
  RI07_PlayerHasInternalNeuroamp.SetValue(1.0) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0004_Item_00()
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:95
  PlayerRef.AddItem(Clothes_UCPolice as Form, 1, False) ; #DEBUG_LINE_NO:96
  PlayerRef.AddItem(Clothes_BusinessFashionable_Male_01 as Form, 1, False) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0010_Item_00()
  Float fQuestGiver = RI_RadiantQuestGiver.GetValue() ; #DEBUG_LINE_NO:109
  If fQuestGiver == 0.0 ; #DEBUG_LINE_NO:112
    Alias_QuestGiver.ForceRefTo(Alias_Imogene.GetRef()) ; #DEBUG_LINE_NO:113
  ElseIf fQuestGiver == 1.0 ; #DEBUG_LINE_NO:114
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:115
  ElseIf fQuestGiver == 2.0 ; #DEBUG_LINE_NO:116
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:117
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:127
  If RIR03_RadiantCount.GetValueInt() == 0 ; #DEBUG_LINE_NO:129
    RIR02.Stop() ; #DEBUG_LINE_NO:130
  Else ; #DEBUG_LINE_NO:
    RI_RadiantPointerQuest.SetStage(10000) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:141
EndFunction

Function Fragment_Stage_0150_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:149
  rir03_questscript kmyQuest = __temp as rir03_questscript ; #DEBUG_LINE_NO:150
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:153
  Location ChosenLocation = Alias_ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:155
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation) ; #DEBUG_LINE_NO:157
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:158
    If ChosenLocation.HasKeyword(LocTypeStarstationInterior) ; #DEBUG_LINE_NO:159
      Self.SetStage(155) ; #DEBUG_LINE_NO:160
    EndIf ; #DEBUG_LINE_NO:
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:162
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:163
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:165
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:168
  kmyQuest.CheckPlayer() ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:177
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:178
  Self.SetObjectiveDisplayedAtTop(200) ; #DEBUG_LINE_NO:179
EndFunction

Function Fragment_Stage_0210_Item_00()
  Game.GetPlayer().AddItem(Alias_Keycard.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:196
  If Self.IsObjectiveDisplayed(110) ; #DEBUG_LINE_NO:198
    Self.SetObjectiveDisplayed(110, False, False) ; #DEBUG_LINE_NO:199
  EndIf ; #DEBUG_LINE_NO:
  RI02.Start() ; #DEBUG_LINE_NO:201
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:203
  PlayerRef.RemoveItem(Alias_Keycard.GetRef() as Form, 1, True, None) ; #DEBUG_LINE_NO:205
  PlayerRef.AddItem(Alias_KeyCardSafe.GetRef() as Form, 1, True) ; #DEBUG_LINE_NO:206
EndFunction

Function Fragment_Stage_0350_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:214
  PlayerRef.RemoveItem(Alias_KeyCardSafe.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:224
  Float fCurrentRadiantCount = RIR03_RadiantCount.GetValue() ; #DEBUG_LINE_NO:226
  If fCurrentRadiantCount >= 1.0 ; #DEBUG_LINE_NO:231
    (RI_RadiantSupport as ri_radiantsupportquestscript).ResetMBCount() ; #DEBUG_LINE_NO:232
    RI_LastChosenRadiant.SetValue(1.0) ; #DEBUG_LINE_NO:233
    RIR03_RadiantCount.SetValue(fCurrentRadiantCount + 1.0) ; #DEBUG_LINE_NO:234
    Self.Stop() ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  If fCurrentRadiantCount == 0.0 ; #DEBUG_LINE_NO:239
    RI02.SetStage(100) ; #DEBUG_LINE_NO:240
    RIR03_RadiantCount.SetValue(1.0) ; #DEBUG_LINE_NO:241
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:250
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:251
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:254
EndFunction
