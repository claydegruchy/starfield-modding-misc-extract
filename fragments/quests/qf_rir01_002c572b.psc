ScriptName Fragments:Quests:QF_RIR01_002C572B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RIR01_DataDisk Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory
ReferenceAlias Property Alias_ImogeneSalzo Auto Const mandatory
Quest Property RI01 Auto Const mandatory
ReferenceAlias Property Alias_ImogeneStartMarker Auto Const mandatory
Quest Property RI01_JobAdRadio Auto Const mandatory
Quest Property LC044 Auto Const mandatory
Perk Property FactionRyujinIndustriesPerk Auto Const mandatory
ReferenceAlias Property Alias_NeonCeltCorpTerminal Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:9
  RI01.Start() ; #DEBUG_LINE_NO:10
  RI01.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:11
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:12
  RI01.SetStage(1300) ; #DEBUG_LINE_NO:13
  LC044.SetStage(350) ; #DEBUG_LINE_NO:14
  LC044.SetStage(400) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0001_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:23
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:25
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:26
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:27
  Self.SetStage(100) ; #DEBUG_LINE_NO:28
  LC044.SetStage(350) ; #DEBUG_LINE_NO:29
  LC044.SetStage(400) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0002_Item_00()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:38
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:40
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:41
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:42
  Self.SetStage(100) ; #DEBUG_LINE_NO:43
  Self.SetStage(200) ; #DEBUG_LINE_NO:44
  LC044.SetStage(350) ; #DEBUG_LINE_NO:45
  LC044.SetStage(400) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0003_Item_00()
  RI01.CompleteQuest() ; #DEBUG_LINE_NO:54
  RI01_JobAdRadio.Stop() ; #DEBUG_LINE_NO:55
  Self.SetStage(100) ; #DEBUG_LINE_NO:56
  Self.SetStage(110) ; #DEBUG_LINE_NO:57
  Self.SetStage(120) ; #DEBUG_LINE_NO:58
  Self.SetStage(130) ; #DEBUG_LINE_NO:59
  Self.SetStage(200) ; #DEBUG_LINE_NO:60
  Self.SetStage(300) ; #DEBUG_LINE_NO:61
  LC044.SetStage(350) ; #DEBUG_LINE_NO:62
  LC044.SetStage(400) ; #DEBUG_LINE_NO:63
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:65
  PlayerRef.MoveTo(Alias_ImogeneStartMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:66
  PlayerRef.AddPerk(FactionRyujinIndustriesPerk, False) ; #DEBUG_LINE_NO:67
EndFunction

Function Fragment_Stage_0010_Item_00()
  ObjectReference TerminalRef = Alias_NeonCeltCorpTerminal.GetRef() ; #DEBUG_LINE_NO:75
  TerminalRef.Lock(True, False, True) ; #DEBUG_LINE_NO:76
  TerminalRef.SetLockLevel(25) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetActive(True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:86
  RI01.Stop() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:95
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:96
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:98
  PlayerRef.AddItem(Alias_DataDisk.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:99
  PlayerRef.AddItem(Digipick as Form, 2, False) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:108
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:109
  RIR02.SetStage(10) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().RemoveItem(RIR01_DataDisk as Form, 99, False, None) ; #DEBUG_LINE_NO:119
EndFunction

Function Fragment_Stage_10000_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_9000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:135
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:136
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:139
EndFunction
