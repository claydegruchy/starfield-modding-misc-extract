ScriptName Fragments:Quests:QF_City_Neon_Drug02_00235C27 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property Drug02_275_ValentinaLibby Auto Const mandatory
Scene Property Drug02_325_ValentinaWalkAndTalk Auto Const mandatory
Scene Property Drug02_450_BreakTime Auto Const mandatory
ReferenceAlias Property Alias_CleanSuit Auto Const mandatory
ReferenceAlias Property Alias_BenjaminBayu Auto Const mandatory
ReferenceAlias Property Alias_Yannick Auto Const mandatory
ReferenceAlias Property Alias_Robie Auto Const mandatory
Quest Property City_Neon_Drug03 Auto Const mandatory
ReferenceAlias Property Alias_Valentina Auto Const mandatory
Quest Property City_Neon_Drug_Game Auto Const mandatory
Scene Property Drug02_575_GuardAlert Auto Const mandatory
RefCollectionAlias Property Alias_BayuGuards Auto Const mandatory
ObjectReference Property Drug02_FinaleMarker_Bayu Auto Const mandatory
ObjectReference Property Drug02_FinaleMarker_Yannick Auto Const mandatory
LeveledItem Property Drug02_AmpResearch Auto Const mandatory
ActorValue Property Drug02_Foreknowledge_YannickBayuAV Auto Const mandatory
Cell Property LC168Xenofresh Auto Const mandatory
ReferenceAlias Property Alias_ConveyorBelt Auto Const mandatory
RefCollectionAlias Property Alias_ShopPatrons Auto Const mandatory
ReferenceAlias Property Alias_JobTerminal Auto Const mandatory
Armor Property Clothes_Hazmat_Xenofresh_Suit_01 Auto Const mandatory
Message Property Drug02_AuroraMessage Auto Const mandatory
Scene Property Drug02_425a_Aurora Auto Const mandatory
researchproject Property Drug_Research_PerformanceEnhancement_01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().AddItem(Drug02_AmpResearch as Form, 1, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(100) ; #DEBUG_LINE_NO:24
  Self.SetStage(150) ; #DEBUG_LINE_NO:25
  Self.SetStage(200) ; #DEBUG_LINE_NO:26
  Self.SetStage(250) ; #DEBUG_LINE_NO:27
  Self.SetStage(260) ; #DEBUG_LINE_NO:28
  Game.GetPlayer().MoveTo(Alias_Valentina.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:45
  If Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == False ; #DEBUG_LINE_NO:47
    Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:48
  ElseIf Game.IsResearchComplete(Drug_Research_PerformanceEnhancement_01) == True ; #DEBUG_LINE_NO:49
    Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:50
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveDisplayed(260, True, False) ; #DEBUG_LINE_NO:69
  Alias_JobTerminal.GetRef().Activate(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0260_Item_00()
  Self.SetObjectiveCompleted(260, True) ; #DEBUG_LINE_NO:78
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:79
  LC168Xenofresh.SetPublic(True) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0275_Item_00()
  Drug02_275_ValentinaLibby.Start() ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:98
  Self.SetObjectiveDisplayed(325, True, False) ; #DEBUG_LINE_NO:99
  Game.GetPlayer().AddAliasedItem(Clothes_Hazmat_Xenofresh_Suit_01 as Form, Alias_CleanSuit as Alias, 1, True) ; #DEBUG_LINE_NO:102
  Drug02_AuroraMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0325_Item_00()
  Self.SetObjectiveCompleted(325, True) ; #DEBUG_LINE_NO:113
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:114
  Drug02_325_ValentinaWalkAndTalk.Start() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:125
  Self.SetObjectiveDisplayed(375, True, False) ; #DEBUG_LINE_NO:126
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(375, True) ; #DEBUG_LINE_NO:134
  Self.SetObjectiveDisplayed(410, True, False) ; #DEBUG_LINE_NO:135
  Alias_Valentina.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:137
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:138
  Self.SetStage(405) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0405_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:148
  city_neon_drug02_script kmyQuest = __temp as city_neon_drug02_script ; #DEBUG_LINE_NO:149
  kmyQuest.AddItemsToHopper() ; #DEBUG_LINE_NO:153
  Alias_ConveyorBelt.GetRef().PlayAnimation("play01") ; #DEBUG_LINE_NO:156
  Drug02_425a_Aurora.Start() ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0410_Item_00()
  Self.SetObjectiveCompleted(410, True) ; #DEBUG_LINE_NO:167
  Self.SetObjectiveDisplayed(420, True, False) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0420_Item_00()
  Self.SetObjectiveCompleted(420, True) ; #DEBUG_LINE_NO:176
  Self.SetObjectiveDisplayed(430, True, False) ; #DEBUG_LINE_NO:177
EndFunction

Function Fragment_Stage_0430_Item_00()
  Self.SetObjectiveCompleted(430, True) ; #DEBUG_LINE_NO:185
  Self.SetObjectiveDisplayed(440, True, False) ; #DEBUG_LINE_NO:186
  Alias_ConveyorBelt.GetRef().PlayAnimation("play02") ; #DEBUG_LINE_NO:189
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:192
  Self.SetStage(440) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0440_Item_00()
  City_Neon_Drug_Game.Start() ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0450_Item_00()
  Self.SetObjectiveCompleted(450, True) ; #DEBUG_LINE_NO:210
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:211
  Drug02_450_BreakTime.Start() ; #DEBUG_LINE_NO:214
EndFunction

Function Fragment_Stage_0460_Item_00()
  Alias_Robie.GetRef().Enable(False) ; #DEBUG_LINE_NO:223
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:231
  Self.SetObjectiveDisplayed(575, True, False) ; #DEBUG_LINE_NO:232
  Alias_BayuGuards.EnableAll(False) ; #DEBUG_LINE_NO:235
  Alias_ShopPatrons.DisableAll(False) ; #DEBUG_LINE_NO:238
  Alias_BenjaminBayu.GetRef().MoveTo(Drug02_FinaleMarker_Bayu, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:241
  Alias_Yannick.GetRef().MoveTo(Drug02_FinaleMarker_Yannick, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_0575_Item_00()
  Self.SetObjectiveCompleted(575, True) ; #DEBUG_LINE_NO:250
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:251
  Drug02_575_GuardAlert.Start() ; #DEBUG_LINE_NO:254
EndFunction

Function Fragment_Stage_0585_Item_00()
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:262
EndFunction

Function Fragment_Stage_0600_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:270
  city_neon_drug02_script kmyQuest = __temp as city_neon_drug02_script ; #DEBUG_LINE_NO:271
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:274
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:276
  City_Neon_Drug03.Start() ; #DEBUG_LINE_NO:279
  City_Neon_Drug03.SetActive(True) ; #DEBUG_LINE_NO:280
  Alias_BayuGuards.EvaluateAll() ; #DEBUG_LINE_NO:283
  Alias_BenjaminBayu.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:284
  Game.GetPlayer().SetValue(Drug02_Foreknowledge_YannickBayuAV, 1.0) ; #DEBUG_LINE_NO:287
  kmyQuest.ReleasePlayer() ; #DEBUG_LINE_NO:290
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_BayuGuards.EnableAll(False) ; #DEBUG_LINE_NO:299
  Alias_ShopPatrons.EnableAll(False) ; #DEBUG_LINE_NO:302
  Self.Stop() ; #DEBUG_LINE_NO:304
EndFunction
