ScriptName Fragments:Quests:QF_RIR02_002C2561 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR02_ConfidentialFiles Auto Const mandatory
ReferenceAlias Property Alias_ConfidentialFiles Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneStartMarker Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RI01 Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Keyword Property RIR03_QuestStartKeyword Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityLaredoFilingCabinetEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_AkilaCityLaredoContainer Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
LocationAlias Property Alias_AkilaCityLaredoLocation Auto Const mandatory
Keyword Property LocTypeRadiantsNotAllowed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:7
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:8
  RIR01.SetStage(300) ; #DEBUG_LINE_NO:9
  LC044.SetStage(350) ; #DEBUG_LINE_NO:10
  LC044.SetStage(400) ; #DEBUG_LINE_NO:11
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:13
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:14
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0001_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:23
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:24
  RIR01.CompleteQuest() ; #DEBUG_LINE_NO:25
  Self.SetStage(100) ; #DEBUG_LINE_NO:26
  LC044.SetStage(350) ; #DEBUG_LINE_NO:27
  LC044.SetStage(400) ; #DEBUG_LINE_NO:28
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:30
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:31
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:41
  RIR01.Stop() ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:51
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:53
  PlayerRef.AddItem(Alias_ConfidentialFiles.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:54
  PlayerRef.AddItem(Digipick as Form, 2, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:63
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:64
  ObjectReference ContainerRef = Alias_AkilaCityLaredoContainer.GetRef() ; #DEBUG_LINE_NO:66
  ContainerRef.Enable(False) ; #DEBUG_LINE_NO:67
  ContainerRef.Lock(True, False, True) ; #DEBUG_LINE_NO:68
  ContainerRef.SetLockLevel(25) ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:78
  Alias_AkilaCityLaredoContainer.GetRef().RemoveItem(Alias_ConfidentialFiles.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:80
  RIR03_QuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:89
  Alias_AkilaCityLaredoContainer.GetRef().Disable(False) ; #DEBUG_LINE_NO:91
  Alias_AkilaCityLaredoLocation.GetLocation().RemoveKeyword(LocTypeRadiantsNotAllowed) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:100
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:101
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:104
EndFunction
