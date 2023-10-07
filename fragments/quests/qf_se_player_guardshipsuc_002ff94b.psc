ScriptName Fragments:Quests:QF_SE_Player_GuardShipsUC_002FF94B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  guardshipquestscript kmyQuest = __temp as guardshipquestscript ; #DEBUG_LINE_NO:8
  kmyQuest.AllowLanding(True) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:20
EndFunction
