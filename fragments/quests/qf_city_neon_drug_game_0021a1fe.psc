ScriptName Fragments:Quests:QF_City_Neon_Drug_Game_0021A1FE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property City_Neon_Drug_Game_200_AssemblyComplete Auto Const mandatory
Message Property Neon_Drug_05_TimedOut Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
Message Property Neon_Drug_06_TimedOutFollowup Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0120_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0280_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetStage(120) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_ConveyorBelt.GetRef().PlayAnimation("play01") ; #DEBUG_LINE_NO:40
EndFunction

Function Fragment_Stage_0200_Item_00()
  Neon_Drug_06_TimedOutFollowup.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0220_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:57
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript ; #DEBUG_LINE_NO:58
  kmyQuest.ValidateItemsUsed() ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0300_Item_00()
  City_Neon_Drug_Game_200_AssemblyComplete.Start() ; #DEBUG_LINE_NO:81
  Self.SetStage(350) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0325_Item_00()
  Neon_Drug_05_TimedOut.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:94
  Self.SetStage(400) ; #DEBUG_LINE_NO:96
EndFunction

Function Fragment_Stage_0350_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:104
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript ; #DEBUG_LINE_NO:105
  kmyQuest.RewardPlayer() ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0400_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:118
  city_neon_druggamescript kmyQuest = __temp as city_neon_druggamescript ; #DEBUG_LINE_NO:119
  kmyQuest.Cleanup() ; #DEBUG_LINE_NO:124
EndFunction
