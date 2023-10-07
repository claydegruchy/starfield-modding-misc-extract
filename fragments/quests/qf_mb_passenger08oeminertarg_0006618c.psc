ScriptName Fragments:Quests:QF_MB_Passenger08OEMinerTarg_0006618C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property PCM_Request_OE_Civilian Auto Const mandatory
LocationAlias Property Alias_TargetPlanetLocation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_TargetPlanetLocation.GetLocation().AddKeyword(PCM_Request_OE_Civilian) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.StopQuestTimer() ; #DEBUG_LINE_NO:24
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:25
EndFunction
