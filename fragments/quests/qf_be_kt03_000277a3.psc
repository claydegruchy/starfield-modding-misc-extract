ScriptName Fragments:Quests:QF_BE_KT03_000277A3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
Float Property GravityFloat Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Quest Property SE_KT03 Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
ReferenceAlias Property Alias_FirstMate Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0006_Item_00()
  SE_KT03.SetStage(2) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0007_Item_00()
  SE_KT03.SetStage(3) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0008_Item_00()
  Self.SetStage(8) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0009_Item_00()
  Faction myFaction = Alias_EnemyShip.GetShipRef().GetCrimeFaction() ; #DEBUG_LINE_NO:31
  Int I = 0 ; #DEBUG_LINE_NO:33
  Actor[] robotCrew = Alias_AllCrew.GetActorArray() ; #DEBUG_LINE_NO:34
  While I < robotCrew.Length ; #DEBUG_LINE_NO:35
    robotCrew[I].SetCrimeFaction(myFaction) ; #DEBUG_LINE_NO:36
    I += 1 ; #DEBUG_LINE_NO:37
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:46
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:48
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:50
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT03.SetStage(30) ; #DEBUG_LINE_NO:58
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:59
EndFunction

Function Fragment_Stage_0020_Item_03()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:67
  Self.SetStage(8) ; #DEBUG_LINE_NO:68
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:76
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:84
  enemyShipRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:85
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:86
  enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_GenericCrew.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:95
  Alias_GenericCrew.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:96
  Alias_GenericCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:97
  Alias_GenericCrew.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:98
  SE_KT03.SetStage(6) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:115
  Self.Stop() ; #DEBUG_LINE_NO:116
EndFunction
