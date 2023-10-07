ScriptName Fragments:Quests:QF_City_Neon_Drug03_00233C2F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property Neon_Drug03_AuroraStash Auto Const mandatory
ReferenceAlias Property Alias_CacheContainer Auto Const mandatory
ReferenceAlias Property Alias_YannickStash Auto Const mandatory
RefCollectionAlias Property Alias_Complication01Enemies Auto Const mandatory
Book Property Drug03_RobieStashLocationNote Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
ReferenceAlias Property Alias_Robie Auto Const mandatory
ObjectReference Property Drug01_YannickStart_Marker Auto Const mandatory
GlobalVariable Property Neon_Drug03_Count Auto Const mandatory
Quest Property City_Neon_Drug_Game Auto Const mandatory
GlobalVariable Property Neon_Drug03_Complication Auto Const mandatory
ReferenceAlias Property Alias_Complication03Beggar Auto Const mandatory
RefCollectionAlias Property Alias_Complication03Enemies Auto Const mandatory
GlobalVariable Property Neon_Drug03_BeggarBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property DialogueFCNeon Auto Const mandatory
Quest Property City_Neon_Drug02 Auto Const mandatory
Cell Property LC168Xenofresh Auto Const mandatory
ObjectReference Property Drug02_FinaleInsideGuardREF Auto Const mandatory
ObjectReference Property Drug02_FinaleInsideGuardREF001 Auto Const mandatory
Message Property Drug03_AuroraFinalMessage Auto Const mandatory
GlobalVariable Property Drug03_RecipeDone Auto Const mandatory
GlobalVariable Property Neon_Drug03_CooldownTimestamp Auto Const mandatory
city_neon_drug03miscscript Property City_Neon_Drug03Misc Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_Yannick.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
  DialogueFCNeon.SetStage(490) ; #DEBUG_LINE_NO:10
  LC168Xenofresh.SetPublic(True) ; #DEBUG_LINE_NO:11
  City_Neon_Drug02.SetStage(300) ; #DEBUG_LINE_NO:14
  City_Neon_Drug02.SetStage(600) ; #DEBUG_LINE_NO:15
  City_Neon_Drug02.SetStage(9000) ; #DEBUG_LINE_NO:16
  Drug02_FinaleInsideGuardREF001.Disable(False) ; #DEBUG_LINE_NO:18
  Drug02_FinaleInsideGuardREF.Disable(False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0001_Item_00()
  If Neon_Drug03_Count.GetValue() == 0.0 ; #DEBUG_LINE_NO:28
    Self.SetStage(50) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  Int nPreviousComplication = Neon_Drug03_Complication.GetValue() as Int ; #DEBUG_LINE_NO:33
  Int nNewComplicationRoll = Utility.RandomInt(1, 7) ; #DEBUG_LINE_NO:34
  If nNewComplicationRoll == nPreviousComplication ; #DEBUG_LINE_NO:39
    nNewComplicationRoll = 2 ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
  If nNewComplicationRoll > 4 ; #DEBUG_LINE_NO:44
    nNewComplicationRoll = 2 ; #DEBUG_LINE_NO:45
  EndIf ; #DEBUG_LINE_NO:
  Neon_Drug03_Complication.SetValue(nNewComplicationRoll as Float) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:64
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:65
  City_Neon_Drug03Misc.Start() ; #DEBUG_LINE_NO:67
  City_Neon_Drug03Misc.ClearShiftTimer() ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:76
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:77
  City_Neon_Drug_Game.Start() ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(160, True) ; #DEBUG_LINE_NO:88
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Robie.GetRef().Enable(False) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:106
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:107
  Alias_CacheContainer.GetRef().Enable(False) ; #DEBUG_LINE_NO:110
  Int nComplication = Neon_Drug03_Complication.GetValue() as Int ; #DEBUG_LINE_NO:112
  If nComplication != 3 ; #DEBUG_LINE_NO:115
    Alias_CacheContainer.GetRef().AddAliasedItem(Neon_Drug03_AuroraStash as Form, Alias_YannickStash as Alias, 1, True) ; #DEBUG_LINE_NO:116
  EndIf ; #DEBUG_LINE_NO:
  If nComplication == 1 ; #DEBUG_LINE_NO:120
    Alias_Complication01Enemies.EnableAll(False) ; #DEBUG_LINE_NO:121
  ElseIf nComplication == 3 ; #DEBUG_LINE_NO:122
    ObjectReference oBeggar = Alias_Complication03Beggar.GetRef() ; #DEBUG_LINE_NO:123
    oBeggar.AddAliasedItem(Neon_Drug03_AuroraStash as Form, Alias_YannickStash as Alias, 1, True) ; #DEBUG_LINE_NO:124
    oBeggar.Enable(False) ; #DEBUG_LINE_NO:125
  ElseIf nComplication == 4 ; #DEBUG_LINE_NO:126
    Alias_Complication03Enemies.EnableAll(False) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0350_Item_00()
  (Alias_Complication03Beggar.GetRef() as Actor).StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0360_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:145
  Self.SetObjectiveDisplayed(360, True, False) ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0370_Item_00()
  Actor aPC = Game.GetPlayer() ; #DEBUG_LINE_NO:154
  aPC.RemoveItem(Credits as Form, Neon_Drug03_BeggarBribe.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:157
  aPC.AddItem(Alias_YannickStash.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:158
  Self.SetStage(400) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0385_Item_00()
  Actor aPC = Game.GetPlayer() ; #DEBUG_LINE_NO:169
  aPC.AddItem(Alias_YannickStash.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:170
  Self.SetStage(400) ; #DEBUG_LINE_NO:172
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:180
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:181
  Alias_Robie.GetRef().Disable(False) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:192
  Neon_Drug03_Count.Mod(1.0) ; #DEBUG_LINE_NO:195
  Self.SetStage(9000) ; #DEBUG_LINE_NO:197
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:205
  Neon_Drug03_Count.Mod(1.0) ; #DEBUG_LINE_NO:208
  Game.GetPlayer().RemoveItem(Neon_Drug03_AuroraStash as Form, 1, False, None) ; #DEBUG_LINE_NO:211
  Self.SetStage(9000) ; #DEBUG_LINE_NO:213
EndFunction

Function Fragment_Stage_8900_Item_00()
  Alias_CacheContainer.GetRef().Disable(False) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_9000_Item_00()
  City_Neon_Drug03Misc.StartShiftTimer() ; #DEBUG_LINE_NO:231
  If Drug03_RecipeDone.GetValue() == 0.0 ; #DEBUG_LINE_NO:233
    Drug03_AuroraFinalMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:234
    Drug03_RecipeDone.SetValue(1.0) ; #DEBUG_LINE_NO:235
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:237
  Self.Stop() ; #DEBUG_LINE_NO:238
EndFunction
