ScriptName Fragments:Quests:QF_BE_KT02_0002927E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
GlobalVariable Property BE_KT01_InstanceID Auto Const mandatory
Scene Property BE_KT02_001_SceneStart Auto Const mandatory
LeveledItem Property LL_Drink_Any Auto Const mandatory
wwiseevent Property PartyMusicTrack Auto Const mandatory
MusicType Property MusicSilencer Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
ReferenceAlias Property Alias_CrewPartygoer Auto Const mandatory
ReferenceAlias Property Alias_Boatswain Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Announcer Auto Const mandatory
Explosion Property BE_KT02_ExplosionHavok Auto Const mandatory
ReferenceAlias Property Alias_EnableMarker Auto Const mandatory
Quest Property SE_KT02 Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
wwiseevent Property ShipPowerOn Auto Const mandatory
ReferenceAlias Property Alias_CaptainFurniture Auto Const mandatory
Faction Property BEKT02_CaptainFaction Auto Const mandatory
wwiseevent Property ZeroGOff Auto Const mandatory
ReferenceAlias Property Alias_BoatswainFurniture Auto Const mandatory
Faction Property BEKT02_BoatswainFaction Auto Const mandatory
ReferenceAlias Property Alias_GravitySwitch Auto Const mandatory
ReferenceAlias Property Alias_CrewPartygoer01 Auto Const mandatory
ReferenceAlias Property Alias_Pilot Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property LocTypeZeroGAllowClothes Auto Const mandatory
ReferenceAlias Property Alias_MiniBot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_MiniBot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0006_Item_00()
  BE_KT02_001_SceneStart.Stop() ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0007_Item_00()
  Alias_MiniBot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0008_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:31
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:32
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:35
  Alias_MiniBot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0009_Item_00()
  Alias_Captain.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_CaptainFurniture.GetRef().SetFactionOwner(BEKT02_CaptainFaction, False) ; #DEBUG_LINE_NO:52
  Alias_BoatswainFurniture.GetRef().SetFactionOwner(BEKT02_BoatswainFaction, False) ; #DEBUG_LINE_NO:53
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:55
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:57
  Alias_EnemyShipInteriorLocation.GetLocation().AddKeyword(LocTypeZeroGAllowClothes) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0015_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:67
  enemyShipRef.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_AllCrew.AddRef(Alias_Captain.GetRef()) ; #DEBUG_LINE_NO:81
  Alias_AllCrew.AddRef(Alias_Boatswain.GetRef()) ; #DEBUG_LINE_NO:82
  Alias_AllCrew.AddRef(Alias_CrewPartygoer01.GetRef()) ; #DEBUG_LINE_NO:83
  Alias_AllCrew.AddRef(Alias_CrewPartygoer.GetRef()) ; #DEBUG_LINE_NO:84
  Alias_AllCrew.AddRef(Alias_Pilot.GetRef()) ; #DEBUG_LINE_NO:85
  SE_KT02.SetStage(30) ; #DEBUG_LINE_NO:87
  BE_KT02_001_SceneStart.Start() ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0024_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:96
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:97
  ShipPowerOn.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:100
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:101
  kmyQuest.SetShipGravity(1.0) ; #DEBUG_LINE_NO:102
  Alias_EnableMarker.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:103
  Alias_AllCrew.EvaluateAll() ; #DEBUG_LINE_NO:104
  Alias_MiniBot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_0025_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:113
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:114
  kmyQuest.SetShipGravity(GravityFloat) ; #DEBUG_LINE_NO:117
  Game.GetPlayer().PlaceAtMe(BE_KT02_ExplosionHavok as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:118
  BE_KT02_001_SceneStart.Stop() ; #DEBUG_LINE_NO:119
  Alias_EnableMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:120
  Alias_MiniBot.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:129
  enemyShipRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:130
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:131
  If !Self.GetStageDone(15) ; #DEBUG_LINE_NO:133
    enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:134
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:145
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:146
  Alias_AllCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:147
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:148
EndFunction
