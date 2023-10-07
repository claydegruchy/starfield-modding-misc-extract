ScriptName Fragments:Quests:QF_FCR01_0014AFC0 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FCR01TimesCompleted Auto Const mandatory
ReferenceAlias Property Alias_FirstBossRename Auto Const mandatory
ReferenceAlias Property Alias_BossREF Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:20
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:21
  If FCR01TimesCompleted.GetValue() == 0.0 ; #DEBUG_LINE_NO:24
    Self.SetStage(110) ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  If FCR01TimesCompleted.GetValue() == 0.0 ; #DEBUG_LINE_NO:35
    Alias_FirstBossRename.ForceRefTo(Alias_BossREF.GetRef()) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:45
  If FCR01TimesCompleted.GetValue() == 0.0 ; #DEBUG_LINE_NO:48
    Self.SetObjectiveDisplayed(155, True, False) ; #DEBUG_LINE_NO:49
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveCompleted(155, True) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:70
  FCR01TimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:73
  Self.SetStage(9000) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:83
EndFunction
