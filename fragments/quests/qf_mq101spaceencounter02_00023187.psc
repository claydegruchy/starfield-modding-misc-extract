ScriptName Fragments:Quests:QF_MQ101SpaceEncounter02_00023187 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property MQ101 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  If Self.GetStageDone(20) ; #DEBUG_LINE_NO:8
    Self.SetStage(100) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  If Self.GetStageDone(10) ; #DEBUG_LINE_NO:19
    Self.SetStage(100) ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ101.SetStage(500) ; #DEBUG_LINE_NO:29
EndFunction
