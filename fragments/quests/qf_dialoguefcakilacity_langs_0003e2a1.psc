ScriptName Fragments:Quests:QF_DialogueFCAkilaCity_Langs_0003E2A1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property AkilaCityLife_2030_Frank Auto Const mandatory
Quest Property DialogueFCAkilaCity Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  AkilaCityLife_2030_Frank.Start() ; #DEBUG_LINE_NO:7
  DialogueFCAkilaCity.SetStage(2030) ; #DEBUG_LINE_NO:8
  Self.SetStage(200) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:17
EndFunction
