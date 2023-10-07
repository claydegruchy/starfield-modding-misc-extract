ScriptName Fragments:Quests:QF_OE_BryanB_RivalOperatives_0009749C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property OE_BryanB_BrotherInNeed_TalkToSamScene Auto Const
Scene Property OE_BryanB_BrotherInNeed_SamLivesScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:16
EndFunction
