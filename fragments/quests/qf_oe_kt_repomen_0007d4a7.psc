ScriptName Fragments:Quests:QF_OE_KT_RepoMen_0007D4A7 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LeveledItem Property LL_Weapon_Ranged_Any Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
RefCollectionAlias Property Alias_NPC_Group01 Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
spaceshipbase Property RepoSpaceship Auto Const mandatory
ReferenceAlias Property Alias_Marker_ShipLandingA Auto Const mandatory
ReferenceAlias Property Alias_ShipA Auto Const mandatory
LocationAlias Property Alias_ShipA_InteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_InteriorMarker00 Auto Const mandatory
LeveledItem Property LL_OE_AlternativeReward Auto Const mandatory
Faction Property OE_GroupAllyFaction Auto Const mandatory
GlobalVariable Property OE_Credit_RepoBounty Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson03 Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson02 Auto Const mandatory
ReferenceAlias Property Alias_NPC_RepoPerson01 Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property CrimeFactionFreestar Auto Const mandatory
ReferenceAlias Property Alias_NPCStandingClipboard Auto Const mandatory
ReferenceAlias Property Alias_ShipDoor Auto Const mandatory
LocationAlias Property Alias_ShipA_ExteriorLocation Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker00 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker01 Auto Const mandatory
ReferenceAlias Property Alias_Marker_TravelB02 Auto Const mandatory
ReferenceAlias Property Alias_ShipA_LandingDeckMarker02 Auto Const mandatory
ActorBase Property LvlSecurity_Freestar Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
ActorBase Property LvlSecurity_UC Auto Const mandatory
ReferenceAlias Property Alias_ShipA_PilotSeat Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:8
  kmyQuest.LandShip(1) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0020_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef() ; #DEBUG_LINE_NO:19
  mySeat.BlockActivation(True, False) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Stage_0030_Item_00()
  ObjectReference mySeat = Alias_ShipA_PilotSeat.GetRef() ; #DEBUG_LINE_NO:29
  mySeat.BlockActivation(False, False) ; #DEBUG_LINE_NO:31
  Alias_ShipA_PilotSeat.Clear() ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_NPC_Group01.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:40
  Alias_NPC_Group01.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:41
  Alias_NPC_Group01.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0080_Item_00()
  Self.SetStage(84) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0080_Item_01()
  ObjectReference LandingDeckUCRef = Alias_ShipA_LandingDeckMarker00.GetRef() ; #DEBUG_LINE_NO:58
  ObjectReference UCGuard01Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:59
  ObjectReference UCGuard02Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:60
  ObjectReference UCGuard03Ref = LandingDeckUCRef.PlaceAtMe(LvlSecurity_UC as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:61
  Alias_NPC_RepoPerson01.ForceRefTo(UCGuard01Ref) ; #DEBUG_LINE_NO:63
  Alias_NPC_RepoPerson02.ForceRefTo(UCGuard02Ref) ; #DEBUG_LINE_NO:64
  Alias_NPC_RepoPerson03.ForceRefTo(UCGuard03Ref) ; #DEBUG_LINE_NO:65
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef()) ; #DEBUG_LINE_NO:67
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef()) ; #DEBUG_LINE_NO:68
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef()) ; #DEBUG_LINE_NO:69
  Alias_NPC_Group01.EnableAll(LandingDeckUCRef as Bool) ; #DEBUG_LINE_NO:71
  Alias_NPC_Group01.MoveAllTo(LandingDeckUCRef) ; #DEBUG_LINE_NO:72
  Self.SetStage(50) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0084_Item_00()
  ObjectReference LandingDeckRef = Alias_ShipA_LandingDeckMarker00.GetRef() ; #DEBUG_LINE_NO:84
  ObjectReference Freestar01Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:85
  ObjectReference Freestar02Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:86
  ObjectReference Freestar03Ref = LandingDeckRef.PlaceAtMe(LvlSecurity_Freestar as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:87
  Alias_NPC_RepoPerson01.ForceRefTo(Freestar01Ref) ; #DEBUG_LINE_NO:89
  Alias_NPC_RepoPerson02.ForceRefTo(Freestar02Ref) ; #DEBUG_LINE_NO:90
  Alias_NPC_RepoPerson03.ForceRefTo(Freestar03Ref) ; #DEBUG_LINE_NO:91
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson01.GetRef()) ; #DEBUG_LINE_NO:93
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson02.GetRef()) ; #DEBUG_LINE_NO:94
  Alias_NPC_Group01.AddRef(Alias_NPC_RepoPerson03.GetRef()) ; #DEBUG_LINE_NO:95
  Self.SetStage(50) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0090_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:105
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:106
  Alias_ShipA.RefillDependentAliases() ; #DEBUG_LINE_NO:109
  If Self.GetStageDone(10) ; #DEBUG_LINE_NO:111
    Self.SetStage(80) ; #DEBUG_LINE_NO:112
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(84) ; #DEBUG_LINE_NO:114
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:123
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:124
  Int I = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:127
  If I == 1 ; #DEBUG_LINE_NO:129
    kmyQuest.LandShip(0) ; #DEBUG_LINE_NO:130
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(10) ; #DEBUG_LINE_NO:132
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_01()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:141
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:142
  kmyQuest.LandShip(0) ; #DEBUG_LINE_NO:145
EndFunction

Function Fragment_Stage_0100_Item_02()
  Self.SetStage(10) ; #DEBUG_LINE_NO:153
EndFunction

Function Fragment_Stage_0100_Item_03()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:161
  oe_shipsaddonscript kmyQuest = __temp as oe_shipsaddonscript ; #DEBUG_LINE_NO:162
  Int I = Utility.RandomInt(0, 1) ; #DEBUG_LINE_NO:165
  If I == 1 ; #DEBUG_LINE_NO:167
    kmyQuest.LandShip(0) ; #DEBUG_LINE_NO:168
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(10) ; #DEBUG_LINE_NO:170
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_Guard.Clear() ; #DEBUG_LINE_NO:179
  Self.Stop() ; #DEBUG_LINE_NO:180
EndFunction
