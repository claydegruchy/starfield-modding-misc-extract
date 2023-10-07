ScriptName City_Neon_DrugGameScript Extends Quest

;-- Structs -----------------------------------------
Struct HopperItem
  MiscObject hopperIngredient
  Int countGiven = 0
  Int countNeeded = 0
EndStruct

Struct RewardItem
  Message rewardMessage
  GlobalVariable rewardCredits
EndStruct


;-- Variables ---------------------------------------
Int maxRefills = 2
Bool playerAllowedRefill = False
Bool playerSucceeded = False

;-- Properties --------------------------------------
Group stages
  Int Property StageRoundStart = 100 Auto Const
  Int Property StageUsedHalfTime = 190 Auto Const
  Int Property StageUsedAllTime = 200 Auto Const
  Int Property StageUsedWrongIngredients = 280 Auto Const
  { stage to set if player took the wrong ingredients from the hopper }
  Int Property StageRoundFail = 325 Auto Const
  { stage to set if player failed completely - didn't deliver drug to assembly container }
  Int Property StageRoundFinish = 300 Auto Const
  Int Property StageGameComplete = 400 Auto Const
  { stage set when game is complete, whether or not player succeeded or not }
  Int Property City_Neon_Drug02_FinalRoundSuccessStage = 450 Auto Const
  { stage to set on City_Neon_Drug02 when player succeeds in the final round }
  Int Property City_Neon_Drug02_FinishGameStage = 460 Auto Const
  { stage to set on City_Neon_Drug02 when player finishes game }
  Int Property City_Neon_Drug03_FinalRoundSuccessStage = 200 Auto Const
  { stage to set on City_Neon_Drug02 when player succeeds in the final round }
  Int Property City_Neon_Drug03_FinishGameStage = 210 Auto Const
  { stage to set on City_Neon_Drug03 when player finishes game }
EndGroup

Group objectives
  Int Property City_Neon_Drug02_ObjectiveRound1 = 440 Auto Const
  Int Property City_Neon_Drug02_ObjectiveRound2 = 445 Auto Const
  Int Property City_Neon_Drug02_ObjectiveRound3 = 450 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound1 = 150 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound2 = 155 Auto Const
  Int Property City_Neon_Drug03_ObjectiveRound3 = 160 Auto Const
EndGroup

city_neon_drug02_script Property City_Neon_Drug02 Auto Const mandatory
city_neon_drug03_script Property City_Neon_Drug03 Auto Const mandatory
ReferenceAlias Property Alias_IngredientHopper Auto Const mandatory
ReferenceAlias Property Alias_AssemblyHopper Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
GlobalVariable Property Neon_Drug_ManufactureCount Auto Const mandatory
{ track current round }
GlobalVariable Property Neon_Drug_RetryCount Auto Const mandatory
{ track number of retries }
Scene Property City_Neon_Drug_Game_120_Aurora01 Auto Const mandatory
{ scene that tracks game progress }
Scene Property City_Neon_Drug_Game_Drug03_GameOVer Auto Const mandatory
Message Property Neon_Drug_07_ShiftFailed Auto Const mandatory
city_neon_druggamescript:hopperitem[] Property HopperItems Auto Const mandatory
city_neon_druggamescript:rewarditem[] Property Rewards Auto Const mandatory
{ array of reward levels, ordered from worst (0) to best }
MiscObject Property Credits Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestStarted()
  Int currentRetryCount = Neon_Drug_RetryCount.GetValueInt() ; #DEBUG_LINE_NO:88
  If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:89
    maxRefills = City_Neon_Drug02.maxRefills ; #DEBUG_LINE_NO:90
  Else ; #DEBUG_LINE_NO:
    maxRefills = City_Neon_Drug03.maxRefills ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
  If currentRetryCount < maxRefills ; #DEBUG_LINE_NO:96
    playerAllowedRefill = True ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  Alias_AssemblyHopper.GetRef().RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:102
  If playerAllowedRefill ; #DEBUG_LINE_NO:108
    Alias_IngredientHopper.GetRef().RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:110
    ObjectReference hopperRef = Alias_IngredientHopper.GetRef() ; #DEBUG_LINE_NO:112
    Int I = 0 ; #DEBUG_LINE_NO:113
    While I < HopperItems.Length ; #DEBUG_LINE_NO:114
      city_neon_druggamescript:hopperitem theHopperItem = HopperItems[I] ; #DEBUG_LINE_NO:115
      hopperRef.AddItem(theHopperItem.hopperIngredient as Form, theHopperItem.countGiven, False) ; #DEBUG_LINE_NO:117
      I += 1 ; #DEBUG_LINE_NO:118
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(StageRoundStart) ; #DEBUG_LINE_NO:122
  City_Neon_Drug_Game_120_Aurora01.Start() ; #DEBUG_LINE_NO:125
EndEvent

Function ValidateItemsUsed()
  Int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt() ; #DEBUG_LINE_NO:132
  ObjectReference hopperRef = Alias_IngredientHopper.GetRef() ; #DEBUG_LINE_NO:135
  City_Neon_Drug_Game_120_Aurora01.Stop() ; #DEBUG_LINE_NO:138
  Int I = 0 ; #DEBUG_LINE_NO:142
  While I < HopperItems.Length && Self.GetStageDone(StageUsedWrongIngredients) == False ; #DEBUG_LINE_NO:143
    city_neon_druggamescript:hopperitem theHopperItem = HopperItems[I] ; #DEBUG_LINE_NO:144
    Int amountInHopper = hopperRef.GetItemCount(theHopperItem.hopperIngredient as Form) ; #DEBUG_LINE_NO:146
    Int amountShouldBeLeft = theHopperItem.countGiven - theHopperItem.countNeeded ; #DEBUG_LINE_NO:147
    If amountInHopper < amountShouldBeLeft ; #DEBUG_LINE_NO:149
      Self.SetStage(StageUsedWrongIngredients) ; #DEBUG_LINE_NO:151
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:153
  EndWhile ; #DEBUG_LINE_NO:
  Self.SetStage(StageRoundFinish) ; #DEBUG_LINE_NO:156
EndFunction

Function RewardPlayer()
  playerSucceeded = True ; #DEBUG_LINE_NO:162
  Int rewardIndex = 0 ; #DEBUG_LINE_NO:165
  If Self.GetStageDone(StageUsedAllTime) || Neon_Drug_RetryCount.GetValue() > 0.0 ; #DEBUG_LINE_NO:167
     ; #DEBUG_LINE_NO:
  ElseIf Self.GetStageDone(StageUsedWrongIngredients) ; #DEBUG_LINE_NO:170
    rewardIndex = 1 ; #DEBUG_LINE_NO:173
  ElseIf Self.GetStageDone(StageUsedHalfTime) == True ; #DEBUG_LINE_NO:175
    rewardIndex = 2 ; #DEBUG_LINE_NO:178
  Else ; #DEBUG_LINE_NO:
    rewardIndex = 3 ; #DEBUG_LINE_NO:182
  EndIf ; #DEBUG_LINE_NO:
  city_neon_druggamescript:rewarditem theReward = Rewards[rewardIndex] ; #DEBUG_LINE_NO:186
  theReward.rewardMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:188
  Game.GetPlayer().AddItem(Credits as Form, theReward.rewardCredits.GetValueInt(), False) ; #DEBUG_LINE_NO:189
  Self.SetStage(StageGameComplete) ; #DEBUG_LINE_NO:191
EndFunction

Function Cleanup()
  Alias_ConveyorBelt.GetRef().PlayAnimation("play02") ; #DEBUG_LINE_NO:198
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:200
  Alias_AssemblyHopper.GetRef().RemoveAllItems(None, False, False) ; #DEBUG_LINE_NO:203
  Int manufactureCount = Neon_Drug_ManufactureCount.GetValueInt() ; #DEBUG_LINE_NO:206
  If manufactureCount == 0 ; #DEBUG_LINE_NO:208
    If playerSucceeded ; #DEBUG_LINE_NO:210
      If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:211
        City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound1, True) ; #DEBUG_LINE_NO:212
        City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound2, True, False) ; #DEBUG_LINE_NO:213
      ElseIf City_Neon_Drug03.IsRunning() ; #DEBUG_LINE_NO:214
        City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound1, True) ; #DEBUG_LINE_NO:215
        City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound2, True, False) ; #DEBUG_LINE_NO:216
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf manufactureCount == 1 ; #DEBUG_LINE_NO:219
    If playerSucceeded ; #DEBUG_LINE_NO:221
      If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:222
        City_Neon_Drug02.SetObjectiveCompleted(City_Neon_Drug02_ObjectiveRound2, True) ; #DEBUG_LINE_NO:223
        City_Neon_Drug02.SetObjectiveDisplayed(City_Neon_Drug02_ObjectiveRound3, True, False) ; #DEBUG_LINE_NO:224
      ElseIf City_Neon_Drug03.IsRunning() ; #DEBUG_LINE_NO:225
        City_Neon_Drug03.SetObjectiveCompleted(City_Neon_Drug03_ObjectiveRound2, True) ; #DEBUG_LINE_NO:226
        City_Neon_Drug03.SetObjectiveDisplayed(City_Neon_Drug03_ObjectiveRound3, True, False) ; #DEBUG_LINE_NO:227
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  ElseIf playerSucceeded ; #DEBUG_LINE_NO:
    If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:233
      City_Neon_Drug02.SetStage(City_Neon_Drug02_FinalRoundSuccessStage) ; #DEBUG_LINE_NO:234
    ElseIf City_Neon_Drug03.IsRunning() ; #DEBUG_LINE_NO:235
      City_Neon_Drug_Game_Drug03_GameOVer.Start() ; #DEBUG_LINE_NO:236
      Utility.Wait(5.0) ; #DEBUG_LINE_NO:237
      City_Neon_Drug03.SetStage(City_Neon_Drug03_FinalRoundSuccessStage) ; #DEBUG_LINE_NO:238
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If playerSucceeded ; #DEBUG_LINE_NO:243
    Neon_Drug_ManufactureCount.Mod(1.0) ; #DEBUG_LINE_NO:244
    Neon_Drug_RetryCount.SetValue(0.0) ; #DEBUG_LINE_NO:246
  Else ; #DEBUG_LINE_NO:
    Neon_Drug_RetryCount.Mod(1.0) ; #DEBUG_LINE_NO:249
    Utility.Wait(3.0) ; #DEBUG_LINE_NO:250
    Neon_Drug_07_ShiftFailed.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:251
  EndIf ; #DEBUG_LINE_NO:
  manufactureCount = Neon_Drug_ManufactureCount.GetValueInt() ; #DEBUG_LINE_NO:255
  If manufactureCount < 3 ; #DEBUG_LINE_NO:256
    If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:259
      City_Neon_Drug02.ReplayGame() ; #DEBUG_LINE_NO:260
    ElseIf City_Neon_Drug03.IsRunning() ; #DEBUG_LINE_NO:261
      City_Neon_Drug03.ReplayGame() ; #DEBUG_LINE_NO:262
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    If City_Neon_Drug02.IsRunning() ; #DEBUG_LINE_NO:267
      City_Neon_Drug02.SetStage(City_Neon_Drug02_FinishGameStage) ; #DEBUG_LINE_NO:268
    ElseIf City_Neon_Drug03.IsRunning() ; #DEBUG_LINE_NO:269
      City_Neon_Drug03.SetStage(City_Neon_Drug03_FinishGameStage) ; #DEBUG_LINE_NO:270
    EndIf ; #DEBUG_LINE_NO:
    Neon_Drug_ManufactureCount.SetValue(0.0) ; #DEBUG_LINE_NO:275
    Self.Stop() ; #DEBUG_LINE_NO:277
  EndIf ; #DEBUG_LINE_NO:
EndFunction
