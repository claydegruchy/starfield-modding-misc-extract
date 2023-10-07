ScriptName Fragments:Quests:QF_SE_Player_KT_Trait_Wanted_000E9E2A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property Attack01_100a_DefenderHailStart Auto Const mandatory
RefCollectionAlias Property Alias_DefendersRC Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Quest Property TraitWanted Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip01 Auto Const mandatory
ReferenceAlias Property Alias_SpacerShip02 Auto Const mandatory
ReferenceAlias Property Alias_SpacerShip03 Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip02 Auto Const mandatory
ReferenceAlias Property Alias_AttackerShip03 Auto Const mandatory
GlobalVariable Property Trait_Credit_ValueIncrease Auto Const mandatory
GlobalVariable Property Trait_Credit_WantedMedium Auto Const mandatory
GlobalVariable Property Trait_Wanted_SE_CooldownDays Auto Const mandatory
ActorValue Property Trait_Wanted_SE_Cooldown_AVIF Auto Const mandatory
GlobalVariable Property Trait_Wanted_KillGlobal Auto Const mandatory
GlobalVariable Property SE_Player_ChanceTraitWantedGlobal Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  TraitWanted.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_DefendersRC.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:15
  Alias_DefendersRC.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:16
  Alias_DefendersRC.StartCombatAll(Alias_PlayerShip.GetShipRef() as ObjectReference) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0025_Item_00()
  Utility.Wait(7.0) ; #DEBUG_LINE_NO:25
  spaceshipreference pDefender01 = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:26
  spaceshipreference pDefender02 = Alias_SpacerShip02.GetShipRef() ; #DEBUG_LINE_NO:27
  spaceshipreference pDefender03 = Alias_SpacerShip03.GetShipRef() ; #DEBUG_LINE_NO:28
  spaceshipreference pAttacker = Alias_AttackerShip01.GetShipRef() ; #DEBUG_LINE_NO:30
  pDefender01.MoveNear(pAttacker as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:32
  pDefender02.MoveNear(pAttacker as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:33
  pDefender03.MoveNear(pAttacker as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:34
  pDefender01.EnableWithGravJump() ; #DEBUG_LINE_NO:35
  pDefender02.EnableWithGravJump() ; #DEBUG_LINE_NO:36
  pDefender03.EnableWithGravJump() ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0030_Item_00()
  spaceshipreference pAttacker01 = Alias_AttackerShip01.GetShipRef() ; #DEBUG_LINE_NO:45
  spaceshipreference pAttacker02 = Alias_AttackerShip02.GetShipRef() ; #DEBUG_LINE_NO:46
  spaceshipreference pAttacker03 = Alias_AttackerShip03.GetShipRef() ; #DEBUG_LINE_NO:47
  spaceshipreference playerShip = Alias_PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:48
  pAttacker01.MoveNear(playerShip as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:49
  pAttacker02.MoveNear(playerShip as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:50
  pAttacker03.MoveNear(playerShip as ObjectReference, 0, 0, 0) ; #DEBUG_LINE_NO:51
  pAttacker01.EnableWithGravJump() ; #DEBUG_LINE_NO:52
  pAttacker02.EnableWithGravJump() ; #DEBUG_LINE_NO:53
  pAttacker03.EnableWithGravJump() ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0050_Item_00()
  Attack01_100a_DefenderHailStart.Start() ; #DEBUG_LINE_NO:62
  Int ChanceValue = Trait_Wanted_KillGlobal.GetValueInt() ; #DEBUG_LINE_NO:64
  Trait_Wanted_KillGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:65
  Int BountyIncrease = Trait_Credit_ValueIncrease.GetValueInt() ; #DEBUG_LINE_NO:67
  Int CurrentBountyValue = Trait_Credit_WantedMedium.GetValueInt() + BountyIncrease ; #DEBUG_LINE_NO:68
  Trait_Credit_WantedMedium.SetValue(CurrentBountyValue as Float) ; #DEBUG_LINE_NO:70
  Float expiry = Utility.ExpiryDay(Trait_Wanted_SE_CooldownDays.GetValue(), None, -1.0, -1.0) ; #DEBUG_LINE_NO:72
  Game.GetPlayer().SetValue(Trait_Wanted_SE_Cooldown_AVIF, expiry) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0050_Item_01()
  Int ChanceValue = SE_Player_ChanceTraitWantedGlobal.GetValueInt() ; #DEBUG_LINE_NO:81
  SE_Player_ChanceTraitWantedGlobal.SetValue((ChanceValue + 1) as Float) ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0200_Item_00()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:90
  ObjectReference[] ShipsRef = Alias_DefendersRC.GetArray() ; #DEBUG_LINE_NO:92
  Int I = 0 ; #DEBUG_LINE_NO:94
  While I < ShipsRef.Length ; #DEBUG_LINE_NO:95
    (ShipsRef[I] as spaceshipreference).DisableWithGravJump() ; #DEBUG_LINE_NO:96
    I += 1 ; #DEBUG_LINE_NO:97
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:106
EndFunction
