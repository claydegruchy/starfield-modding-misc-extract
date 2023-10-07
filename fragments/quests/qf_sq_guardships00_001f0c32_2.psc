ScriptName Fragments:Quests:QF_SQ_GuardShips00_001F0C32_2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  guardshipquestscript kmyQuest = __temp as guardshipquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.debugAlarmStatus() ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:19
  guardshipquestscript kmyQuest = __temp as guardshipquestscript ; #DEBUG_LINE_NO:20
  kmyQuest.AllowLanding(True) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:40
EndFunction
