ScriptName Fragments:Quests:QF_LC124_MiscQuest_001E9B99 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EnemyShip1 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip2 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip3 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip4 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip5 Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip6 Auto Const mandatory
RefCollectionAlias Property Alias_LC124_Enemies_Total Auto Const mandatory
Quest Property COM_Quest_SamCoe_Q01 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  COM_Quest_SamCoe_Q01.SetStage(1200) ; #DEBUG_LINE_NO:8
  Alias_EnemyShip1.GetReference().Enable(False) ; #DEBUG_LINE_NO:11
  Utility.wait(2.0) ; #DEBUG_LINE_NO:12
  Alias_EnemyShip2.GetReference().Enable(False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_EnemyShip3.GetReference().Enable(False) ; #DEBUG_LINE_NO:21
  Utility.wait(3.0) ; #DEBUG_LINE_NO:22
  Alias_EnemyShip4.GetReference().Enable(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0030_Item_00()
  Alias_EnemyShip5.GetReference().Enable(False) ; #DEBUG_LINE_NO:31
  Utility.wait(3.0) ; #DEBUG_LINE_NO:32
  Alias_EnemyShip6.GetReference().Enable(False) ; #DEBUG_LINE_NO:33
EndFunction

Function Fragment_Stage_0040_Item_00()
  COM_Quest_SamCoe_Q01.SetStage(1300) ; #DEBUG_LINE_NO:43
EndFunction
