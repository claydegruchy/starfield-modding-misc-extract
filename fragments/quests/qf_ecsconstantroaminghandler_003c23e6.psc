ScriptName Fragments:Quests:QF_ECSConstantRoamingHandler_003C23E6 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property FFConstantZ05 Auto Const mandatory
Quest Property FFConstantZ05Misc Auto Const mandatory
Keyword Property FFConstantR02MiscQuestStartKeyword Auto Const mandatory
Quest Property FFConstantR02 Auto Const mandatory
Quest Property FFConstantR02Misc Auto Const mandatory
GlobalVariable Property FFConstantR02_NumTimesCompleted Auto Const mandatory
GlobalVariable Property FFConstantR02_CompletedLimit Auto Const mandatory
Keyword Property ECSConstantRoamingHandlerQuestStartKeyword Auto Const mandatory
ReferenceAlias Property Alias_ShipMarker Auto Const mandatory
ReferenceAlias Property Alias_Ship Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !FFConstantZ05.IsRunning() && !FFConstantZ05.IsCompleted() ; #DEBUG_LINE_NO:7
    FFConstantZ05Misc.Start() ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0200_Item_00()
  If !FFConstantR02.IsRunning() && !FFConstantR02Misc.IsRunning() && FFConstantR02_NumTimesCompleted.GetValue() < FFConstantR02_CompletedLimit.GetValue() ; #DEBUG_LINE_NO:17
    FFConstantR02MiscQuestStartKeyword.SendStoryEvent(None, None, None, 0, 0) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0900_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:27
  ecsconstantroaminghandlerquestscript kmyQuest = __temp as ecsconstantroaminghandlerquestscript ; #DEBUG_LINE_NO:28
  kmyQuest.RandomJump() ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_1000_Item_00()
  ECSConstantRoamingHandlerQuestStartKeyword.SendStoryEventAndWait(None, None, None, 0, 0) ; #DEBUG_LINE_NO:39
  Self.Stop() ; #DEBUG_LINE_NO:40
EndFunction
