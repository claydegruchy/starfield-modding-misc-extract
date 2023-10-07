ScriptName Fragments:Quests:QF_MS04_001CD001 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property MS04_PickedUp_IntroBook Auto Const mandatory
Book Property MS04_IntroSlate Auto Const mandatory
ReferenceAlias Property Alias_SecretOutpostSlate Auto Const mandatory
Scene Property MS04_SpacerEavesdrop01 Auto Const mandatory
ReferenceAlias Property Alias_Livvey Auto Const mandatory
Scene Property MS04_0500_FinalMessage Auto Const mandatory
Scene Property AudioLogs_MS04_AliceInheritance Auto Const mandatory
Scene Property AudioLogs_MS04_AliceLearnsMantis Auto Const mandatory
Scene Property MS04_Livvey_01_PuzzleSolved Auto Const mandatory
Scene Property MS04_0475_LivveyBetrayal Auto Const mandatory
ReferenceAlias Property Alias_InitialSpacer Auto Const mandatory
Scene Property MS04_0300_InitialSpacerWarning Auto Const mandatory
Scene Property MS04_0390_LiveyBark Auto Const mandatory
Scene Property MS04_SpacerEavesdrop02 Auto Const mandatory
ReferenceAlias Property Alias_BetrayalDoor Auto Const mandatory
ReferenceAlias Property Alias_MantisShip Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ActorValue Property MS04_Foreknowledge_LivveyBetrayalAV Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_WorldMapMarker Auto Const mandatory
ObjectReference Property LC119RobotActivationTrigger Auto Const mandatory
ReferenceAlias Property Alias_BetrayalTrigger Auto Const mandatory
ObjectReference Property LivveyExplosionMarker Auto Const mandatory
Explosion Property fragGrenadeExplosion Auto Const mandatory
ReferenceAlias Property Alias_LivveyExplosionMarker Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
Float Property cooldownDays Auto Const mandatory
GlobalVariable Property SE_Player_FAB15_Timestamp Auto Const mandatory
GlobalVariable Property SE_Player_FAB16_Timestamp Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:7
  MS04_PickedUp_IntroBook.SetValue(1.0) ; #DEBUG_LINE_NO:10
  Game.GetPlayer().RemoveItem(MS04_IntroSlate as Form, 1, True, None) ; #DEBUG_LINE_NO:13
  Game.GetPlayer().AddAliasedItem(MS04_IntroSlate as Form, Alias_SecretOutpostSlate as Alias, 1, True) ; #DEBUG_LINE_NO:14
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:22
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:23
  Alias_WorldMapMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0250_Item_00()
  MS04_0300_InitialSpacerWarning.Start() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0302_Item_00()
  Alias_InitialSpacer.GetRef().SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:53
  Alias_InitialSpacer.GetActorRef().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0305_Item_00()
  MS04_SpacerEavesdrop01.Start() ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Stage_0310_Item_00()
  MS04_SpacerEavesdrop02.Start() ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0325_Item_00()
  MS04_Livvey_01_PuzzleSolved.Start() ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_0350_Item_00()
  Self.SetObjectiveDisplayed(350, True, False) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0355_Item_00()
  If Self.GetStageDone(360) && Self.GetStageDone(365) && Self.GetStageDone(370) ; #DEBUG_LINE_NO:98
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
  AudioLogs_MS04_AliceInheritance.Start() ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0360_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(365) && Self.GetStageDone(370) ; #DEBUG_LINE_NO:112
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:113
  EndIf ; #DEBUG_LINE_NO:
  AudioLogs_MS04_AliceLearnsMantis.Start() ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_0365_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(360) && Self.GetStageDone(370) ; #DEBUG_LINE_NO:126
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:127
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0370_Item_00()
  If Self.GetStageDone(355) && Self.GetStageDone(360) && Self.GetStageDone(365) ; #DEBUG_LINE_NO:137
    Self.SetObjectiveCompleted(350, True) ; #DEBUG_LINE_NO:138
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0390_Item_00()
  If !Self.GetStageDone(480) ; #DEBUG_LINE_NO:148
    Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:149
    MS04_0390_LiveyBark.Start() ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0405_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:167
  Actor aTarg = Alias_Livvey.GetActorRef() ; #DEBUG_LINE_NO:169
  aTarg.RemoveFromAllFactions() ; #DEBUG_LINE_NO:170
  aTarg.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:171
  aTarg.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:172
  aTarg.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:173
  aTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:174
