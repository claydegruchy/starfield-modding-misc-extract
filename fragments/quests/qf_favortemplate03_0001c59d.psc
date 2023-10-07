ScriptName Fragments:Quests:QF_FavorTemplate03_0001C59D Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RedHerring01 Auto Const mandatory
Scene Property FavorTemplate02_002_RedHerring01 Auto Const mandatory
ReferenceAlias Property Alias_RedHerring02 Auto Const mandatory
Scene Property FavorTemplate02_003_RedHerring02 Auto Const mandatory
ReferenceAlias Property Alias_KeyClue Auto Const mandatory
Scene Property FavorTemplate02_004_KeyClue Auto Const mandatory
ReferenceAlias Property Alias_AutopsyTarget Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0015_Item_00()
  If Self.GetStageDone(10) == False ; #DEBUG_LINE_NO:19
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
  Alias_AutopsyTarget.GetRef().Disable(False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(10) == False ; #DEBUG_LINE_NO:33
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
  Alias_AutopsyTarget.GetRef().Disable(False) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_RedHerring01.GetRef().Disable(False) ; #DEBUG_LINE_NO:47
  FavorTemplate02_002_RedHerring01.Start() ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_RedHerring02.GetRef().Disable(False) ; #DEBUG_LINE_NO:59
  FavorTemplate02_003_RedHerring02.Start() ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_KeyClue.GetRef().Disable(False) ; #DEBUG_LINE_NO:71
  FavorTemplate02_004_KeyClue.Start() ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:83
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:84
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:95
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:96
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:97
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:100
    Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:101
  EndIf ; #DEBUG_LINE_NO:
  Alias_RedHerring01.GetRef().Disable(False) ; #DEBUG_LINE_NO:105
  Alias_RedHerring02.GetRef().Disable(False) ; #DEBUG_LINE_NO:106
  Alias_KeyClue.GetRef().Disable(False) ; #DEBUG_LINE_NO:107
  Alias_AutopsyTarget.GetRef().Disable(False) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:116
  Self.Stop() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:125
  Self.Stop() ; #DEBUG_LINE_NO:126
EndFunction
