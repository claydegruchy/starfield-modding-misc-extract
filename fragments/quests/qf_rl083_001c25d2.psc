ScriptName Fragments:Quests:QF_RL083_001C25D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PanelTop01 Auto Const
ObjectReference Property PanelTop02 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:23
  rl083_assemblyline kmyQuest = __temp as rl083_assemblyline ; #DEBUG_LINE_NO:24
  kmyQuest.StartConstruct() ; #DEBUG_LINE_NO:27
EndFunction
