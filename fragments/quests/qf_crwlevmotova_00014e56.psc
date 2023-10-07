ScriptName Fragments:Quests:QF_CRWLevMotova_00014E56 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CRWLevHire Auto Const mandatory
ReferenceAlias Property Alias_LevMotova Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  CRWLevHire.SetValue(CRWLevHire.GetValue() - 100.0) ; #DEBUG_LINE_NO:7
  Self.UpdateCurrentInstanceGlobal(CRWLevHire) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  crwcrewscript kmyQuest = __temp as crwcrewscript ; #DEBUG_LINE_NO:17
  kmyQuest.HireCrew(CRWLevHire.GetValue()) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  crwquestscript kmyQuest = __temp as crwquestscript ; #DEBUG_LINE_NO:29
  kmyQuest.CrewFired() ; #DEBUG_LINE_NO:32
EndFunction
