ScriptName Fragments:Quests:QF_FFCydoniaZ07_0030270B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFCydoniaZ07Misc Auto Const mandatory
LocationAlias Property Alias_Cave Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ07Misc.IsRunning() ; #DEBUG_LINE_NO:7
    FFCydoniaZ07Misc.SetStage(1000) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
  Location myCave = Alias_Cave.GetLocation() ; #DEBUG_LINE_NO:12
  If myCave.IsExplored() ; #DEBUG_LINE_NO:13
    Self.SetStage(10) ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:25
  ffcydoniaz07questscript kmyQuest = __temp as ffcydoniaz07questscript ; #DEBUG_LINE_NO:26
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:30
  kmyQuest.RegisterOre() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:49
  Self.Stop() ; #DEBUG_LINE_NO:50
EndFunction
