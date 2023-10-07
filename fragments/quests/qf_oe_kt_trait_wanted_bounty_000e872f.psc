ScriptName Fragments:Quests:QF_OE_KT_Trait_Wanted_Bounty_000E872F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
ReferenceAlias Property Alias_NPC02 Auto Const mandatory
ReferenceAlias Property Alias_NPC03 Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
ReferenceAlias Property Alias_NPC04 Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Book Property Trait_Wanted_DataSlate01 Auto Const mandatory
ReferenceAlias Property Alias_BountyNote01 Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
Faction Property PlayerAllyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Float Property TimeDelayForShipArrival Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_ShipB Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group02 Auto Const mandatory
ReferenceAlias Property Alias_NPC05 Auto Const mandatory
ReferenceAlias Property Alias_NPC06 Auto Const mandatory
ReferenceAlias Property Alias_NPC07 Auto Const mandatory
Float Property ShipSpawnHeightFloat Auto Const mandatory
Scene Property Trait_NPC_BountyHunterEncounter Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
spaceshipbase Property LvlShip_Ecliptic_Combat Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
LocationAlias Property Alias_ShipB_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipB_InteriorMarker00 Auto Const mandatory
spaceshipbase Property LvlShip_Spacer_Combat Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
LocationAlias Property Alias_ShipB_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_NPC08 Auto Const mandatory
ReferenceAlias Property Alias_NPC09 Auto Const mandatory
bescript Property BE_Generic Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker02 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker03 Auto Const mandatory
ReferenceAlias Property Alias_ShipB_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory
GlobalVariable Property OE_Trait_Wanted_BountyHunters_Cooldown Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias[] Property enemyShipRef Auto Const mandatory
bescript[] Property BE_GenericQuests Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
GlobalVariable Property OE_TraitWantedRandomPercent Auto Const mandatory
Int Property EncounterOdds Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Trait_NPC_BountyHunterEncounter.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0004_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:15
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:16
  ObjectReference ExtraNPC = Alias_NPC04.GetRef() ; #DEBUG_LINE_NO:19
  ObjectReference LandingMarker = Alias_ShipA_LandingDeckMarker03.GetRef() ; #DEBUG_LINE_NO:20
  If LandingMarker != None ; #DEBUG_LINE_NO:21
    ExtraNPC.MoveTo(LandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:22
  Else ; #DEBUG_LINE_NO:
    ExtraNPC.MoveTo(Alias_NPC03.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
  Alias_NPC_Group01.AddRef(ExtraNPC) ; #DEBUG_LINE_NO:26
  ExtraNPC.EnableNoWait(False) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0004_Item_01()
  Alias_NPC04.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0006_Item_00()
  Int I = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:43
  If I == 1 ; #DEBUG_LINE_NO:45
    Self.SetStage(7) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0007_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:55
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:56
  If Alias_Marker_ShipLandingB.GetRef() != None ; #DEBUG_LINE_NO:59
    kmyQuest.LandShip(1) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_ShipB.RefillDependentAliases() ; #DEBUG_LINE_NO:69
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:77
  Alias_PilotSeat.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:86
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:87
  kmyQuest.LandShip(0) ; #DEBUG_LINE_NO:90
  OE_TraitWantedRandomPercent.SetValue(EncounterOdds as Float) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0010_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:99
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:100
  kmyQuest.SetCooldown() ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0015_Item_00()
  ObjectReference NPC01 = Alias_NPC01.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:119
  ObjectReference NPC02 = Alias_NPC02.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:120
  ObjectReference NPC03 = Alias_NPC03.GetActorRef() as ObjectReference ; #DEBUG_LINE_NO:121
  NPC01.MoveTo(Alias_ShipA_LandingDeckMarker00.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:122
  NPC02.MoveTo(Alias_ShipA_LandingDeckMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:123
  NPC03.MoveTo(Alias_ShipA_LandingDeckMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:124
  NPC01.EnableNoWait(False) ; #DEBUG_LINE_NO:126
  NPC02.EnableNoWait(False) ; #DEBUG_LINE_NO:127
  NPC03.EnableNoWait(False) ; #DEBUG_LINE_NO:128
EndFunction

Function Fragment_Stage_0015_Item_01()
  Self.SetStage(4) ; #DEBUG_LINE_NO:136
EndFunction

Function Fragment_Stage_0015_Item_02()
  Self.SetStage(6) ; #DEBUG_LINE_NO:144
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_NPC_Group01.AddRef(Alias_NPC01.GetRef()) ; #DEBUG_LINE_NO:152
  Alias_NPC_Group01.AddRef(Alias_NPC02.GetRef()) ; #DEBUG_LINE_NO:153
  Alias_NPC_Group01.AddRef(Alias_NPC03.GetRef()) ; #DEBUG_LINE_NO:154
  If Self.GetStageDone(4) ; #DEBUG_LINE_NO:156
    Alias_NPC_Group01.AddRef(Alias_NPC04.GetRef()) ; #DEBUG_LINE_NO:157
  EndIf ; #DEBUG_LINE_NO:
  Alias_NPC01.GetRef().AddAliasedItem(Trait_Wanted_DataSlate01 as Form, Alias_BountyNote01 as Alias, 1, True) ; #DEBUG_LINE_NO:160
  Alias_NPC_Group01.RemovefromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:162
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:163
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:164
  Alias_NPC_Group01.SetValue(Game.GetAggressionAV(), 1.0) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:173
  Self.SetStage(150) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0030_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:182
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:183
  Self.SetStage(150) ; #DEBUG_LINE_NO:184
EndFunction

Function Fragment_Stage_0035_Item_00()
  Alias_NPC_Group02.RemovefromFaction(PlayerAllyFaction) ; #DEBUG_LINE_NO:192
  Alias_NPC_Group02.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:193
  Alias_NPC_Group02.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:194
EndFunction

Function Fragment_Stage_0040_Item_00()
  ObjectReference[] landingRamps = Alias_ShipB.GetShipRef().GetLandingRamps() ; #DEBUG_LINE_NO:202
  Int I = 0 ; #DEBUG_LINE_NO:203
  While I < landingRamps.Length ; #DEBUG_LINE_NO:204
    landingRamps[I].SetOpen(True) ; #DEBUG_LINE_NO:205
    I += 1 ; #DEBUG_LINE_NO:206
  EndWhile ; #DEBUG_LINE_NO:
  ObjectReference NPC05 = Alias_NPC05.GetRef() ; #DEBUG_LINE_NO:209
  ObjectReference NPC06 = Alias_NPC06.GetRef() ; #DEBUG_LINE_NO:210
  ObjectReference NPC07 = Alias_NPC07.GetRef() ; #DEBUG_LINE_NO:211
  ObjectReference NPC08 = Alias_NPC08.GetRef() ; #DEBUG_LINE_NO:212
  ObjectReference NPC09 = Alias_NPC09.GetRef() ; #DEBUG_LINE_NO:213
  NPC05.MoveTo(Alias_ShipB_LandingDeckMarker00.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:215
  NPC06.MoveTo(Alias_ShipB_LandingDeckMarker01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:216
  NPC07.MoveTo(Alias_ShipB_LandingDeckMarker02.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:217
  NPC08.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:218
  NPC09.MoveTo(Alias_ShipB_LandingDeckMarker03.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:219
  NPC05.EnableNoWait(False) ; #DEBUG_LINE_NO:221
  NPC06.EnableNoWait(False) ; #DEBUG_LINE_NO:222
  NPC07.EnableNoWait(False) ; #DEBUG_LINE_NO:223
  NPC08.EnableNoWait(False) ; #DEBUG_LINE_NO:224
  NPC09.EnableNoWait(False) ; #DEBUG_LINE_NO:225
  Alias_NPC_Group02.StartCombatAll(Alias_NPC01.GetRef()) ; #DEBUG_LINE_NO:227
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:235
EndFunction

Function Fragment_Stage_0079_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:243
  While I < BE_GenericQuests.Length ; #DEBUG_LINE_NO:244
    If BE_GenericQuests[I].IsRunning() && enemyShipRef[I].GetShipRef() == Alias_ShipB.GetShipRef() ; #DEBUG_LINE_NO:245
      BE_GenericQuests[I].SetEnemyShipLandingRampsOpenState(True) ; #DEBUG_LINE_NO:246
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:248
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0080_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:257
  While I < BE_GenericQuests.Length ; #DEBUG_LINE_NO:258
    If BE_GenericQuests[I].IsRunning() && enemyShipRef[I].GetShipRef() == Alias_ShipA.GetShipRef() ; #DEBUG_LINE_NO:259
      BE_GenericQuests[I].SetEnemyShipLandingRampsOpenState(True) ; #DEBUG_LINE_NO:260
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:262
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  TraitWanted.Start() ; #DEBUG_LINE_NO:271
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_NPC01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:279
  TraitWanted.SetStage(10) ; #DEBUG_LINE_NO:280
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt() ; #DEBUG_LINE_NO:281
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:282
  If !Self.GetStageDone(30) ; #DEBUG_LINE_NO:284
    Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt() ; #DEBUG_LINE_NO:285
    Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease ; #DEBUG_LINE_NO:286
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float) ; #DEBUG_LINE_NO:287
  EndIf ; #DEBUG_LINE_NO:
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:290
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry) ; #DEBUG_LINE_NO:291
  OE_TraitWantedRandomPercent.SetValue(EncounterOdds as Float) ; #DEBUG_LINE_NO:292
EndFunction

Function Fragment_Stage_0150_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt() ; #DEBUG_LINE_NO:300
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:301
EndFunction

Function Fragment_Stage_9999_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:309
  oescript kmyQuest = __temp as oescript ; #DEBUG_LINE_NO:310
  Self.Stop() ; #DEBUG_LINE_NO:313
EndFunction
