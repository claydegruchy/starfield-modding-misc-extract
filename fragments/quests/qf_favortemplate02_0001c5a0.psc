ScriptName Fragments:Quests:QF_FavorTemplate02_0001C5A0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_RedHerring01 Auto Const mandatory
Scene Property FavorTemplate02_002_RedHerring01 Auto Const mandatory
ReferenceAlias Property Alias_RedHerring02 Auto Const mandatory
Scene Property FavorTemplate02_003_RedHerring02 Auto Const mandatory
ReferenceAlias Property Alias_KeyClue Auto Const mandatory
Scene Property FavorTemplate02_004_KeyClue Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:8
    Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_RedHerring01.GetRef().Disable(False) ; #DEBUG_LINE_NO:19
  FavorTemplate02_002_RedHerring01.Start() ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_RedHerring02.GetRef().Disable(False) ; #DEBUG_LINE_NO:31
  FavorTemplate02_003_RedHerring02.Start() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_KeyClue.GetRef().Disable(False) ; #DEBUG_LINE_NO:43
  FavorTemplate02_004_KeyClue.Start() ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(100) == False ; #DEBUG_LINE_NO:55
    Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:56
    Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(10) == True ; #DEBUG_LINE_NO:67
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:68
    Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:69
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:72
    Self.SetObjectiveDisplayed(35, True, False) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  Alias_RedHerring01.GetRef().Disable(False) ; #DEBUG_LINE_NO:77
  Alias_RedHerring02.GetRef().Disable(False) ; #DEBUG_LINE_NO:78
  Alias_KeyClue.GetRef().Disable(False) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0900_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:87
  Self.Stop() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0950_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:96
  Self.Stop() ; #DEBUG_LINE_NO:97
EndFunction
