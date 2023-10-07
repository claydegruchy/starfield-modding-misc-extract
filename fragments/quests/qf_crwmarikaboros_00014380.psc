ScriptName Fragments:Quests:QF_CRWMarikaBoros_00014380 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property CRWMarikaHire Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0150_Item_00()
  CRWMarikaHire.SetValue(CRWMarikaHire.GetValue() - 100.0) ; #DEBUG_LINE_NO:7
  Self.UpdateCurrentInstanceGlobal(CRWMarikaHire) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  crwcrewscript kmyQuest = __temp as crwcrewscript ; #DEBUG_LINE_NO:17
  kmyQuest.HireCrew(CRWMarikaHire.GetValue()) ; #DEBUG_LINE_NO:20
EndFunction
