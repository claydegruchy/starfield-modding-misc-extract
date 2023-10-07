ScriptName Fragments:Quests:QF_MB_Hack01_RIR01_0013F727 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory
ReferenceAlias Property Alias_DataDisk Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetRewardValues() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:19
  ObjectReference TerminalRef = Alias_PrimaryRef.GetRef() ; #DEBUG_LINE_NO:21
  TerminalRef.Lock(True, False, True) ; #DEBUG_LINE_NO:22
  TerminalRef.SetLockLevel(25) ; #DEBUG_LINE_NO:23
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:25
  PlayerRef.AddItem(Alias_DataDisk.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:26
  PlayerRef.AddItem(Digipick as Form, 2, False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:35
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:36
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:47
  missionhackquestscript kmyQuest = __temp as missionhackquestscript ; #DEBUG_LINE_NO:48
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted() ; #DEBUG_LINE_NO:51
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:53
EndFunction
