ScriptName Fragments:Quests:QF_OE_KT_FalseContact_0007E715 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
GlobalVariable Property OE_Credit_ExtortionMedium Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Smuggler Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
GlobalVariable Property OE_FalseContact_Global Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property OE_ShipOwnerFaction Auto Const mandatory
RefCollectionAlias Property Alias_Smugglers Auto Const mandatory
ReferenceAlias Property Alias_ShipA_CaptainFurniture Auto Const mandatory
ReferenceAlias Property Alias_ShipA_CaptainMarker Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingB Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingC Auto Const mandatory
Furniture Property NPCStanding_DataSlate Auto Const mandatory
GlobalVariable Property RQ_Hello_Calm_PostAcceptValue Auto Const mandatory
ActorValue Property RQ_AV_Hello Auto Const mandatory
GlobalVariable Property RQ_Hello_Calm_PreAcceptValue Auto Const mandatory
RefCollectionAlias Property Alias_CrewName Auto Const mandatory
ReferenceAlias Property Alias_NPC_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_SceneB02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_Crew02 Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
LocationAlias Property Alias_OE_Location Auto Const mandatory
Keyword Property LocTypeOE_ThemeEmptyKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  ObjectReference FurnitureRef = Alias_ShipA_CaptainMarker.GetRef().PlaceAtMe(NPCStanding_DataSlate as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:7
  Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef() ; #DEBUG_LINE_NO:8
  Alias_ShipA_CaptainFurniture.ForceRefTo(FurnitureRef) ; #DEBUG_LINE_NO:11
  SmugglerRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0003_Item_00()
  Int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt() ; #DEBUG_LINE_NO:20
  Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue as Float) ; #DEBUG_LINE_NO:21
  ObjectReference[] SmugRef = Alias_Smugglers.GetArray() ; #DEBUG_LINE_NO:23
  Int I = 0 ; #DEBUG_LINE_NO:24
  While I < SmugRef.Length ; #DEBUG_LINE_NO:25
    Alias_CrewName.AddRef(SmugRef[I]) ; #DEBUG_LINE_NO:26
    I += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
  Alias_Smugglers.SetValue(RQ_AV_Hello, RQValue as Float) ; #DEBUG_LINE_NO:30
  Actor Captain = Alias_NPC_Smuggler.GetActorRef() ; #DEBUG_LINE_NO:33
  Alias_Smugglers.AddRef(Captain as ObjectReference) ; #DEBUG_LINE_NO:35
  Alias_Smugglers.AddRef(Alias_NPC_Crew01.GetRef()) ; #DEBUG_LINE_NO:36
  Alias_Smugglers.AddRef(Alias_NPC_Crew02.GetRef()) ; #DEBUG_LINE_NO:37
  Captain.SetValue(RQ_AV_Hello, 0.0) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0050_Item_00()
  Actor SmugglerRef = Alias_NPC_Smuggler.GetActorRef() ; #DEBUG_LINE_NO:46
  SmugglerRef.RemovefromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:48
  SmugglerRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:49
  SmugglerRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:50
  SmugglerRef.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:51
  Alias_Smugglers.RemovefromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:53
  Alias_Smugglers.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:54
  Alias_Smugglers.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:55
  Alias_Smugglers.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:56
EndFunction

Function Fragment_Stage_0080_Item_00()
  Alias_MapMarker.TryToEnable() ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:73
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:74
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:77
  Self.setstage(80) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:87
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:88
  ObjectReference MarkerB = Alias_Marker_ShipLandingB.GetRef() ; #DEBUG_LINE_NO:91
  ObjectReference MarkerC = Alias_Marker_ShipLandingC.GetRef() ; #DEBUG_LINE_NO:92
  If Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse(False) && MarkerB != None && !MarkerB.IsFurnitureInUse(False) ; #DEBUG_LINE_NO:94
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerB) ; #DEBUG_LINE_NO:95
  ElseIf Alias_Marker_ShipLandingA.GetRef().IsFurnitureInUse(False) && MarkerB.IsFurnitureInUse(False) && MarkerC != None && !MarkerC.IsFurnitureInUse(False) ; #DEBUG_LINE_NO:96
    Alias_Marker_ShipLandingA.ForceRefTo(MarkerC) ; #DEBUG_LINE_NO:97
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.LandShip(-1) ; #DEBUG_LINE_NO:100
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().AddItem(LL_OE_AlternativeReward as Form, 1, False) ; #DEBUG_LINE_NO:108
  OE_FalseContact_Global.SetValue(1.0) ; #DEBUG_LINE_NO:109
  Int RQValue = RQ_Hello_Calm_PostAcceptValue.GetValueInt() ; #DEBUG_LINE_NO:111
  Alias_NPC_Smuggler.GetActorRef().SetValue(RQ_AV_Hello, RQValue as Float) ; #DEBUG_LINE_NO:112
EndFunction

Function Fragment_Stage_0300_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:120
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:121
  Alias_ShipA.GetShipRef().SetExteriorLoadDoorInaccessible(True) ; #DEBUG_LINE_NO:124
  Utility.Wait(10.0) ; #DEBUG_LINE_NO:125
  kmyQuest.LaunchShip(0, None, False) ; #DEBUG_LINE_NO:126
  If Alias_OE_Location.GetLocation().HasKeyword(LocTypeOE_ThemeEmptyKeyword) ; #DEBUG_LINE_NO:127
    Alias_MapMarker.TryToDisable() ; #DEBUG_LINE_NO:128
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:137
EndFunction
