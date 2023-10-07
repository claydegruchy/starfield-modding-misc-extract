ScriptName Fragments:Quests:QF_BE_CF02_Ragana_BoardingQu_0010CB89 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Rake Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Faction Property CF02_RaganaFaction Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_CaptainSpawnMarker Auto Const mandatory
RefCollectionAlias Property Alias_CrewSpawnMarkers Auto Const mandatory
ObjectReference Property CF_AustinRakeRef Auto Const
LeveledItem Property LL_Weapon_Ranged_Handgun Auto Const mandatory
Faction Property CF02_RaganaHostileFaction Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Quest Property CF02_Ragana_SpeechChallenge04 Auto Const mandatory
ReferenceAlias Property Alias_CF02_Winston Auto Const mandatory
ReferenceAlias Property Alias_ModuleExit Auto Const mandatory
Scene Property BE_CF02_Ragana_BoardingQuestMovePlacement Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Scene Property BE_CF02_Ragana_Winston_Dialogue Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn01 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew02 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew03 Auto Const mandatory
ReferenceAlias Property Alias_GenericCrew04 Auto Const mandatory
ReferenceAlias Property Alias_AustinRakeName Auto Const mandatory
ReferenceAlias Property DmitriNPC01 Auto Const mandatory
ReferenceAlias Property DmitriNPC02 Auto Const mandatory
ReferenceAlias Property DmitriNPC03 Auto Const mandatory
affinityevent Property BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01 Auto Const mandatory
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn02 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn03 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawn04 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture01 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture02 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture03 Auto Const mandatory
ReferenceAlias Property Alias_CrewSpawnFurniture04 Auto Const mandatory
Keyword Property LinkCustom09 Auto Const mandatory
Keyword Property LinkCustom10 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0002_Item_00()
  BE_CF02_Ragana_BoardingQuestMovePlacement.Stop() ; #DEBUG_LINE_NO:7
  Alias_GenericCrew04.GetRef().EnableNoWait(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_CF02_Ragana_Winston_Dialogue.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_CF02_Ragana_Winston_Dialogue_Action04_Choice01.Send(None) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0005_Item_00()
  CF02.SetObjectiveCompleted(550, True) ; #DEBUG_LINE_NO:32
  CF02.SetObjectiveDisplayed(560, True, False) ; #DEBUG_LINE_NO:33
  ObjectReference CaptainRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:35
  Alias_CF02_Winston.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:37
  Alias_Rake.ForceRefTo(CF_AustinRakeRef) ; #DEBUG_LINE_NO:38
  Alias_AustinRakeName.ForceRefTo(CF_AustinRakeRef) ; #DEBUG_LINE_NO:39
  CF_AustinRakeRef.MoveTo(Alias_CrewSpawn01.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:40
  Alias_AllCrew.AddRef(CF_AustinRakeRef) ; #DEBUG_LINE_NO:41
  ObjectReference[] myCrew = Alias_AllCrew.GetArray() ; #DEBUG_LINE_NO:43
  myCrew[1].AddItem(LL_Weapon_Ranged_Handgun as Form, 1, False) ; #DEBUG_LINE_NO:45
  myCrew[2].AddItem(LL_Weapon_Ranged_Handgun as Form, 1, False) ; #DEBUG_LINE_NO:46
  BE_CF02_Ragana_BoardingQuestMovePlacement.Start() ; #DEBUG_LINE_NO:48
  Self.SetStage(9) ; #DEBUG_LINE_NO:49
  ObjectReference Link01 = Alias_CrewSpawn01.GetRef().GetLinkedRef(LinkCustom09) ; #DEBUG_LINE_NO:51
  ObjectReference Link02 = Alias_CrewSpawn02.GetRef().GetLinkedRef(LinkCustom09) ; #DEBUG_LINE_NO:52
  ObjectReference Link03 = Alias_CrewSpawn03.GetRef().GetLinkedRef(LinkCustom09) ; #DEBUG_LINE_NO:53
  ObjectReference Link04 = Alias_CrewSpawn04.GetRef().GetLinkedRef(LinkCustom09) ; #DEBUG_LINE_NO:54
  Alias_CrewSpawnFurniture01.ForceRefTo(Link01) ; #DEBUG_LINE_NO:55
  Alias_CrewSpawnFurniture02.ForceRefTo(Link02) ; #DEBUG_LINE_NO:56
  Alias_CrewSpawnFurniture03.ForceRefTo(Link03) ; #DEBUG_LINE_NO:57
  Alias_CrewSpawnFurniture04.ForceRefTo(Link04) ; #DEBUG_LINE_NO:58
EndFunction

Function Fragment_Stage_0007_Item_00()
  If Self.GetStageDone(8) && !Self.GetStageDone(40) ; #DEBUG_LINE_NO:66
    Self.SetStage(30) ; #DEBUG_LINE_NO:67
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(20) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0008_Item_00()
  Alias_AustinRakeName.Clear() ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Stage_0009_Item_00()
  ObjectReference CaptainRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:86
  DmitriNPC01.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:88
  DmitriNPC02.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:89
  DmitriNPC03.ForceRefTo(CaptainRef) ; #DEBUG_LINE_NO:90
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_GenericCrew.AddRef(Alias_GenericCrew02.GetRef()) ; #DEBUG_LINE_NO:98
  Alias_GenericCrew.AddRef(Alias_GenericCrew03.GetRef()) ; #DEBUG_LINE_NO:99
  Alias_GenericCrew.AddRef(Alias_GenericCrew04.GetRef()) ; #DEBUG_LINE_NO:100
  Alias_GenericCrew.EnableAll(False) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_0015_Item_00()
  CF02.SetObjectiveCompleted(560, True) ; #DEBUG_LINE_NO:109
  CF02_Ragana_SpeechChallenge04.Start() ; #DEBUG_LINE_NO:110
EndFunction

Function Fragment_Stage_0020_Item_00()
  CF02.SetObjectiveFailed(560, True) ; #DEBUG_LINE_NO:118
  CF02.SetObjectiveSkipped(600) ; #DEBUG_LINE_NO:119
  CF02.SetObjectiveSkipped(605) ; #DEBUG_LINE_NO:120
  CF02.SetObjectiveDisplayed(606, True, False) ; #DEBUG_LINE_NO:121
  ObjectReference CaptainRef = Alias_Captain.GetRef() ; #DEBUG_LINE_NO:123
  Alias_AllCrew.AddRef(CaptainRef) ; #DEBUG_LINE_NO:125
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:127
  Alias_AllCrew.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:128
  PlayerRef.RemoveFromFaction(CF02_RaganaFaction) ; #DEBUG_LINE_NO:129
  Alias_Rake.GetActorRef().StartCombat(PlayerRef as ObjectReference, False) ; #DEBUG_LINE_NO:131
  Utility.Wait(0.5) ; #DEBUG_LINE_NO:132
  Alias_AllCrew.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:133
  Alias_AllCrew.StartCombatAll(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:134
  Alias_ModuleExit.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:135
  spaceshipreference RaganaRef = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:137
  RaganaRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:139
  RaganaRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0030_Item_00()
  CF02.SetObjectiveCompleted(600, True) ; #DEBUG_LINE_NO:148
  CF02.SetObjectiveSkipped(605) ; #DEBUG_LINE_NO:149
  Actor RakeRef = Alias_Rake.GetActorRef() ; #DEBUG_LINE_NO:151
  RakeRef.RemoveFromFaction(CF02_RaganaFaction) ; #DEBUG_LINE_NO:152
  Alias_AllCrew.RemoveRef(RakeRef as ObjectReference) ; #DEBUG_LINE_NO:153
  RakeRef.SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:154
  RakeRef.StartCombat(Alias_Captain.GetActorRef() as ObjectReference, False) ; #DEBUG_LINE_NO:155
  RakeRef.AddToFaction(CF02_RaganaHostileFaction) ; #DEBUG_LINE_NO:156
  Alias_GenericCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:158
  Alias_GenericCrew.StartCombatAll(RakeRef as ObjectReference) ; #DEBUG_LINE_NO:159
EndFunction

Function Fragment_Stage_0040_Item_00()
  CF02.SetObjectiveCompleted(605, True) ; #DEBUG_LINE_NO:167
  BE_CF02_Ragana_Winston_Dialogue.Stop() ; #DEBUG_LINE_NO:168
  Actor[] CrewRef = Alias_AllCrew.GetActorArray() ; #DEBUG_LINE_NO:169
  Int I = 0 ; #DEBUG_LINE_NO:170
  While I < CrewRef.Length ; #DEBUG_LINE_NO:172
    CrewRef[I].EvaluatePackage(False) ; #DEBUG_LINE_NO:173
    Utility.Wait(0.75) ; #DEBUG_LINE_NO:174
    I += 1 ; #DEBUG_LINE_NO:175
  EndWhile ; #DEBUG_LINE_NO:
  CF02.SetStage(475) ; #DEBUG_LINE_NO:178
  CF02.SetStage(480) ; #DEBUG_LINE_NO:179
  Self.SetStage(11) ; #DEBUG_LINE_NO:180
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.GetStageDone(60) ; #DEBUG_LINE_NO:188
    CF02.SetStage(520) ; #DEBUG_LINE_NO:189
  Else ; #DEBUG_LINE_NO:
    CF02.SetStage(610) ; #DEBUG_LINE_NO:191
  EndIf ; #DEBUG_LINE_NO:
  CF02.SetObjectiveCompleted(606, True) ; #DEBUG_LINE_NO:194
  Self.SetStage(11) ; #DEBUG_LINE_NO:195
EndFunction

Function Fragment_Stage_0060_Item_00()
  If Self.GetStageDone(50) ; #DEBUG_LINE_NO:203
    CF02.SetStage(520) ; #DEBUG_LINE_NO:204
    Self.SetStage(1000) ; #DEBUG_LINE_NO:205
  EndIf ; #DEBUG_LINE_NO:
  Alias_ModuleExit.GetRef().Lock(False, False, True) ; #DEBUG_LINE_NO:207
  spaceshipreference ShipRef = Alias_enemyShip.GetShipRef() ; #DEBUG_LINE_NO:209
  ShipRef.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:211
EndFunction

Function Fragment_Stage_1000_Item_00()
  Alias_enemyShip.GetShipRef().SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:219
EndFunction

Function Fragment_Stage_2000_Item_00()
  CF02.SetStage(12) ; #DEBUG_LINE_NO:227
  Self.Stop() ; #DEBUG_LINE_NO:228
EndFunction
