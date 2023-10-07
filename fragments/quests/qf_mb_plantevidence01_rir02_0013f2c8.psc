ScriptName Fragments:Quests:QF_MB_PlantEvidence01_RIR02_0013F2C8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_RadiantSupport Auto Const mandatory
ReferenceAlias Property Alias_PrimaryRef Auto Const mandatory
Keyword Property NoLoot Auto Const mandatory
ReferenceAlias Property Alias_Evidence Auto Const mandatory
MiscObject Property Digipick Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SetRewardValues() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:19
  ObjectReference ContainerRef = Alias_PrimaryRef.GetRef() ; #DEBUG_LINE_NO:21
  ContainerRef.Enable(False) ; #DEBUG_LINE_NO:22
  ContainerRef.Lock(True, False, True) ; #DEBUG_LINE_NO:23
  ContainerRef.SetLockLevel(25) ; #DEBUG_LINE_NO:24
  Game.GetPlayer().AddItem(Digipick as Form, 2, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:42
  ri_crimetrackingquestscript kmyQuest = __temp as ri_crimetrackingquestscript ; #DEBUG_LINE_NO:43
  kmyQuest.AddFinalValues() ; #DEBUG_LINE_NO:46
  Self.SetStage(95) ; #DEBUG_LINE_NO:47
  Alias_PrimaryRef.GetRef().RemoveItem(Alias_Evidence.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0095_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:64
  missionplantevidencequestscript kmyQuest = __temp as missionplantevidencequestscript ; #DEBUG_LINE_NO:65
  (RI_RadiantSupport as ri_radiantsupportquestscript).MBCompleted() ; #DEBUG_LINE_NO:68
  kmyQuest.MissionComplete() ; #DEBUG_LINE_NO:70
  Alias_PrimaryRef.GetRef().Disable(False) ; #DEBUG_LINE_NO:71
EndFunction
