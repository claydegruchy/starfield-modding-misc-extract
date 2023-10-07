ScriptName Fragments:Quests:QF_SQ_GuardShips01_001F0C33_6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
GlobalVariable Property SQ_GuardShipsWaitToScan Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  SQ_GuardShipsWaitToScan.SetValue(0.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  guardshipquestscript kmyQuest = __temp as guardshipquestscript ; #DEBUG_LINE_NO:16
  kmyQuest.debugAlarmStatus() ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:27
  guardshipquestscript kmyQuest = __temp as guardshipquestscript ; #DEBUG_LINE_NO:28
  kmyQuest.AllowLanding(True) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:48
EndFunction
