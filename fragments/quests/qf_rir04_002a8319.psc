ScriptName Fragments:Quests:QF_RIR04_002A8319 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Device Auto Const mandatory
ReferenceAlias Property Alias_HoldingCellMarker Auto Const mandatory
MiscObject Property RIR04_Device Auto Const mandatory
ReferenceAlias Property Alias_Imogene Auto Const mandatory
GlobalVariable Property RI_RadiantQuestGiver Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property RI01 Auto Const mandatory
GlobalVariable Property RIR04_RadiantAvailable Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Location Property CityNeonLocation Auto Const mandatory
LocationAlias Property Alias_ChosenLocation Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
Quest Property LC044 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneQS Auto Const mandatory
Keyword Property RIR05_QuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_LocationMarker Auto Const mandatory
ReferenceAlias Property Alias_DevicePlacementTrigger Auto Const mandatory
ReferenceAlias Property Alias_DevicePlanted Auto Const mandatory
Faction Property CrimeFactionNeon Auto Const mandatory
Keyword Property CrimeFactionNeon_Keyword Auto Const mandatory
ReferenceAlias Property Alias_PlacedDevice Auto Const mandatory
Keyword Property LocTypeStarstationInterior Auto Const mandatory
ReferenceAlias Property Alias_ChosenMapMarker Auto Const mandatory
Keyword Property CrimeFactionUC_Keyword Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
Keyword Property CrimeFactionFreestar_Keyword Auto Const mandatory
ReferenceAlias Property Alias_LocationMarkerLinkedRef Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Keyword Property CrimeFactionHopeTown_Keyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:7
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:8
  RI02.Start() ; #DEBUG_LINE_NO:9
  RI02.SetStage(600) ; #DEBUG_LINE_NO:10
  LC044.SetStage(350) ; #DEBUG_LINE_NO:11
  LC044.SetStage(400) ; #DEBUG_LINE_NO:12
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:14
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:15
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:24
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:25
  RI02.CompleteQuest() ; #DEBUG_LINE_NO:26
  Self.SetStage(100) ; #DEBUG_LINE_NO:27
  LC044.SetStage(350) ; #DEBUG_LINE_NO:28
  LC044.SetStage(400) ; #DEBUG_LINE_NO:29
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:31
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:32
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0002_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:41
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:42
  RI02.CompleteQuest() ; #DEBUG_LINE_NO:43
  Self.SetStage(300) ; #DEBUG_LINE_NO:44
  LC044.SetStage(350) ; #DEBUG_LINE_NO:45
  LC044.SetStage(400) ; #DEBUG_LINE_NO:46
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:48
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:49
  PlayerRef.MoveTo(Alias_ImogeneQS.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:58
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:59
  RI02.CompleteQuest() ; #DEBUG_LINE_NO:60
  Self.SetStage(100) ; #DEBUG_LINE_NO:61
  Self.SetStage(150) ; #DEBUG_LINE_NO:62
  Self.SetStage(200) ; #DEBUG_LINE_NO:63
  LC044.SetStage(350) ; #DEBUG_LINE_NO:64
  LC044.SetStage(400) ; #DEBUG_LINE_NO:65
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:67
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Imogene.GetRef().AddItem(Alias_Device.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:85
  RI02.Stop() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:94
  Game.GetPlayer().AddItem(Alias_Device.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:95
  Location ChosenLocation = Alias_ChosenLocation.GetLocation() ; #DEBUG_LINE_NO:97
  If ChosenLocation != CityNeonLocation && !CityNeonLocation.IsChild(ChosenLocation) ; #DEBUG_LINE_NO:99
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:100
    If ChosenLocation.HasKeyword(LocTypeStarstationInterior) ; #DEBUG_LINE_NO:101
      Self.SetStage(155) ; #DEBUG_LINE_NO:102
    EndIf ; #DEBUG_LINE_NO:
    Alias_ChosenMapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:104
    Alias_ChosenMapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:105
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(200) ; #DEBUG_LINE_NO:107
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:116
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:117
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0210_Item_00()
  ObjectReference TriggerRef = Alias_DevicePlacementTrigger.GetRef() ; #DEBUG_LINE_NO:127
  ObjectReference MarkerRef = Alias_LocationMarker.GetRef() ; #DEBUG_LINE_NO:128
  TriggerRef.MoveTo(MarkerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:130
  Location MyLocation = MarkerRef.GetCurrentLocation() ; #DEBUG_LINE_NO:132
  If MyLocation.HasKeyword(CrimeFactionNeon_Keyword) ; #DEBUG_LINE_NO:134
    TriggerRef.SetFactionOwner(CrimeFactionNeon, False) ; #DEBUG_LINE_NO:135
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionFreestar_Keyword) || MyLocation.HasKeyword(CrimeFactionHopeTown_Keyword) ; #DEBUG_LINE_NO:137
    TriggerRef.SetFactionOwner(CrimeFactionFreestar, False) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
  If MyLocation.HasKeyword(CrimeFactionUC_Keyword) ; #DEBUG_LINE_NO:140
    TriggerRef.SetFactionOwner(CrimeFactionUC, False) ; #DEBUG_LINE_NO:141
  EndIf ; #DEBUG_LINE_NO:
  Alias_LocationMarkerLinkedRef.ForceRefTo(MarkerRef.GetLinkedRef(None)) ; #DEBUG_LINE_NO:144
  Alias_Guard.GetRef().MoveTo(Alias_LocationMarkerLinkedRef.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:153
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:154
  Game.GetPlayer().RemoveItem(Alias_Device.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:156
  Alias_PlacedDevice.GetRef().MoveTo(Alias_LocationMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:158
  RIR05_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:176
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:177
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:180
EndFunction
