ScriptName Fragments:Quests:QF_TraitKidStuff_0010C2FA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Dad Auto Const mandatory
Perk Property TRAIT_KidStuff Auto Const mandatory
Scene Property TraitKidStuff_0325_LodgeBanter Auto Const mandatory
Scene Property TraitKidStuff_0350_LodgePostBanter Auto Const mandatory
Keyword Property TraitKidStuffKeyword Auto Const mandatory
ObjectReference Property MQ101_WalterMarker01 Auto Const mandatory
ObjectReference Property MQ401_HostileMarker03 Auto Const mandatory
ObjectReference Property MQ401A_VascoMarker Auto Const mandatory
ReferenceAlias Property Alias_Mom Auto Const mandatory
ReferenceAlias Property Alias_Noel Auto Const mandatory
ReferenceAlias Property Alias_Note01 Auto Const mandatory
ReferenceAlias Property Alias_Note02 Auto Const mandatory
ReferenceAlias Property Alias_Note03 Auto Const mandatory
Book Property Trait_KidStuff_Note01 Auto Const mandatory
Book Property Trait_KidStuff_Note02 Auto Const mandatory
Book Property Trait_KidStuff_Note03 Auto Const mandatory
Scene Property TraitKidStuff_2025_NeonBark Auto Const mandatory
Scene Property TraitKidStuff_2125_AkilaCityBark Auto Const mandatory
LeveledItem Property LL_Weapon_Reward_KidStuff Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ActorBase Property Trait_KS_Dad Auto Const mandatory
ActorBase Property Trait_KS_Mom Auto Const mandatory
LeveledItem Property LL_Quest_Reward_KidStuff_Spacesuit Auto Const mandatory
ReferenceAlias Property Alias_Spaceship Auto Const mandatory
ReferenceAlias Property Alias_Elevator Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
ReferenceAlias Property Alias_MomTeleportMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(25) ; #DEBUG_LINE_NO:8
  Self.SetStage(50) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:12
  Game.GetPlayer().AddPerk(TRAIT_KidStuff, False) ; #DEBUG_LINE_NO:13
EndFunction

Function Fragment_Stage_0001_Item_00()
  Trait_KS_Dad.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase()) ; #DEBUG_LINE_NO:24
  Trait_KS_Mom.DeriveGeneticParentAppearance(Game.GetPlayer().GetLeveledActorBase()) ; #DEBUG_LINE_NO:25
  (Alias_Elevator.GetRef() as loadelevatorfloorscript).SetAccessible(True) ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0040_Item_00()
  Actor aTarg = Alias_Dad.GetActorRef() ; #DEBUG_LINE_NO:36
  ObjectReference oMarker = MQ101_WalterMarker01 ; #DEBUG_LINE_NO:37
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:38
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:39
  aTarg = Alias_Mom.GetActorRef() ; #DEBUG_LINE_NO:41
  oMarker = MQ401_HostileMarker03 ; #DEBUG_LINE_NO:42
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:43
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:44
  aTarg = Alias_Noel.GetActorRef() ; #DEBUG_LINE_NO:46
  oMarker = MQ401A_VascoMarker ; #DEBUG_LINE_NO:47
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:48
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:49
  TraitKidStuff_0325_LodgeBanter.Start() ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:68
  Alias_Dad.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:71
  Alias_Mom.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(3.0) ; #DEBUG_LINE_NO:81
  TraitKidStuff_0350_LodgePostBanter.Start() ; #DEBUG_LINE_NO:82
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().AddItem(LL_Weapon_Reward_KidStuff as Form, 1, False) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0325_Item_00()
  Actor aTarg = Alias_Dad.GetActorRef() ; #DEBUG_LINE_NO:99
  ObjectReference oMarker = MQ101_WalterMarker01 ; #DEBUG_LINE_NO:100
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:101
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  aTarg = Alias_Mom.GetActorRef() ; #DEBUG_LINE_NO:104
  oMarker = MQ401_HostileMarker03 ; #DEBUG_LINE_NO:105
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:106
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:107
  aTarg = Alias_Noel.GetActorRef() ; #DEBUG_LINE_NO:109
  oMarker = MQ401A_VascoMarker ; #DEBUG_LINE_NO:110
  aTarg.SetLinkedRef(oMarker, TraitKidStuffKeyword, True) ; #DEBUG_LINE_NO:111
  aTarg.MoveTo(oMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:112
  TraitKidStuff_0325_LodgeBanter.Start() ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0325_Item_01()
  Self.SetStage(30) ; #DEBUG_LINE_NO:123
EndFunction

Function Fragment_Stage_0375_Item_00()
  ObjectReference MoveHomeRef = Alias_MomTeleportMarker.GetRef() ; #DEBUG_LINE_NO:131
  Actor DadRef = Alias_Dad.GetActorRef() ; #DEBUG_LINE_NO:133
  Actor MomRef = Alias_Mom.GetActorRef() ; #DEBUG_LINE_NO:134
  DadRef.MoveTo(MoveHomeRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:136
  MomRef.MoveTo(MoveHomeRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:137
  DadRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:138
  MomRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:139
EndFunction

Function Fragment_Stage_1050_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note01 as Form, Alias_Note01 as Alias, 1, False) ; #DEBUG_LINE_NO:148
EndFunction

Function Fragment_Stage_1200_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_KidStuff_Spacesuit as Form, 1, False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_1250_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note02 as Form, Alias_Note02 as Alias, 1, False) ; #DEBUG_LINE_NO:165
EndFunction

Function Fragment_Stage_1300_Item_00()
  spaceshipreference FreeShip = Alias_Spaceship.GetShipRef() ; #DEBUG_LINE_NO:173
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:176
  SQ_PlayerShip.AddPlayerOwnedShip(FreeShip) ; #DEBUG_LINE_NO:177
  FreeShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:181
EndFunction

Function Fragment_Stage_1350_Item_00()
  Game.GetPlayer().AddAliasedItem(Trait_KidStuff_Note03 as Form, Alias_Note03 as Alias, 1, False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_2025_Item_00()
  TraitKidStuff_2025_NeonBark.Start() ; #DEBUG_LINE_NO:199
EndFunction

Function Fragment_Stage_2125_Item_00()
  TraitKidStuff_2125_AkilaCityBark.Start() ; #DEBUG_LINE_NO:208
EndFunction

Function Fragment_Stage_8000_Item_00()
  Game.GetPlayer().RemovePerk(TRAIT_KidStuff) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_9000_Item_00()
  (Alias_Elevator.GetRef() as loadelevatorfloorscript).SetAccessible(False) ; #DEBUG_LINE_NO:224
  Self.Stop() ; #DEBUG_LINE_NO:225
EndFunction
