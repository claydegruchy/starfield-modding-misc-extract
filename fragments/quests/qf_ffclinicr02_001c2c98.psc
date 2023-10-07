ScriptName Fragments:Quests:QF_FFClinicR02_001C2C98 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property OrgCommonToxin Auto Const mandatory
MiscObject Property OrgUncommonAntibiotic Auto Const mandatory
MiscObject Property OrgUncommonMembrane Auto Const mandatory
MiscObject Property OrgCommonSealant Auto Const mandatory
MiscObject Property OrgRareAnalgesic Auto Const mandatory
MiscObject Property OrgRareSedative Auto Const mandatory
MiscObject Property OrgExoticNarcotic Auto Const mandatory
MiscObject Property OrgExoticBiosuppressant Auto Const mandatory
ReferenceAlias Property Alias_ResourceAlias Auto Const mandatory
GlobalVariable Property FFClinicR02ResourceNumber Auto Const mandatory
GlobalVariable Property FFClinicR02ItemTotal Auto Const mandatory
GlobalVariable Property FFClinicR02ItemCount Auto Const mandatory
GlobalVariable Property FFClinicR02CompletionNumber Auto Const
GlobalVariable Property FFClinicR02DaysPassed Auto Const mandatory
GlobalVariable Property GameDaysPassed Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript ; #DEBUG_LINE_NO:8
  FFClinicR02ResourceNumber.SetValueInt(Utility.RandomInt(1, 8)) ; #DEBUG_LINE_NO:11
  If FFClinicR02ResourceNumber.GetValue() == 1.0 ; #DEBUG_LINE_NO:13
    Game.GetPlayer().PlaceAtMe(OrgCommonToxin as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:14
    FFClinicR02ItemTotal.SetValueInt(10) ; #DEBUG_LINE_NO:15
  ElseIf FFClinicR02ResourceNumber.GetValue() == 2.0 ; #DEBUG_LINE_NO:16
    Game.GetPlayer().PlaceAtMe(OrgCommonSealant as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:17
    FFClinicR02ItemTotal.SetValueInt(10) ; #DEBUG_LINE_NO:18
  ElseIf FFClinicR02ResourceNumber.GetValue() == 3.0 ; #DEBUG_LINE_NO:19
    Game.GetPlayer().PlaceAtMe(OrgUncommonMembrane as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:20
    FFClinicR02ItemTotal.SetValueInt(7) ; #DEBUG_LINE_NO:21
  ElseIf FFClinicR02ResourceNumber.GetValue() == 4.0 ; #DEBUG_LINE_NO:22
    Game.GetPlayer().PlaceAtMe(OrgUncommonAntibiotic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:23
    FFClinicR02ItemTotal.SetValueInt(7) ; #DEBUG_LINE_NO:24
  ElseIf FFClinicR02ResourceNumber.GetValue() == 5.0 ; #DEBUG_LINE_NO:25
    Game.GetPlayer().PlaceAtMe(OrgRareAnalgesic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:26
    FFClinicR02ItemTotal.SetValueInt(5) ; #DEBUG_LINE_NO:27
  ElseIf FFClinicR02ResourceNumber.GetValue() == 6.0 ; #DEBUG_LINE_NO:28
    Game.GetPlayer().PlaceAtMe(OrgRareSedative as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:29
    FFClinicR02ItemTotal.SetValueInt(5) ; #DEBUG_LINE_NO:30
  ElseIf FFClinicR02ResourceNumber.GetValue() == 7.0 ; #DEBUG_LINE_NO:31
    Game.GetPlayer().PlaceAtMe(OrgExoticNarcotic as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:32
    FFClinicR02ItemTotal.SetValueInt(3) ; #DEBUG_LINE_NO:33
  ElseIf FFClinicR02ResourceNumber.GetValue() == 8.0 ; #DEBUG_LINE_NO:34
    Game.GetPlayer().PlaceAtMe(OrgExoticBiosuppressant as Form, 1, False, True, True, None, Alias_ResourceAlias as Alias, True) ; #DEBUG_LINE_NO:35
    FFClinicR02ItemTotal.SetValueInt(3) ; #DEBUG_LINE_NO:36
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.CalculateRewards() ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:55
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript ; #DEBUG_LINE_NO:56
  kmyQuest.RemoveResourceItems() ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0200_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:67
  ffclinicr02questscript kmyQuest = __temp as ffclinicr02questscript ; #DEBUG_LINE_NO:68
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:71
  FFClinicR02CompletionNumber.Mod(1.0) ; #DEBUG_LINE_NO:73
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:76
  FFClinicR02ItemCount.SetValueInt(0) ; #DEBUG_LINE_NO:77
  FFClinicR02DaysPassed.SetValue(GameDaysPassed.GetValue() + 1.0) ; #DEBUG_LINE_NO:80
  Self.Stop() ; #DEBUG_LINE_NO:82
EndFunction
