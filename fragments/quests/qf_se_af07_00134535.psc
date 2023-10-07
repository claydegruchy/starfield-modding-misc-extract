ScriptName Fragments:Quests:QF_SE_AF07_00134535 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property SE_AF07_001_SpawnScene Auto Const
ReferenceAlias Property Alias_TestBeacon Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  se_af07script kmyQuest = __temp as se_af07script ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
  kmyQuest.StartWaves() ; #DEBUG_LINE_NO:12
  Alias_TestBeacon.getref().BlockActivation(True, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:21
EndFunction
