ScriptName Fragments:Quests:QF_DialogueCFTheKey_RandomId_0000D725 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Pirat01 Auto Const mandatory
ReferenceAlias Property Alias_Pirat02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ObjectReference Pirate01 = Alias_Pirat01.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference Pirate02 = Alias_Pirat02.GetRef() ; #DEBUG_LINE_NO:8
  Pirate01.DisableNoWait(False) ; #DEBUG_LINE_NO:10
  Pirate02.DisableNoWait(False) ; #DEBUG_LINE_NO:11
  Pirate01.Delete() ; #DEBUG_LINE_NO:12
  Pirate02.Delete() ; #DEBUG_LINE_NO:13
EndFunction
