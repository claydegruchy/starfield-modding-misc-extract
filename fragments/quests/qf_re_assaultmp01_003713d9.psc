ScriptName Fragments:Quests:QF_RE_AssaultMP01_003713D9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_TRIGGER Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  rescript kmyQuest = __temp as rescript ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  reassaultquestscript kmyQuest = __temp as reassaultquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.StartAssault() ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  reassaultquestscript kmyQuest = __temp as reassaultquestscript ; #DEBUG_LINE_NO:32
  kmyQuest.CompleteAssault() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:44
  reassaultquestscript kmyQuest = __temp as reassaultquestscript ; #DEBUG_LINE_NO:45
  kmyQuest.CompleteAssault() ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:57
  reassaultquestscript kmyQuest = __temp as reassaultquestscript ; #DEBUG_LINE_NO:58
  kmyQuest.CleanupAssault() ; #DEBUG_LINE_NO:61
EndFunction

Function Fragment_Stage_1000_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:69
  rescript kmyQuest = __temp as rescript ; #DEBUG_LINE_NO:70
EndFunction
