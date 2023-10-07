ScriptName Fragments:Quests:QF_City_CY_StartUp01_00222E40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Gustavo Auto Const mandatory
RefCollectionAlias Property Alias_Mercs Auto Const mandatory
Faction Property CityCYStartup01HostileFaction Auto Const mandatory
ReferenceAlias Property Alias_ErickCydoniaMarker Auto Const mandatory
ReferenceAlias Property Alias_Erick Auto Const mandatory
ReferenceAlias Property Alias_Jane Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Ship Auto Const mandatory
Quest Property ErickEliteCrewQuest Auto Const
ReferenceAlias Property Alias_SCMapMarker Auto Const mandatory
Faction Property CityCYStartup01NeutralFaction Auto Const mandatory
Faction Property CityCYStartup01FriendFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property City_CY_Startup01_Convince_Foreknowledge_AV Auto Const mandatory
Faction Property Vendor_City_CY_JanesFaction01 Auto Const mandatory
Faction Property Vendor_City_CY_JanesFaction02 Auto Const mandatory
ReferenceAlias Property Alias_JaneContainer02 Auto Const mandatory
Keyword Property VendorContainerKeyword01 Auto Const mandatory
Perk Property City_CY_Startup01_VendorDiscount Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_Gustavo.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Game.GetPlayer().MoveTo(Alias_Jane.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:23
  Alias_Ship.GetRef().Enable(False) ; #DEBUG_LINE_NO:24
  Alias_SCMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0250_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:43
  spaceshipreference myJaneShip = Alias_Ship.GetShipReference() ; #DEBUG_LINE_NO:45
  myJaneShip.RemoveFromFaction(CityCYStartup01NeutralFaction) ; #DEBUG_LINE_NO:46
  myJaneShip.AddtoFaction(CityCYStartup01FriendFaction) ; #DEBUG_LINE_NO:47
  myJaneShip.SetValue(DockingPermission, 1.0) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0300_Item_00()
  If !Self.IsObjectiveCompleted(200) ; #DEBUG_LINE_NO:56
    Self.SetObjectiveFailed(200, True) ; #DEBUG_LINE_NO:57
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:59
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:60
  Actor ErickRef = Alias_Erick.GetActorRef() ; #DEBUG_LINE_NO:62
  ErickRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0301_Item_00()
  If !Self.GetStageDone(350) ; #DEBUG_LINE_NO:71
    Alias_Gustavo.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:72
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0330_Item_00()
  Alias_Gustavo.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:81
  Self.SetStage(400) ; #DEBUG_LINE_NO:82
  Game.GetPlayer().SetValue(City_CY_Startup01_Convince_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0340_Item_00()
  Alias_Gustavo.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:91
  Self.SetStage(400) ; #DEBUG_LINE_NO:92
EndFunction

Function Fragment_Stage_0350_Item_00()
  If Self.GetStageDone(301) ; #DEBUG_LINE_NO:100
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:101
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveFailed(300, True) ; #DEBUG_LINE_NO:103
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:105
  Actor myPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:108
  Actor myGustavo = Alias_Gustavo.GetActorRef() ; #DEBUG_LINE_NO:109
  myGustavo.RemoveFromFaction(CityCYStartup01NeutralFaction) ; #DEBUG_LINE_NO:110
  myGustavo.RemoveFromFaction(CityCYStartup01FriendFaction) ; #DEBUG_LINE_NO:111
  myGustavo.AddtoFaction(CityCYStartup01HostileFaction) ; #DEBUG_LINE_NO:112
  myGustavo.EvaluatePackage(False) ; #DEBUG_LINE_NO:113
  myGustavo.StartCombat(myPlayer as ObjectReference, False) ; #DEBUG_LINE_NO:114
  Alias_Mercs.RemoveFromFaction(CityCYStartup01NeutralFaction) ; #DEBUG_LINE_NO:116
  Alias_Mercs.RemoveFromFaction(CityCYStartup01FriendFaction) ; #DEBUG_LINE_NO:117
  Alias_Mercs.AddtoFaction(CityCYStartup01HostileFaction) ; #DEBUG_LINE_NO:118
  Alias_Mercs.EvaluateAll() ; #DEBUG_LINE_NO:119
  Alias_Mercs.StartCombatAll(myPlayer as ObjectReference) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0360_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:128
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:129
  If Self.GetStageDone(370) ; #DEBUG_LINE_NO:132
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:133
    Self.SetStage(400) ; #DEBUG_LINE_NO:134
    Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:135
    If Self.GetStageDone(410) ; #DEBUG_LINE_NO:136
      kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef()) ; #DEBUG_LINE_NO:137
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0370_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:147
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:148
  If Self.GetStageDone(360) ; #DEBUG_LINE_NO:151
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:152
    Self.SetStage(400) ; #DEBUG_LINE_NO:153
    Alias_Ship.GetShipRef().SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:154
    If Self.GetStageDone(410) ; #DEBUG_LINE_NO:155
      kmyQuest.RemovePassengerActor(Alias_Erick.GetActorRef()) ; #DEBUG_LINE_NO:156
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  If Self.IsObjectiveDisplayed(300) ; #DEBUG_LINE_NO:166
    Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:167
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:169
EndFunction

Function Fragment_Stage_0410_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:177
  defaultpassengerquestscript kmyQuest = __temp as defaultpassengerquestscript ; #DEBUG_LINE_NO:178
  Actor ErickRef = Alias_Erick.GetActorRef() ; #DEBUG_LINE_NO:181
  ErickRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:182
  If Self.GetStageDone(340) ; #DEBUG_LINE_NO:186
    ErickRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:187
    kmyQuest.AddPassenger(Alias_Erick) ; #DEBUG_LINE_NO:188
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Alias_Erick.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:197
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:198
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_0510_Item_00()
  If !Self.GetStageDone(340) && !Self.GetStageDone(360) ; #DEBUG_LINE_NO:207
    Alias_Erick.GetRef().MoveTo(Alias_ErickCydoniaMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0520_Item_00()
  Alias_Erick.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:217
EndFunction

Function Fragment_Stage_0600_Item_00()
  Game.GetPlayer().AddPerk(City_CY_Startup01_VendorDiscount, False) ; #DEBUG_LINE_NO:225
  Alias_Jane.GetRef().SetLinkedRef(Alias_JaneContainer02.GetRef(), VendorContainerKeyword01, True) ; #DEBUG_LINE_NO:226
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:234
  Alias_SCMapMarker.GetRef().Disable(False) ; #DEBUG_LINE_NO:235
  If Self.GetStageDone(340) ; #DEBUG_LINE_NO:237
    ErickEliteCrewQuest.SetStage(1) ; #DEBUG_LINE_NO:238
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:241
EndFunction
