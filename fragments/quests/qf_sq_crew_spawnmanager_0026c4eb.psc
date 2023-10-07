ScriptName Fragments:Quests:QF_SQ_Crew_SpawnManager_0026C4EB Extends Quest Const hidden

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  sq_crew_spawnmanagerscript kmyQuest = __temp as sq_crew_spawnmanagerscript ; #DEBUG_LINE_NO:8
  kmyQuest.RollToEnableRefs() ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:20
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:28
  sq_crew_spawnmanagerscript kmyQuest = __temp as sq_crew_spawnmanagerscript ; #DEBUG_LINE_NO:29
  Self.Stop() ; #DEBUG_LINE_NO:33
EndFunction
