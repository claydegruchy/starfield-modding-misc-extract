ScriptName Fragments:Quests:QF_FFNewAtlantis05_0008E2D9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_SmugglerShip Auto Const mandatory
RefCollectionAlias Property Alias_ShipCrew Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Book Property FFNewAtlantis05_Slate Auto Const mandatory
ReferenceAlias Property Alias_Slate Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Global Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Credits_Small Auto Const mandatory
GlobalVariable Property FFNewAtlantis05_Credits_Medium Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_Contraband Auto Const mandatory
ReferenceAlias Property Alias_Chest Auto Const mandatory
MiscObject Property FFNewAtlantis05_MissionCargoTypeContraband Auto Const mandatory
Scene Property FFNewAtlantis05_TL_Captain_Greet Auto Const mandatory
Quest Property FFNewAtlantis06 Auto Const mandatory
ReferenceAlias Property Alias_SpawnMarker Auto Const mandatory
Scene Property FFNewAtlantis05_070_Move_Captain Auto Const mandatory
Quest Property FFNewAtlantis02Misc Auto Const mandatory
ReferenceAlias Property Alias_Crew01 Auto Const mandatory
ReferenceAlias Property Alias_Crew02 Auto Const mandatory
Faction Property FFNewAtlantis05_LandingFactionShip Auto Const mandatory
ReferenceAlias Property Alias_landingMarker Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
LocationAlias Property Alias_ShipInterior Auto Const mandatory
Faction Property EclipticFaction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  Alias_landingMarker.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:7
  Alias_SmugglerShip.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:8
  Alias_ShipCrew.DisableAll(False) ; #DEBUG_LINE_NO:9
  Self.SetObjectiveCompleted(2, False) ; #DEBUG_LINE_NO:10
  Self.SetObjectiveDisplayed(2, True, False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetObjectiveCompleted(3, True) ; #DEBUG_LINE_NO:19
  If Self.GetStageDone(30) ; #DEBUG_LINE_NO:20
    Self.SetStage(40) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0004_Item_00()
  Actor[] ShipCrewRef = Alias_ShipCrew.GetActorArray() ; #DEBUG_LINE_NO:30
  Int I = 0 ; #DEBUG_LINE_NO:32
  While I < ShipCrewRef.Length ; #DEBUG_LINE_NO:33
    ShipCrewRef[I].IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:34
    ShipCrewRef[I].SetEssential(False) ; #DEBUG_LINE_NO:35
    I += 1 ; #DEBUG_LINE_NO:36
  EndWhile ; #DEBUG_LINE_NO:
  Alias_ShipCrew.RemovefromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:39
  Alias_ShipCrew.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:40
  Alias_ShipCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:41
  Alias_ShipCrew.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:42
  Self.SetObjectiveSkipped(70) ; #DEBUG_LINE_NO:43
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Stage_0006_Item_00()
  FFNewAtlantis05_Global.SetValue(2.0) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0007_Item_00()
  FFNewAtlantis05_Global.SetValue(1.0) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0008_Item_00()
  FFNewAtlantis05_Global.SetValue(3.0) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0009_Item_00()
  FFNewAtlantis05_Global.SetValue(4.0) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0012_Item_00()
  Self.SetObjectiveSkipped(60) ; #DEBUG_LINE_NO:84
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:85
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:86
  Game.GetPlayer().AddItem(Credits as Form, FFNewAtlantis05_Credits_Small.GetValueInt(), False) ; #DEBUG_LINE_NO:87
  Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband as Form, 1, False, None) ; #DEBUG_LINE_NO:88
  Self.SetStage(90) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Stage_0013_Item_00()
  Self.SetObjectiveSkipped(60) ; #DEBUG_LINE_NO:97
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:98
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:99
  Game.GetPlayer().AddItem(Credits as Form, FFNewAtlantis05_Credits_Medium.GetValueInt(), False) ; #DEBUG_LINE_NO:100
  Game.GetPlayer().RemoveItem(FFNewAtlantis05_MissionCargoTypeContraband as Form, 1, False, None) ; #DEBUG_LINE_NO:101
  Self.SetStage(90) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0014_Item_00()
  Self.SetObjectiveSkipped(70) ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:118
  Game.GetPlayer().AddItem(Alias_Contraband.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:119
  Self.SetStage(90) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0016_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:128
  FFNewAtlantis05_TL_Captain_Greet.Start() ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0020_Item_00()
  FFNewAtlantis02Misc.SetStage(40) ; #DEBUG_LINE_NO:137
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:138
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:146
  If !Self.GetStageDone(45) ; #DEBUG_LINE_NO:147
    Self.SetObjectiveDisplayed(40, True, False) ; #DEBUG_LINE_NO:148
  ElseIf Self.GetStageDone(3) ; #DEBUG_LINE_NO:149
    Self.SetStage(40) ; #DEBUG_LINE_NO:150
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:159
  Alias_landingMarker.GetRef().SetFactionOwner(FFNewAtlantis05_LandingFactionShip, False) ; #DEBUG_LINE_NO:160
EndFunction

Function Fragment_Stage_0045_Item_00()
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:168
  Self.SetObjectiveDisplayed(3, True, False) ; #DEBUG_LINE_NO:169
  Game.GetPlayer().AddAliasedItem(FFNewAtlantis05_Slate as Form, Alias_Slate as Alias, 1, True) ; #DEBUG_LINE_NO:171
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:179
  Self.SetStage(60) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_SmugglerShip.TryToEnable() ; #DEBUG_LINE_NO:188
  Alias_SmugglerShip.GetShipRef().SetExteriorLoadDoorInaccessible(False) ; #DEBUG_LINE_NO:189
  ObjectReference CaptainRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:191
  Cell AnansiRef = CaptainRef.GetParentCell() ; #DEBUG_LINE_NO:193
  AnansiRef.SetFactionOwner(EclipticFaction) ; #DEBUG_LINE_NO:195
  AnansiRef.SetPublic(True) ; #DEBUG_LINE_NO:196
  Alias_ShipCrew.AddRef(CaptainRef) ; #DEBUG_LINE_NO:198
  Alias_ShipCrew.AddRef(Alias_Crew01.GetRef()) ; #DEBUG_LINE_NO:199
  Alias_ShipCrew.AddRef(Alias_Crew02.GetRef()) ; #DEBUG_LINE_NO:200
  Alias_ShipCrew.EnableAll(False) ; #DEBUG_LINE_NO:201
  Self.SetObjectiveCompleted(2, True) ; #DEBUG_LINE_NO:203
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:204
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:205
  Alias_Chest.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:206
  Alias_Contraband.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:207
EndFunction

Function Fragment_Stage_0060_Item_01()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:215
  Self.SetStage(2) ; #DEBUG_LINE_NO:216
EndFunction

Function Fragment_Stage_0070_Item_00()
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:224
  Game.GetPlayer().AddItem(Alias_Contraband.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0090_Item_00()
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:233
  Self.SetObjectiveDisplayed(80, True, False) ; #DEBUG_LINE_NO:234
EndFunction

Function Fragment_Stage_0095_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Contraband.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:242
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:250
  FFNewAtlantis06.Start() ; #DEBUG_LINE_NO:251
  Alias_landingMarker.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:252
EndFunction

Function Fragment_Stage_0100_Item_01()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:260
  Self.SetStage(2) ; #DEBUG_LINE_NO:261
  FFNewAtlantis06.Start() ; #DEBUG_LINE_NO:262
  Alias_landingMarker.GetRef().SetFactionOwner(None, False) ; #DEBUG_LINE_NO:263
  Self.Stop() ; #DEBUG_LINE_NO:264
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:272
EndFunction
