ScriptName Fragments:Quests:QF_DialogueCydonia_Detonatio_0009B72E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CY_DetonationCount Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.SelectCorrectDetonation() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.DelayQuestEndForLastCall() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_10000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  dialoguecydoniadetonationquestscript kmyQuest = __temp as dialoguecydoniadetonationquestscript ; #DEBUG_LINE_NO:32
  If CY_DetonationCount.GetValue() < 1.0 ; #DEBUG_LINE_NO:35
    CY_DetonationCount.Mod(1.0) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.EndKlaxons() ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:48
EndFunction