EndFunction

Function Fragment_Stage_0450_Item_00()
  Alias_Livvey.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:182
EndFunction

Function Fragment_Stage_0475_Item_00()
  MS04_0475_LivveyBetrayal.Start() ; #DEBUG_LINE_NO:191
  ObjectReference oDoor = Alias_BetrayalDoor.GetRef() ; #DEBUG_LINE_NO:194
  oDoor.SetOpen(False) ; #DEBUG_LINE_NO:195
  oDoor.SetLockLevel(254) ; #DEBUG_LINE_NO:196
  oDoor.Lock(True, False, True) ; #DEBUG_LINE_NO:197
  Alias_BetrayalTrigger.GetRef().Enable(False) ; #DEBUG_LINE_NO:200
  Game.GetPlayer().SetValue(MS04_Foreknowledge_LivveyBetrayalAV, 1.0) ; #DEBUG_LINE_NO:202
EndFunction

Function Fragment_Stage_0477_Item_00()
  Alias_LivveyExplosionMarker.GetRef().PlaceAtMe(fragGrenadeExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:211
  Alias_Livvey.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:214
  Alias_Livvey.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:215
  ObjectReference oDoor = Alias_BetrayalDoor.GetRef() ; #DEBUG_LINE_NO:218
  oDoor.SetOpen(True) ; #DEBUG_LINE_NO:219
  oDoor.SetLockLevel(0) ; #DEBUG_LINE_NO:220
  oDoor.Lock(False, False, True) ; #DEBUG_LINE_NO:221
EndFunction

Function Fragment_Stage_0480_Item_00()
  Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:229
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(300, True) ; #DEBUG_LINE_NO:237
  Self.SetObjectiveDisplayed(600, True, False) ; #DEBUG_LINE_NO:238
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:239
  MS04_0500_FinalMessage.Start() ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_0600_Item_00()
  Self.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:250
  If Self.GetStageDone(700) ; #DEBUG_LINE_NO:253
    Self.SetStage(800) ; #DEBUG_LINE_NO:254
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:263
  spaceshipreference myShip = Alias_MantisShip.GetShipRef() ; #DEBUG_LINE_NO:266
  sq_playershipscript SQ_PlayerShip = Game.GetForm(95394) as sq_playershipscript ; #DEBUG_LINE_NO:269
  SQ_PlayerShip.AddPlayerOwnedShip(myShip) ; #DEBUG_LINE_NO:270
  myShip.SetValue(SpaceshipRegistration, 1.0) ; #DEBUG_LINE_NO:274
  Alias_MantisShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:276
  Alias_MantisShip.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:277
  If Self.GetStageDone(600) ; #DEBUG_LINE_NO:280
    Self.SetStage(800) ; #DEBUG_LINE_NO:281
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  Self.SetObjectiveDisplayed(800, True, False) ; #DEBUG_LINE_NO:290
  Actor aLivvey = Alias_Livvey.GetActorRef() ; #DEBUG_LINE_NO:293
  If aLivvey.IsDead() == False ; #DEBUG_LINE_NO:294
    aLivvey.Disable(False) ; #DEBUG_LINE_NO:295
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:304
  Self.SetStage(9000) ; #DEBUG_LINE_NO:305
  Float currentGameTime = Utility.GetCurrentGameTime() ; #DEBUG_LINE_NO:308
  SE_Player_FAB15_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:309
  SE_Player_FAB16_Timestamp.SetValue(currentGameTime + cooldownDays) ; #DEBUG_LINE_NO:310
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:318
EndFunction
