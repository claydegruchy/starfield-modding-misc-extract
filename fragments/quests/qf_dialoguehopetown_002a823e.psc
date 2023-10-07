ScriptName Fragments:Quests:QF_DialogueHopeTown_002A823E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueHopeTown_100_IntroScene Auto Const mandatory
Quest Property SY_HopeTech_TestPilot01 Auto Const mandatory
Quest Property Hope01 Auto Const mandatory
Quest Property Hope02 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0999_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0050_Item_00()
  Hope01.Start() ; #DEBUG_LINE_NO:8
  Hope02.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0100_Item_00()
  DialogueHopeTown_100_IntroScene.Start() ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_1110_Item_00()
  SY_HopeTech_TestPilot01.SetStage(100) ; #DEBUG_LINE_NO:36
EndFunction
