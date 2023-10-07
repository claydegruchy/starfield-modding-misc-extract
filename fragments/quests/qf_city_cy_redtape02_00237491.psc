ScriptName Fragments:Quests:QF_City_CY_RedTape02_00237491 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property City_CY_RedTape03 Auto Const mandatory
MiscObject Property City_CY_RedTape02_Package Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
Book Property City_CY_RedTape02_HurstNote Auto Const mandatory
ReferenceAlias Property Alias_Peter Auto Const mandatory
Key Property City_CY_RedTape02_PeterPassword Auto Const mandatory
ReferenceAlias Property Alias_PirateShip Auto Const mandatory
Faction Property CityCYRedTape02PirateNeutralFaction Auto Const mandatory
Faction Property PirateFaction Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property CydoniaShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_SpaceMarker Auto Const mandatory
RefCollectionAlias Property Alias_PirateShips Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetNeutralFaction Auto Const mandatory
Faction Property CrimsonFleetFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property CityCYRedTape02CrimsonFleetFriendFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
GlobalVariable Property City_CY_RedTape02HurstBribe Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Perk Property FactionCrimsonFleetPerk Auto Const mandatory
Perk Property BackgroundBountyHunter Auto Const mandatory
Perk Property BackgroundSpaceCowboy Auto Const mandatory
Perk Property BackgroundIndustrialist Auto Const mandatory
Perk Property Chemistry Auto Const mandatory
Quest Property City_CY_RedTape02_Blackmail Auto Const mandatory
ActorValue Property City_CY_RedTape02_ForeknowledgeAV Auto Const mandatory
Scene Property City_CY_RedTape02_0500_InitiateHailingScene Auto Const mandatory
Perk Property StarshipEngineering Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  myPlayer.MoveTo(Alias_Peter.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
  myPlayer.AddPerk(BackgroundIndustrialist, False) ; #DEBUG_LINE_NO:9
  myPlayer.AddPerk(FactionCrimsonFleetPerk, False) ; #DEBUG_LINE_NO:10
  myPlayer.AddPerk(BackgroundBountyHunter, False) ; #DEBUG_LINE_NO:11
  myPlayer.AddPerk(BackgroundSpaceCowboy, False) ; #DEBUG_LINE_NO:12
  myPlayer.AddPerk(StarshipEngineering, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0002_Item_00()
  Alias_PirateShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:22
  Frontier_ModularREF.MoveTo(CydoniaShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:25
  Frontier_ModularREF.SetLinkedRef(CydoniaShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:26
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:27
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:28
  Frontier_ModularREF.SetLinkedRef(None, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:31
  Frontier_ModularREF.MoveTo(Alias_SpaceMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:32
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:33
  Game.GetPlayer().MoveTo(Frontier_ModularREF, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:34
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:40
  Game.FadeOutGame(False, True, 0.0, 5.0, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:52
  Self.SetStage(400) ; #DEBUG_LINE_NO:53
  Self.SetStage(500) ; #DEBUG_LINE_NO:54
  Self.SetStage(600) ; #DEBUG_LINE_NO:55
  Self.SetStage(2) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:64
  Self.SetActive(True) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:73
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:82
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:83
  Alias_PirateShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:86
  Alias_MapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:98
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:101
  City_CY_RedTape02_0500_InitiateHailingScene.Start() ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0550_Item_00()
  spaceshipreference myHurstShip = Alias_PirateShip.GetShipReference() ; #DEBUG_LINE_NO:122
  myHurstShip.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:123
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction) ; #DEBUG_LINE_NO:124
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetFriendFaction) ; #DEBUG_LINE_NO:125
  myHurstShip.AddToFaction(CrimsonFleetFaction) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:129
  If !Self.IsObjectiveCompleted(610) && Self.IsObjectiveDisplayed(610) ; #DEBUG_LINE_NO:130
    Self.SetObjectiveFailed(500, True) ; #DEBUG_LINE_NO:131
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(620) ; #DEBUG_LINE_NO:133
    Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(650) ; #DEBUG_LINE_NO:137
    Self.SetObjectiveDisplayed(550, True, False) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0600_Item_00()
  spaceshipreference myHurstShip = Alias_PirateShip.GetShipReference() ; #DEBUG_LINE_NO:147
  myHurstShip.RemoveFromFaction(CityCYRedTape02CrimsonFleetNeutralFaction) ; #DEBUG_LINE_NO:148
  myHurstShip.AddToFaction(CityCYRedTape02CrimsonFleetFriendFaction) ; #DEBUG_LINE_NO:149
  myHurstShip.SetValue(DockingPermission, 1.0) ; #DEBUG_LINE_NO:150
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:152
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:153
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:154
EndFunction

Function Fragment_Stage_0610_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:162
  Self.SetObjectiveDisplayed(610, True, False) ; #DEBUG_LINE_NO:163
EndFunction

Function Fragment_Stage_0615_Item_00()
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:171
  If !Self.GetStageDone(620) ; #DEBUG_LINE_NO:172
    Self.SetObjectiveDisplayed(620, True, False) ; #DEBUG_LINE_NO:173
    Self.SetStage(650) ; #DEBUG_LINE_NO:174
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0616_Item_00()
  Self.SetObjectiveCompleted(610, True) ; #DEBUG_LINE_NO:183
EndFunction

Function Fragment_Stage_0620_Item_00()
  If !Self.GetStageDone(615) ; #DEBUG_LINE_NO:191
    Self.SetObjectiveDisplayed(620, True, False) ; #DEBUG_LINE_NO:192
    Self.SetStage(650) ; #DEBUG_LINE_NO:193
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0630_Item_00()
  If Self.GetStageDone(640) ; #DEBUG_LINE_NO:202
    Self.SetStage(645) ; #DEBUG_LINE_NO:203
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0640_Item_00()
  If Self.GetStageDone(630) ; #DEBUG_LINE_NO:212
    Self.SetStage(645) ; #DEBUG_LINE_NO:213
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0645_Item_00()
  Self.SetObjectiveCompleted(620, True) ; #DEBUG_LINE_NO:222
EndFunction

Function Fragment_Stage_0650_Item_00()
  Self.SetObjectiveDisplayed(550, False, False) ; #DEBUG_LINE_NO:230
  Self.SetObjectiveDisplayed(650, True, False) ; #DEBUG_LINE_NO:231
  Self.SetStage(700) ; #DEBUG_LINE_NO:232
EndFunction

Function Fragment_Stage_0660_Item_00()
  If !Self.IsObjectiveCompleted(500) && Self.IsObjectiveDisplayed(500) ; #DEBUG_LINE_NO:240
    Self.SetObjectiveFailed(500, True) ; #DEBUG_LINE_NO:241
    Self.SetStage(700) ; #DEBUG_LINE_NO:242
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(550) && Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:246
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:247
    Self.SetStage(700) ; #DEBUG_LINE_NO:248
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(650) && Self.IsObjectiveDisplayed(650) ; #DEBUG_LINE_NO:252
    Self.SetObjectiveCompleted(650, True) ; #DEBUG_LINE_NO:253
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(620) && Self.IsObjectiveDisplayed(620) ; #DEBUG_LINE_NO:256
    Self.SetObjectiveFailed(620, True) ; #DEBUG_LINE_NO:257
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  If !Self.IsObjectiveCompleted(550) && Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:266
    Self.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:267
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(600) && Self.IsObjectiveDisplayed(600) ; #DEBUG_LINE_NO:269
    Self.SetObjectiveFailed(600, True) ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(610) && Self.IsObjectiveDisplayed(610) ; #DEBUG_LINE_NO:272
    Self.SetObjectiveFailed(610, True) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:275
EndFunction

Function Fragment_Stage_0703_Item_00()
  If !Self.IsObjectiveCompleted(620) && Self.IsObjectiveDisplayed(620) ; #DEBUG_LINE_NO:286
    Self.SetObjectiveFailed(620, True) ; #DEBUG_LINE_NO:287
  EndIf ; #DEBUG_LINE_NO:
  If !Self.IsObjectiveCompleted(650) && Self.IsObjectiveDisplayed(650) ; #DEBUG_LINE_NO:291
    Self.SetObjectiveFailed(650, True) ; #DEBUG_LINE_NO:292
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0704_Item_00()
  If Self.IsObjectiveDisplayed(550) ; #DEBUG_LINE_NO:301
    Self.SetObjectiveFailed(550, True) ; #DEBUG_LINE_NO:302
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(650) ; #DEBUG_LINE_NO:304
    Self.SetObjectiveFailed(650, True) ; #DEBUG_LINE_NO:305
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0720_Item_00()
  Game.GetPlayer().RemoveItem(City_CY_RedTape02_HurstNote as Form, 1, False, None) ; #DEBUG_LINE_NO:314
  Self.SetStage(900) ; #DEBUG_LINE_NO:315
  City_CY_RedTape02_Blackmail.SetStage(900) ; #DEBUG_LINE_NO:316
EndFunction

Function Fragment_Stage_0800_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, City_CY_RedTape02HurstBribe.GetValue() as Int, False, None) ; #DEBUG_LINE_NO:324
  Self.SetStage(900) ; #DEBUG_LINE_NO:325
EndFunction

Function Fragment_Stage_0900_Item_00()
  Game.GetPlayer().AddAliasedItem(City_CY_RedTape02_Package as Form, Alias_Package as Alias, 1, False) ; #DEBUG_LINE_NO:333
  Alias_MapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:336
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:338
  Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:339
EndFunction

Function Fragment_Stage_10000_Item_00()
  City_CY_RedTape03.Start() ; #DEBUG_LINE_NO:347
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:355
  myPlayer.RemoveItem(City_CY_RedTape02_Package as Form, 1, False, None) ; #DEBUG_LINE_NO:356
  myPlayer.AddItem(City_CY_RedTape02_PeterPassword as Form, 1, False) ; #DEBUG_LINE_NO:357
  Self.SetObjectiveCompleted(900, True) ; #DEBUG_LINE_NO:358
  Self.SetObjectiveDisplayed(1000, True, False) ; #DEBUG_LINE_NO:359
EndFunction

Function Fragment_Stage_2000_Item_00()
  Game.GetPlayer().SetValue(City_CY_RedTape02_ForeknowledgeAV, 1.0) ; #DEBUG_LINE_NO:367
  Self.SetObjectiveCompleted(1000, True) ; #DEBUG_LINE_NO:368
  Self.Stop() ; #DEBUG_LINE_NO:369
EndFunction
