ScriptName Fragments:Quests:QF_Landmark_Osaka_00026EAC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property Wwise_Event_QST_Landmark_Snowglobe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:16
  landmarkscript kmyQuest = __temp as landmarkscript ; #DEBUG_LINE_NO:17
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:20
  Wwise_Event_QST_Landmark_Snowglobe.PlayUI(None, None) ; #DEBUG_LINE_NO:23
  kmyQuest.LandmarkFound() ; #DEBUG_LINE_NO:26
  Self.SetStage(9000) ; #DEBUG_LINE_NO:28
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:36
EndFunction
