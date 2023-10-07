ScriptName Fragments:Quests:QF_TestAustinFQuest_00110F07 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_IDReader Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader") ; #DEBUG_LINE_NO:7
  readerScript.CallFunction("GotoSuccessState", None) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader") ; #DEBUG_LINE_NO:16
  readerScript.CallFunction("ResetIDCardReader", None) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0030_Item_00()
  ScriptObject readerScript = Alias_IDReader.getref().CastAs("IDCardReader") ; #DEBUG_LINE_NO:25
  readerScript.CallFunction("GotoLockdownState", None) ; #DEBUG_LINE_NO:26
EndFunction
