ScriptName Fragments:Quests:QF_LC008_EavesdroppingScenes_0025C610 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property LC008EavesdroppingScene3 Auto Const mandatory
Scene Property LC008EavesdroppingScene1 Auto Const mandatory
Scene Property LC008EavesdroppingScene2 Auto Const mandatory
Scene Property LC008EavesdroppingScene4 Auto Const mandatory
Scene Property LC008EavesdroppingScene5 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  LC008EavesdroppingScene3.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  LC008EavesdroppingScene1.Start() ; #DEBUG_LINE_NO:15
  LC008EavesdroppingScene2.Start() ; #DEBUG_LINE_NO:16
  LC008EavesdroppingScene4.Start() ; #DEBUG_LINE_NO:17
  LC008EavesdroppingScene5.Start() ; #DEBUG_LINE_NO:18
EndFunction
