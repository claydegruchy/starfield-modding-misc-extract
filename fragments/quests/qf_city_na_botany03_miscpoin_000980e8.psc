ScriptName Fragments:Quests:QF_City_NA_Botany03_MiscPoin_000980E8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property TreeSoundMarker Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  botany03_waitscript kmyQuest = __temp as botany03_waitscript ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:11
  kmyQuest.Wait24() ; #DEBUG_LINE_NO:14
  Self.SetActive(True) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:25
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:26
  TreeSoundMarker.Enable(False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:37
  Self.CompleteQuest() ; #DEBUG_LINE_NO:38
  Self.Stop() ; #DEBUG_LINE_NO:39
EndFunction
