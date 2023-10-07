ScriptName Fragments:Quests:QF_CFKey_TerminalQuest_001FE5C5 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property CFKey_PublicAccessTerminalGlobal Auto Const mandatory
ReferenceAlias Property Alias_TerminalRandomizer Auto Const mandatory
ReferenceAlias Property Alias_Terminal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_TerminalRandomizer.ForceRefTo(Alias_Terminal.GetRef()) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0010_Item_00()
  CFKey_PublicAccessTerminalGlobal.SetValue(Utility.RandomInt(0, 20) as Float) ; #DEBUG_LINE_NO:15
  Alias_TerminalRandomizer.Clear() ; #DEBUG_LINE_NO:16
EndFunction
