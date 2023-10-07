ScriptName RI_CrimeTrackingQuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property RI_TotalArrestCount Auto Const mandatory
GlobalVariable Property RI_TotalBodyCount Auto Const mandatory
GlobalVariable Property RI_TotalBountiesCount Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionSmall Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionMedium Auto Const mandatory
GlobalVariable Property RI_CreditsRewardDeductionLarge Auto Const mandatory
GlobalVariable Property RI_CrimeCountSmall Auto Const mandatory
GlobalVariable Property RI_CrimeCountMedium Auto Const mandatory
GlobalVariable Property RI_CrimeCountLarge Auto Const mandatory
GlobalVariable Property RewardGlobal Auto Const mandatory
GlobalVariable Property RI_CreditsReward Auto mandatory
GlobalVariable Property RI08_MasakoRemainedCEO Auto Const mandatory
Int Property iCompletionStage Auto Const mandatory
Int Property iTimesArrested Auto conditional
Int Property iBodyCount Auto conditional
Int Property iBountiesGained Auto conditional
Int Property iTheftArrest Auto conditional
Int Property iAttemptedMurderArrest Auto conditional
Int Property iMurderArrest Auto conditional

;-- Functions ---------------------------------------

Function SetRewardValues()
  RI_CreditsReward.SetValue(RewardGlobal.GetValue()) ; #DEBUG_LINE_NO:43
EndFunction

Function AddFinalValues()
  Float fCurrentArrestTotal = RI_TotalArrestCount.GetValue() ; #DEBUG_LINE_NO:49
  Float fCurrentBodyTotal = RI_TotalBodyCount.GetValue() ; #DEBUG_LINE_NO:50
  Float fCurrentBountyTotal = RI_TotalBountiesCount.GetValue() ; #DEBUG_LINE_NO:51
  RI_TotalArrestCount.SetValue(fCurrentArrestTotal + iTimesArrested as Float) ; #DEBUG_LINE_NO:55
  RI_TotalBodyCount.SetValue(fCurrentBodyTotal + iBodyCount as Float) ; #DEBUG_LINE_NO:56
  RI_TotalBountiesCount.SetValue(fCurrentBountyTotal + iBountiesGained as Float) ; #DEBUG_LINE_NO:57
  Self.CalculateRewards() ; #DEBUG_LINE_NO:61
EndFunction

Function CalculateRewards()
  If RI08_MasakoRemainedCEO.GetValue() != 0.0 ; #DEBUG_LINE_NO:68
    Float fTotalOffenses = (iTimesArrested + iBodyCount + iBountiesGained) as Float ; #DEBUG_LINE_NO:70
    Float fCurrentReward = RewardGlobal.GetValue() ; #DEBUG_LINE_NO:72
    Float fCrimeCountSmall = RI_CrimeCountSmall.GetValue() ; #DEBUG_LINE_NO:73
    Float fCrimeCountMedium = RI_CrimeCountMedium.GetValue() ; #DEBUG_LINE_NO:74
    Float fCrimeCountLarge = RI_CrimeCountLarge.GetValue() ; #DEBUG_LINE_NO:75
    If fTotalOffenses == 0.0 ; #DEBUG_LINE_NO:78
      RI_CreditsReward.SetValue(fCurrentReward) ; #DEBUG_LINE_NO:80
    ElseIf fTotalOffenses >= fCrimeCountSmall && fTotalOffenses < fCrimeCountMedium ; #DEBUG_LINE_NO:81
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionSmall.GetValue()) ; #DEBUG_LINE_NO:83
    ElseIf fTotalOffenses >= fCrimeCountMedium && fTotalOffenses < fCrimeCountLarge ; #DEBUG_LINE_NO:84
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionMedium.GetValue()) ; #DEBUG_LINE_NO:86
    ElseIf fTotalOffenses >= fCrimeCountLarge ; #DEBUG_LINE_NO:87
      RI_CreditsReward.SetValue(fCurrentReward - fCurrentReward * RI_CreditsRewardDeductionLarge.GetValue()) ; #DEBUG_LINE_NO:89
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If RI08_MasakoRemainedCEO.GetValue() == 0.0 ; #DEBUG_LINE_NO:93
    RI_CreditsReward.SetValue(RewardGlobal.GetValue()) ; #DEBUG_LINE_NO:95
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(iCompletionStage) ; #DEBUG_LINE_NO:100
EndFunction
