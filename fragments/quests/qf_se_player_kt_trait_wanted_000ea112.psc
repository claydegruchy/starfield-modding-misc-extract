ScriptName Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000EA112 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Patrollers Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory
spaceshipbase Property BountyHunterShip Auto Const mandatory
spaceshipbase Property BountyHunterShipBoss Auto Const mandatory
ReferenceAlias Property Alias_BountyNote01 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip01 Auto Const mandatory
Book Property Trait_Wanted_DataSlate01 Auto Const mandatory
Scene Property SE_Player_Trait_Wanted_HailCombat Auto Const mandatory
Scene Property SE_Player_Trait_Wanted_HailStart Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip02 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip03 Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip04 Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionSmall Auto Const mandatory
GlobalVariable Property Trait_Credit_ExtortionMedium Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
ReferenceAlias Property Alias_PatrolShip05 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
spaceshipbase Property BountyHunterUnaggressive Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory
Int Property OddsStart Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitWanted.Start() ; #DEBUG_LINE_NO:7
  Alias_PatrolShip04.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:8
  Alias_PatrolShip05.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0000_Item_01()
  SE_Player_ChanceTraitWantedGlobal.SetValue(OddsStart as Float) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0005_Item_00()
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:25
  SE_Player_Trait_Wanted_HailStart.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_PatrolShip01.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:34
  Alias_PatrolShip02.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0010_Item_01()
  Alias_PatrolShip03.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0010_Item_02()
  Alias_PatrolShip04.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:51
  Alias_PatrolShip05.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_Patrollers.RemovefromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:60
  Alias_Patrollers.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:61
  Alias_Patrollers.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:62
  Alias_Patrollers.StartCombatAll(Alias_Player.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:63
  Alias_PatrolShip01.GetShipRef().AddAliasedItem(Trait_Wanted_DataSlate01 as Form, Alias_BountyNote01 as Alias, 1, True) ; #DEBUG_LINE_NO:65
  SE_Player_Trait_Wanted_HailStart.Stop() ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0025_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionSmall.GetValueInt(), False, None) ; #DEBUG_LINE_NO:74
  Self.SetStage(100) ; #DEBUG_LINE_NO:75
EndFunction

Function Fragment_Stage_0050_Item_00()
  Game.GetPlayer().RemoveItem(Credits as Form, Trait_Credit_ExtortionMedium.GetValueInt(), False, None) ; #DEBUG_LINE_NO:83
  Self.SetStage(100) ; #DEBUG_LINE_NO:84
EndFunction

Function Fragment_Stage_0090_Item_00()
  SE_Player_Trait_Wanted_HailStart.Stop() ; #DEBUG_LINE_NO:92
  TraitWanted.SetStage(20) ; #DEBUG_LINE_NO:93
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:95
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:96
  ObjectReference[] ShipRef = Alias_Patrollers.GetArray() ; #DEBUG_LINE_NO:98
  Int I = 0 ; #DEBUG_LINE_NO:99
  While I < ShipRef.Length ; #DEBUG_LINE_NO:100
    (ShipRef[I] as spaceshipreference).DisableWithGravJump() ; #DEBUG_LINE_NO:101
    I += 1 ; #DEBUG_LINE_NO:102
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  TraitWanted.SetStage(10) ; #DEBUG_LINE_NO:111
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt() ; #DEBUG_LINE_NO:112
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:113
  If !Self.GetStageDone(80) ; #DEBUG_LINE_NO:115
    Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt() ; #DEBUG_LINE_NO:116
    Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease ; #DEBUG_LINE_NO:117
    Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float) ; #DEBUG_LINE_NO:118
  EndIf ; #DEBUG_LINE_NO:
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:121
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry) ; #DEBUG_LINE_NO:122
EndFunction

Function Fragment_Stage_0100_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt() ; #DEBUG_LINE_NO:130
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:131
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:139
EndFunction
