ScriptName Fragments:Quests:QF_RIR07_0017AA9A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RIR07_Bribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_RivalExecutive Auto Const mandatory
ReferenceAlias Property Alias_MasakoOfficeQS Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Faction Property RyujinIndustriesFaction Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Perk Property Manipulation Auto Const mandatory
Perk Property Crippling Auto Const mandatory
Perk Property Intimidation Auto Const mandatory
Perk Property SniperCertification Auto Const mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
ReferenceAlias Property Alias_Masako Auto Const mandatory
ReferenceAlias Property Alias_QuestGiver Auto Const mandatory
ReferenceAlias Property Alias_Ularu Auto Const mandatory
ReferenceAlias Property Alias_UlaruOfficeQS Auto Const mandatory
Quest Property RI_Support Auto Const mandatory
GlobalVariable Property RI_LastChosenRadiant Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Keyword Property LocTypeStarStation Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_ChosenLocation_MapMarker Auto Const mandatory
Quest Property RI_RadiantPointerQuest Auto Const mandatory
GlobalVariable Property RIR07_RadiantCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  LC044.SetStage(1000) ; #DEBUG_LINE_NO:8
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:11
  PlayerRef.AddToFaction(RyujinIndustriesFaction) ; #DEBUG_LINE_NO:12
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:13
  PlayerRef.AddPerk(Manipulation, False) ; #DEBUG_LINE_NO:14
  PlayerRef.AddPerk(Crippling, False) ; #DEBUG_LINE_NO:15
  PlayerRef.AddPerk(Intimidation, False) ; #DEBUG_LINE_NO:16
  PlayerRef.AddPerk(SniperCertification, False) ; #DEBUG_LINE_NO:17
  PlayerRef.AddItem(Credits as Form, 10000, False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:28
  Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  Self.SetStage(0) ; #DEBUG_LINE_NO:30
  Self.SetStage(10) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:39
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
  Self.SetStage(0) ; #DEBUG_LINE_NO:41
  Self.SetStage(10) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(0) ; #DEBUG_LINE_NO:50
  Self.SetStage(200) ; #DEBUG_LINE_NO:51
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0004_Item_00()
  RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:61
  Game.GetPlayer().MoveTo(Alias_MasakoOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:62
  Self.SetStage(0) ; #DEBUG_LINE_NO:63
  Self.SetStage(300) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0005_Item_00()
  RI08_MasakoRemainedCEO.SetValue(0.0) ; #DEBUG_LINE_NO:72
  Game.GetPlayer().MoveTo(Alias_UlaruOfficeQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:73
  Self.SetStage(0) ; #DEBUG_LINE_NO:74
  Self.SetStage(300) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0010_Item_00()
  If RI08_MasakoRemainedCEO.GetValue() == 0.0 ; #DEBUG_LINE_NO:83
    Alias_QuestGiver.ForceRefTo(Alias_Ularu.GetRef()) ; #DEBUG_LINE_NO:84
  Else ; #DEBUG_LINE_NO:
    Alias_QuestGiver.ForceRefTo(Alias_Masako.GetRef()) ; #DEBUG_LINE_NO:86
    RI08_MasakoRemainedCEO.SetValue(1.0) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:96
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
    If ChosenLocation.HasKeyword(LocTypeStarStation) ; #DEBUG_LINE_NO:116
      Self.SetStage(155) ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
    Alias_ChosenLocation_MapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:119
    Alias_ChosenLocation_MapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:120
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:122
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:131
    Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:134
  Alias_RivalExecutive.TryToEnable() ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0250_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, RIR07_Bribe.GetValueInt(), False, None) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0270_Item_00()
  If RI08_MasakoRemainedCEO.GetValue() == 1.0 ; #DEBUG_LINE_NO:152
    Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:153
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:155
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(300) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:166
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:167
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:175
  (RI_Support as ri_radiantsupportquestscript).ResetMBCount() ; #DEBUG_LINE_NO:177
  RI_LastChosenRadiant.SetValue(3.0) ; #DEBUG_LINE_NO:178
  RIR07_RadiantCount.SetValue(RIR07_RadiantCount.GetValue() + 1.0) ; #DEBUG_LINE_NO:179
  Self.Stop() ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:189
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:190
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:193
EndFunction
