ScriptName Fragments:Quests:QF_DialogueParadiso_00263194 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PD_PlayerHasHotelRoomDiscount Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialPrice Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property PD_EnhanceSpecialVouchers Auto Const mandatory
GlobalVariable Property PD_VisitationCount Auto Const mandatory
Scene Property DialogueParadiso_PD_IntroScene Auto Const mandatory
Scene Property DialogueParadiso_PD_Keavy_Intro Auto Const mandatory
Scene Property DialogueParadiso_PD_Boardroom_Scene Auto Const mandatory
Quest Property FFParadisoZ01 Auto Const mandatory
Quest Property FFParadisoZ01Misc Auto Const mandatory
ReferenceAlias Property Alias_Emilian Auto Const mandatory
ReferenceAlias Property Alias_Dirk Auto Const mandatory
Quest Property FFparadisoZ02 Auto Const mandatory
Quest Property FFParadisoZ02Misc Auto Const mandatory
ReferenceAlias Property Alias_Kumar Auto Const mandatory
Quest Property FFParadisoZ03Misc Auto Const mandatory
Quest Property FFParadisoZ03 Auto Const mandatory
Quest Property FFParadisoZ04Misc Auto Const mandatory
Quest Property FFParadisoZ04 Auto Const mandatory
ReferenceAlias Property Alias_ChiefJiro Auto Const mandatory
Quest Property MS06 Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
Quest Property TestGoToSpaceQuest Auto Const mandatory
Perk Property Security Auto Const mandatory
ReferenceAlias Property Alias_BoardRoomDoor Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToDisableExt Auto Const mandatory
RefCollectionAlias Property Alias_NPCsToEnableExt Auto Const mandatory
Faction Property ECSConstantFaction Auto Const mandatory
Faction Property ECSConstantSecurityFaction Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Daily Auto Const mandatory
GlobalVariable Property PD_Hotel_RoomCost_Weekly Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
Faction Property CrimeFactionECSConstant Auto Const mandatory
RefCollectionAlias Property Alias_NamedECSNPCs Auto Const mandatory
ReferenceAlias Property Alias_ECSTransplantSlate Auto Const mandatory
ReferenceAlias Property Alias_Jacquotte Auto Const mandatory
Quest Property DialogueECSConstant Auto Const mandatory
ReferenceAlias Property Alias_Daisuke Auto Const mandatory
Faction Property Vendor_ECS_DaisukeFaction Auto Const mandatory
Faction Property Vendor_PD_GeneralGoodsFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0011_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  myPlayer.MoveTo(Alias_Emilian.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:9
  myPlayer.AddPerk(Security, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0012_Item_00()
  Game.GetPlayer().MoveTo(Alias_Dirk.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0013_Item_00()
  Game.GetPlayer().MoveTo(Alias_Kumar.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0014_Item_00()
  Game.GetPlayer().MoveTo(Alias_ChiefJiro.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
  TestGoToSpaceQuest.SetStage(20) ; #DEBUG_LINE_NO:35
  MS06.SetStage(1710) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0025_Item_00()
  DialogueParadiso_PD_IntroScene.Start() ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0050_Item_00()
  PD_VisitationCount.SetValue(2.0) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0101_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, PD_EnhanceSpecialPrice.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:62
  PD_EnhanceSpecialVouchers.SetValue(2.0) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0300_Item_00()
  DialogueParadiso_PD_Keavy_Intro.Start() ; #DEBUG_LINE_NO:71
  If MS06.IsRunning() ; #DEBUG_LINE_NO:74
    MS06.SetStage(690) ; #DEBUG_LINE_NO:75
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0305_Item_00()
  If MS06.GetStageDone(690) && !MS06.GetStageDone(691) ; #DEBUG_LINE_NO:84
    MS06.SetStage(691) ; #DEBUG_LINE_NO:85
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference myDoor = Alias_BoardRoomDoor.GetRef() ; #DEBUG_LINE_NO:88
  myDoor.SetOpen(True) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0401_Item_00()
  PD_PlayerHasHotelRoomDiscount.SetValue(1.0) ; #DEBUG_LINE_NO:97
  PD_Hotel_RoomCost_Daily.SetValue(PD_Hotel_RoomCost_Daily.GetValue() * 0.800000012) ; #DEBUG_LINE_NO:100
  PD_Hotel_RoomCost_Weekly.SetValue(PD_Hotel_RoomCost_Weekly.GetValue() * 0.800000012) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0600_Item_00()
  DialogueParadiso_PD_Boardroom_Scene.Start() ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_1101_Item_00()
  If !FFParadisoZ01.IsRunning() && !FFParadisoZ01.IsCompleted() ; #DEBUG_LINE_NO:117
    FFParadisoZ01Misc.Start() ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1103_Item_00()
  Alias_Jacquotte.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_1110_Item_00()
  FFParadisoZ01.Start() ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_1200_Item_00()
  If !FFparadisoZ02.IsRunning() && !FFparadisoZ02.IsCompleted() ; #DEBUG_LINE_NO:143
    FFParadisoZ02Misc.Start() ; #DEBUG_LINE_NO:144
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1210_Item_00()
  FFParadisoZ02Misc.Start() ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_1301_Item_00()
  If !FFParadisoZ03.IsRunning() && !FFParadisoZ03.IsCompleted() ; #DEBUG_LINE_NO:161
    FFParadisoZ03Misc.Start() ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1310_Item_00()
  FFParadisoZ03.Start() ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_1320_Item_00()
  FFParadisoZ03.Start() ; #DEBUG_LINE_NO:179
  FFParadisoZ03.SetStage(200) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_1402_Item_00()
  If !FFParadisoZ04.IsRunning() && !FFParadisoZ04.IsCompleted() ; #DEBUG_LINE_NO:188
    FFParadisoZ04Misc.Start() ; #DEBUG_LINE_NO:189
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1410_Item_00()
  FFParadisoZ04.Start() ; #DEBUG_LINE_NO:198
EndFunction

Function Fragment_Stage_2010_Item_00()
  DialogueECSConstant.SetStage(1000) ; #DEBUG_LINE_NO:208
  Alias_NPCsToDisableExt.DisableAll(False) ; #DEBUG_LINE_NO:212
  Alias_NPCsToEnableExt.EnableAll(False) ; #DEBUG_LINE_NO:213
  Alias_ECSTransplantSlate.GetRef().Enable(False) ; #DEBUG_LINE_NO:214
  Alias_NPCsToEnableExt.AddRefCollection(Alias_NamedECSNPCs) ; #DEBUG_LINE_NO:218
  Actor myDaisuke = Alias_Daisuke.GetActorRef() ; #DEBUG_LINE_NO:222
  Alias_NPCsToEnableExt.RemoveFromFaction(ECSConstantSecurityFaction) ; #DEBUG_LINE_NO:223
  Alias_NPCsToEnableExt.RemoveFromFaction(CrimeFactionECSConstant) ; #DEBUG_LINE_NO:224
  myDaisuke.RemoveFromFaction(Vendor_ECS_DaisukeFaction) ; #DEBUG_LINE_NO:225
  Alias_NPCsToEnableExt.AddToFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:226
  Alias_NPCsToEnableExt.AddToFaction(ParadisoFaction) ; #DEBUG_LINE_NO:227
  myDaisuke.AddToFaction(Vendor_PD_GeneralGoodsFaction) ; #DEBUG_LINE_NO:228
  Int I = 0 ; #DEBUG_LINE_NO:232
  Int iCount = Alias_NPCsToEnableExt.GetCount() ; #DEBUG_LINE_NO:233
  While I < iCount ; #DEBUG_LINE_NO:234
    Actor myNPCToEnable = Alias_NPCsToEnableExt.GetAt(I) as Actor ; #DEBUG_LINE_NO:235
    myNPCToEnable.SetCrimeFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:236
    I += 1 ; #DEBUG_LINE_NO:237
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
