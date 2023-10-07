ScriptName Fragments:Quests:QF_BE_KT06_0002F845 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property SpaceshipCrew Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
ReferenceAlias Property Alias_Captain Auto Const mandatory
RefCollectionAlias Property Alias_GenericCrew Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
Faction Property REPlayerFriend Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
ReferenceAlias Property Alias_Comms Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Scene Property BE_KT06_Scene01 Auto Const mandatory
GlobalVariable Property BE_KT06_MetOnceGlobal Auto Const mandatory
Quest Property SE_KT06 Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
GlobalVariable Property BE_KT06_OneDead Auto Const mandatory
Scene Property BE_KT06_Scene00 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  BE_KT06_Scene01.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0009_Item_00()
  BE_KT06_MetOnceGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_AllCrew.AddRef(Alias_Comms.GetRef()) ; #DEBUG_LINE_NO:23
  Alias_AllCrew.AddRef(Alias_Captain.GetRef()) ; #DEBUG_LINE_NO:24
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:26
  Alias_PilotSeat.GetRef().BlockActivation(True, True) ; #DEBUG_LINE_NO:28
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:29
  BE_KT06_Scene00.Start() ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT06.SetStage(30) ; #DEBUG_LINE_NO:40
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:41
EndFunction

Function Fragment_Stage_0020_Item_00()
  BE_KT06_OneDead.SetValue(1.0) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0030_Item_00()
  BE_KT06_OneDead.SetValue(1.0) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:65
  enemyShipRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:66
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:67
  enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:68
  BE_KT06_MetOnceGlobal.SetValue(1.0) ; #DEBUG_LINE_NO:70
EndFunction

Function Fragment_Stage_0055_Item_00()
  ObjectReference PilotSeat = Alias_PilotSeat.GetRef() ; #DEBUG_LINE_NO:78
  PilotSeat.BlockActivation(False, False) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_Comms.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:88
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:89
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:90
  Alias_AllCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:91
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:92
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:93
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:109
  Self.Stop() ; #DEBUG_LINE_NO:110
EndFunction
