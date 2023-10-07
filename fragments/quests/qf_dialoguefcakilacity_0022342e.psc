ScriptName Fragments:Quests:QF_DialogueFCAkilaCity_0022342E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Player Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ObjectReference Property FC01_BankRobbersEnableMarker Auto Const mandatory
Quest Property FC01 Auto Const mandatory
Quest Property RAD03 Auto Const mandatory
ReferenceAlias Property Alias_DuncanLynch Auto Const mandatory
Quest Property City_AkilaLife01 Auto Const mandatory
Quest Property City_AkilaLife02 Auto Const mandatory
GlobalVariable Property PlayerHouse_AC_CoreCost Auto Const mandatory
GlobalVariable Property PlayerHouse_AC_MidtownCost Auto Const mandatory
Scene Property AkilaCity_Earl_SnuckIn Auto Const mandatory
Quest Property City_AkilaLife04 Auto Const mandatory
Quest Property City_AkilaLife06 Auto Const mandatory
Quest Property City_AkilaLife08 Auto Const mandatory
Key Property CityAkilaCityCoreHouseKey Auto Const mandatory
Quest Property UC_AC_Home_CoreHouse_Misc Auto Const mandatory
Quest Property FC_AC_Home_MidtownHouse_Misc Auto Const mandatory
Key Property CityAkilaCityMidtownHouseKey Auto Const mandatory
Scene Property AkilaCityLife_2010_Davis Auto Const mandatory
ReferenceAlias Property Alias_AugustBowen Auto Const mandatory
Quest Property City_Akila_Jansen Auto Const mandatory
ReferenceAlias Property Alias_JustinSnead Auto Const mandatory
Quest Property City_AkilaLife03 Auto Const mandatory
Quest Property City_AkilaLife07 Auto Const mandatory
Quest Property City_AC_FAB_Quest18 Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory
ReferenceAlias Property Alias_EarlFulton Auto Const mandatory
GlobalVariable Property City_AC_LowHouseDonation Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0115_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  FC01.SetStage(2000) ; #DEBUG_LINE_NO:8
  FC01_BankRobbersEnableMarker.Disable(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0020_Item_00()
  Game.GetPlayer().MoveTo(Alias_DuncanLynch.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0050_Item_00()
  City_AkilaLife06.Start() ; #DEBUG_LINE_NO:28
  City_AkilaLife08.Start() ; #DEBUG_LINE_NO:29
  City_Akila_Jansen.Start() ; #DEBUG_LINE_NO:30
  City_AkilaLife03.Start() ; #DEBUG_LINE_NO:31
  City_AkilaLife07.Start() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0105_Item_00()
  City_AkilaLife02.Start() ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0112_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, City_AC_LowHouseDonation.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0117_Item_00()
  Alias_Player.GetActorRef().RemoveItem(Credits as Form, 10, False, None) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0119_Item_00()
  AkilaCity_Earl_SnuckIn.Start() ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0200_Item_00()
  RAD03.Start() ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0525_Item_00()
  City_AkilaLife04.Start() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0810_Item_00()
  PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_MidtownCost, CityAkilaCityMidtownHouseKey) ; #DEBUG_LINE_NO:126
  FC_AC_Home_MidtownHouse_Misc.Start() ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0820_Item_00()
  PlayerHouseSystem.PurchaseHouse(PlayerHouse_AC_CoreCost, CityAkilaCityCoreHouseKey) ; #DEBUG_LINE_NO:137
  UC_AC_Home_CoreHouse_Misc.Start() ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_1000_Item_00()
  City_AkilaLife01.Start() ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_2015_Item_00()
  AkilaCityLife_2010_Davis.Stop() ; #DEBUG_LINE_NO:157
EndFunction
