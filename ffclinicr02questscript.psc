ScriptName FFClinicR02QuestScript Extends Quest conditional

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property OrgCommonToxin Auto Const mandatory
MiscObject Property OrgCommonSealant Auto Const mandatory
MiscObject Property OrgUncommonMembrane Auto Const mandatory
MiscObject Property OrgUncommonAntibiotic Auto Const mandatory
MiscObject Property OrgRareAnalgesic Auto Const mandatory
MiscObject Property OrgRareSedative Auto Const mandatory
MiscObject Property OrgExoticNarcotic Auto Const mandatory
MiscObject Property OrgExoticBiosuppressant Auto Const mandatory
GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
GlobalVariable Property FFClinicR02Reward Auto Const mandatory
resource Property ResourceOrgCommonSealant Auto Const
resource Property ResCommonToxin Auto Const
resource Property ResOrgExoticBiosuppressant Auto Const
resource Property ResOrgExoticNarcotic Auto Const
resource Property ResOrgRareAnalgesic Auto Const
resource Property ResOrgRareSedative Auto Const
resource Property ResOrgUncommonAntibiotic Auto Const
resource Property ResOrgUncommonMembrane Auto Const

;-- Functions ---------------------------------------

Function CalculateRewards()
  If FFClinicR02ResourceNumber.GetValueInt() == 1 ; #DEBUG_LINE_NO:47
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgCommonToxin.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:48
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2 ; #DEBUG_LINE_NO:49
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgCommonSealant.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:50
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3 ; #DEBUG_LINE_NO:51
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgUncommonMembrane.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:52
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4 ; #DEBUG_LINE_NO:53
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgUncommonAntibiotic.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:54
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5 ; #DEBUG_LINE_NO:55
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgRareAnalgesic.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:56
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6 ; #DEBUG_LINE_NO:57
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgRareSedative.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:58
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7 ; #DEBUG_LINE_NO:59
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgExoticNarcotic.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:60
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8 ; #DEBUG_LINE_NO:61
    FFClinicR02Reward.SetValue((FFClinicR02ItemTotal.GetValueInt() * OrgExoticBiosuppressant.GetGoldValue()) as Float * 1.5) ; #DEBUG_LINE_NO:62
  EndIf ; #DEBUG_LINE_NO:
  Self.UpdateCurrentInstanceGlobal(FFClinicR02ItemTotal) ; #DEBUG_LINE_NO:65
EndFunction

Function RemoveResourceItems()
  If FFClinicR02ResourceNumber.GetValueInt() == 1 ; #DEBUG_LINE_NO:72
    Game.GetPlayer().RemoveItem(ResCommonToxin as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:73
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 2 ; #DEBUG_LINE_NO:74
    Game.GetPlayer().RemoveItem(ResourceOrgCommonSealant as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:75
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 3 ; #DEBUG_LINE_NO:76
    Game.GetPlayer().RemoveItem(ResOrgUncommonMembrane as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:77
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 4 ; #DEBUG_LINE_NO:78
    Game.GetPlayer().RemoveItem(ResOrgUncommonAntibiotic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:79
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 5 ; #DEBUG_LINE_NO:80
    Game.GetPlayer().RemoveItem(ResOrgRareAnalgesic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:81
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 6 ; #DEBUG_LINE_NO:82
    Game.GetPlayer().RemoveItem(ResOrgRareSedative as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:83
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 7 ; #DEBUG_LINE_NO:84
    Game.GetPlayer().RemoveItem(ResOrgExoticNarcotic as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:85
  ElseIf FFClinicR02ResourceNumber.GetValueInt() == 8 ; #DEBUG_LINE_NO:86
    Game.GetPlayer().RemoveItem(ResOrgExoticBiosuppressant as Form, FFClinicR02ItemTotal.GetValueInt(), False, None) ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(200) ; #DEBUG_LINE_NO:89
EndFunction
