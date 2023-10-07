ScriptName Fragments:Quests:QF_OE_KMK_Supply01_0025B292 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_NPC_Group00 Auto Const mandatory
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01Amount Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01AmountHalf Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01AmountThird Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardHalf Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardThird Auto Const mandatory
GlobalVariable Property OE_KMK_Supply01RewardActual Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0007_Item_00()
  Int baseAmount = OE_KMK_Supply01Amount.GetValueInt() ; #DEBUG_LINE_NO:16
  Int halfAmount = baseAmount / 2 ; #DEBUG_LINE_NO:17
  Int thirdAmount = baseAmount / 3 ; #DEBUG_LINE_NO:18
  OE_KMK_Supply01AmountHalf.SetValue(halfAmount as Float) ; #DEBUG_LINE_NO:19
  OE_KMK_Supply01AmountThird.SetValue(thirdAmount as Float) ; #DEBUG_LINE_NO:20
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountHalf) ; #DEBUG_LINE_NO:22
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01AmountThird) ; #DEBUG_LINE_NO:23
  Int baseReward = OE_KMK_Supply01RewardActual.GetValueInt() ; #DEBUG_LINE_NO:26
  Int halfReward = baseReward / 2 ; #DEBUG_LINE_NO:27
  Int thirdReward = baseReward / 3 ; #DEBUG_LINE_NO:28
  OE_KMK_Supply01RewardHalf.SetValue(halfReward as Float) ; #DEBUG_LINE_NO:29
  OE_KMK_Supply01RewardThird.SetValue(thirdReward as Float) ; #DEBUG_LINE_NO:30
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardHalf) ; #DEBUG_LINE_NO:32
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardThird) ; #DEBUG_LINE_NO:33
  Self.UpdateCurrentInstanceGlobal(OE_KMK_Supply01RewardActual) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetStage(50) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:50
  missionsupplyscript kmyQuest = __temp as missionsupplyscript ; #DEBUG_LINE_NO:51
  kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountHalf.GetValueInt()) ; #DEBUG_LINE_NO:54
  Self.SetStage(50) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:63
  missionsupplyscript kmyQuest = __temp as missionsupplyscript ; #DEBUG_LINE_NO:64
  kmyQuest.UpdateSupplyAmount(OE_KMK_Supply01AmountThird.GetValueInt()) ; #DEBUG_LINE_NO:67
  Self.SetStage(50) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0050_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:76
  missionsupplyscript kmyQuest = __temp as missionsupplyscript ; #DEBUG_LINE_NO:77
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:80
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 2.0) ; #DEBUG_LINE_NO:81
  kmyQuest.MissionAccepted(True) ; #DEBUG_LINE_NO:82
  Alias_MapMarker.GetRef().SetMarkerVisibleOnStarMap(True) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:91
  Alias_NPC01.GetRef().SetValue(RQ_AV_Hello, 3.0) ; #DEBUG_LINE_NO:92
EndFunction
