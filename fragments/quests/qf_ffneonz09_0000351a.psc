ScriptName Fragments:Quests:QF_FFNeonZ09_0000351A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator01 Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator02 Auto Const mandatory
ReferenceAlias Property Alias_PaperActivator03 Auto Const mandatory
GlobalVariable Property FFNeonZ09_PapersCollected Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Book Property FFNeonZ09_Note01 Auto Const mandatory
Book Property FFNeonZ09_Note02 Auto Const mandatory
Book Property FFNeonZ09_Note03 Auto Const mandatory
Book Property FFNeonZ09_HamzaSlate Auto Const mandatory
ReferenceAlias Property Alias_Napkin01 Auto Const mandatory
ReferenceAlias Property Alias_Napkin02 Auto Const mandatory
ReferenceAlias Property Alias_Napkin03 Auto Const mandatory
ReferenceAlias Property Alias_HamzaSlate Auto Const mandatory
Quest Property FFNeonGuardPointer_Z09 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  FFNeonGuardPointer_Z09.SetStage(200) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:18
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:19
  Alias_EnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:22
  Alias_PaperActivator01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:23
  Alias_PaperActivator02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:24
  Alias_PaperActivator03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:25
  Alias_Napkin01.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:26
  Alias_Napkin02.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:27
  Alias_Napkin03.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_0030_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0) ; #DEBUG_LINE_NO:37
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(20, True, True) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0030_Item_01()
  Self.SetStage(60) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0040_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0) ; #DEBUG_LINE_NO:56
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected) ; #DEBUG_LINE_NO:57
  Self.SetObjectiveDisplayed(20, True, True) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0040_Item_01()
  Self.SetStage(60) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFNeonZ09_PapersCollected.Mod(1.0) ; #DEBUG_LINE_NO:75
  Self.UpdateCurrentInstanceGlobal(FFNeonZ09_PapersCollected) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveDisplayed(20, True, True) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0050_Item_01()
  Self.SetStage(60) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:93
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:104
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:105
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:107
  PlayerRef.RemoveItem(Alias_Napkin01.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:109
  PlayerRef.RemoveItem(Alias_Napkin02.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:110
  PlayerRef.RemoveItem(Alias_Napkin03.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:111
  PlayerRef.AddAliasedItem(FFNeonZ09_HamzaSlate as Form, Alias_HamzaSlate as Alias, 1, True) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:120
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:131
  If Self.GetStageDone(70) ; #DEBUG_LINE_NO:132
    Game.GetPlayer().RemoveItem(Alias_HamzaSlate.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:133
  EndIf ; #DEBUG_LINE_NO:
  Alias_EnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:137
  DialogueFCNeon.SetStage(499) ; #DEBUG_LINE_NO:138
  Alias_PaperActivator01.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:139
  Alias_PaperActivator02.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:140
  Alias_PaperActivator03.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:141
EndFunction
