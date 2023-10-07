ScriptName Fragments:Quests:QF_Landmark_Cairo_00009A2C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
wwiseevent Property Wwise_Event_QST_Landmark_Snowglobe Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  landmarkscript kmyQuest = __temp as landmarkscript ; #DEBUG_LINE_NO:16
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:19
  Wwise_Event_QST_Landmark_Snowglobe.PlayUI(None, None) ; #DEBUG_LINE_NO:22
  kmyQuest.LandmarkFound() ; #DEBUG_LINE_NO:25
  Self.SetStage(9000) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:35
EndFunction
