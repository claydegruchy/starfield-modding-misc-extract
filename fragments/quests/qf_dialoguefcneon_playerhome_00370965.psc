ScriptName Fragments:Quests:QF_DialogueFCNeon_PlayerHome_00370965 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Key Property FCNeon_TradeTowerPlayerHomeKey Auto Const mandatory
Key Property FCNeon_SleepcratePlayerHomeKey Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
GlobalVariable Property FCNeon_SleepcrateHomeGlobal Auto Const mandatory
GlobalVariable Property FCNeon_TradeTowerHomeGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  PlayerHouseSystem.PurchaseHouse(FCNeon_SleepcrateHomeGlobal, FCNeon_SleepcratePlayerHomeKey) ; #DEBUG_LINE_NO:8
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:18
  If Self.GetStageDone(40) ; #DEBUG_LINE_NO:19
    Self.Stop() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  PlayerHouseSystem.PurchaseHouse(FCNeon_TradeTowerHomeGlobal, FCNeon_TradeTowerPlayerHomeKey) ; #DEBUG_LINE_NO:30
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:40
  If Self.GetStageDone(20) ; #DEBUG_LINE_NO:41
    Self.Stop() ; #DEBUG_LINE_NO:42
  EndIf ; #DEBUG_LINE_NO:
EndFunction
