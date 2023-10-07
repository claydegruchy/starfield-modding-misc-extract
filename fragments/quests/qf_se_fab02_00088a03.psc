ScriptName Fragments:Quests:QF_SE_FAB02_00088A03 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ActorValue Property ShipSystemEngineHealth Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
Scene Property SE_FAB02_400_FlyingAway Auto Const mandatory
ActorValue Property ShipSystemShieldsHealth Auto Const mandatory
ReferenceAlias Property Alias_Instructor Auto Const mandatory
Faction Property PlayerFriendFaction Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
LeveledItem Property LL_Quest_Reward_Credits_Misc_01_Small Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Trainee Auto Const mandatory
ActorValue Property SpaceshipCrew Auto Const mandatory
RefCollectionAlias Property Alias_ShipCrew Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ActorValue Property ShieldHealth Auto Const mandatory
Faction Property SE_FAB02_Faction Auto Const mandatory
Faction Property PlayerFaction Auto Const mandatory
ReferenceAlias Property Alias_CaptainsLocker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  oTarg.EnablePartRepair(ShipSystemEngineHealth, False) ; #DEBUG_LINE_NO:9
  oTarg.EnablePartRepair(ShipSystemShieldsHealth, False) ; #DEBUG_LINE_NO:10
  oTarg.SetValue(ShipSystemShieldsHealth, 0.0) ; #DEBUG_LINE_NO:11
  oTarg.SetGhost(True) ; #DEBUG_LINE_NO:13
  oTarg.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:14
  Actor TeacherRef = Alias_Instructor.GetActorRef() ; #DEBUG_LINE_NO:16
  TeacherRef.SetGhost(True) ; #DEBUG_LINE_NO:17
  TeacherRef.SetRestrained(True) ; #DEBUG_LINE_NO:18
  Actor TraineeRef = Alias_Trainee.GetActorRef() ; #DEBUG_LINE_NO:19
  TraineeRef.SetGhost(True) ; #DEBUG_LINE_NO:20
  Cell myCell = TeacherRef.GetParentCell() ; #DEBUG_LINE_NO:22
  myCell.SetFactionOwner(SE_FAB02_Faction) ; #DEBUG_LINE_NO:23
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:24
  Alias_CaptainsLocker.GetRef().SetFactionOwner(PlayerFaction, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:33
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:34
  Alias_ShipCrew.AddRef(Alias_Trainee.GetRef()) ; #DEBUG_LINE_NO:36
  Alias_ShipCrew.AddRef(Alias_Instructor.GetRef()) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0025_Item_00()
  If !Self.GetStageDone(500) ; #DEBUG_LINE_NO:45
    Alias_Instructor.GetActorRef().Kill(None) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(30) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0030_Item_00()
  Actor InstructorRef = Alias_Instructor.GetActorRef() ; #DEBUG_LINE_NO:57
  Actor TraineeRef = Alias_Trainee.GetActorRef() ; #DEBUG_LINE_NO:58
  ObjectReference PlayerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:59
  TraineeRef.SetGhost(False) ; #DEBUG_LINE_NO:61
  TraineeRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:62
  TraineeRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:63
  TraineeRef.StartCombat(PlayerRef, False) ; #DEBUG_LINE_NO:64
  If Self.GetStageDone(500) ; #DEBUG_LINE_NO:66
    InstructorRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:67
    InstructorRef.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:68
    InstructorRef.StartCombat(PlayerRef, False) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
  Actor TeacherRef = Alias_Instructor.GetActorRef() ; #DEBUG_LINE_NO:72
  TeacherRef.SetGhost(False) ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0030_Item_01()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:81
  ShipRef.RemoveFromFaction(PlayerFriendFaction) ; #DEBUG_LINE_NO:83
  ShipRef.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:84
  ShipRef.IgnoreFriendlyHits(False) ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:94
EndFunction

Function Fragment_Stage_0066_Item_00()
  Alias_HailingShip.GetShipRef().SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:102
EndFunction

Function Fragment_Stage_0070_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:110
  ShipRef.DamageValue(ShipSystemShieldsHealth, 10000.0) ; #DEBUG_LINE_NO:112
  ShipRef.DamageValue(ShieldHealth, 10000.0) ; #DEBUG_LINE_NO:113
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:114
  Self.SetStage(69) ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_0075_Item_00()
  spaceshipreference ShipRef = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:123
  ShipRef.DamageValue(ShipSystemEngineHealth, 10000.0) ; #DEBUG_LINE_NO:125
  ShipRef.SetValue(DockingPermission, 0.0) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:128
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Stage_0300_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:139
  oTarg.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:141
  oTarg.SetGhost(True) ; #DEBUG_LINE_NO:142
  oTarg.SetValue(ShipSystemShieldsHealth, 1000.0) ; #DEBUG_LINE_NO:143
  oTarg.SetValue(ShipSystemEngineHealth, 10000.0) ; #DEBUG_LINE_NO:144
  Utility.Wait(12.0) ; #DEBUG_LINE_NO:145
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:146
EndFunction

Function Fragment_Stage_0400_Item_00()
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:155
  oTarg.EvaluatePackage(False) ; #DEBUG_LINE_NO:156
  oTarg.SetGhost(False) ; #DEBUG_LINE_NO:157
  SE_FAB02_400_FlyingAway.Start() ; #DEBUG_LINE_NO:160
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:162
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:170
  Actor TeacherRef = Alias_Instructor.GetActorRef() ; #DEBUG_LINE_NO:172
  TeacherRef.SetGhost(False) ; #DEBUG_LINE_NO:173
  TeacherRef.SetRestrained(False) ; #DEBUG_LINE_NO:174
  Alias_Trainee.GetActorRef().SetGhost(False) ; #DEBUG_LINE_NO:176
EndFunction

Function Fragment_Stage_0600_Item_00()
  Game.GetPlayer().AddItem(LL_Quest_Reward_Credits_Misc_01_Small as Form, 1, False) ; #DEBUG_LINE_NO:184
  Utility.Wait(4.0) ; #DEBUG_LINE_NO:185
  Alias_Instructor.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:186
  Self.CompleteQuest() ; #DEBUG_LINE_NO:187
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:195
  Self.SetObjectiveSkipped(20) ; #DEBUG_LINE_NO:196
  Self.SetObjectiveSkipped(30) ; #DEBUG_LINE_NO:197
EndFunction
