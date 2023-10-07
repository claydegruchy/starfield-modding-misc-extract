ScriptName Fragments:Quests:QF_SE_MQ207C_0022D67C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property MQ207C_100_DistressSignalHail Auto Const mandatory
Quest Property MQ207C Auto Const mandatory
Quest Property MQ207B Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  If MQ207C.GetStage() < 100 ; #DEBUG_LINE_NO:10
    MQ207C_100_DistressSignalHail.Start() ; #DEBUG_LINE_NO:11
  EndIf ; #DEBUG_LINE_NO:
  MQ207B.SetStage(35) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0030_Item_00()
  MQ207C.SetStage(105) ; #DEBUG_LINE_NO:26
EndFunction
