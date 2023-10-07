ScriptName Fragments:Quests:QF_FFCydoniaR02_00224FE8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property FFCydoniaR02_EquipmentCount Auto Const mandatory
Weapon Property Eon Auto Const mandatory
GlobalVariable Property FFCydoniaR02_NumTimesCompleted Auto Const mandatory
Quest Property AspirationalItems Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:15
  Self.SetStage(300) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0200_Item_00()
  If Self.GetStageDone(100) ; #DEBUG_LINE_NO:24
    Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:25
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:35
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:44
  If FFCydoniaR02_NumTimesCompleted.GetValue() < 1.0 ; #DEBUG_LINE_NO:45
    AspirationalItems.SetStage(100) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  FFCydoniaR02_NumTimesCompleted.Mod(1.0) ; #DEBUG_LINE_NO:49
  Self.Stop() ; #DEBUG_LINE_NO:51
EndFunction
