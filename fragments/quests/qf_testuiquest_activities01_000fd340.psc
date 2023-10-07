ScriptName Fragments:Quests:QF_TestUIQuest_Activities01_000FD340 Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.setobjectivedisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Self.setobjectivedisplayed(20, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.setobjectivecompleted(10, True) ; #DEBUG_LINE_NO:16
  Self.setobjectivecompleted(20, True) ; #DEBUG_LINE_NO:17
EndFunction
