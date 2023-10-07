ScriptName Fragments:Quests:QF_DialogueCydonia_Detonatio_000FB71F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property DialogueCydoniaDetonationQuestStartKeyword Auto Const mandatory
GlobalVariable Property CY_DetonationCount Auto Const mandatory
RefCollectionAlias Property Alias_DetonationFirstTimeTriggers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  cydetonationhelperquestscript kmyQuest = __temp as cydetonationhelperquestscript ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_DetonationFirstTimeTriggers.DisableAll(False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:28
EndFunction
