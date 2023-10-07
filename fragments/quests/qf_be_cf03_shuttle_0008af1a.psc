ScriptName Fragments:Quests:QF_BE_CF03_Shuttle_0008AF1A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
LocationAlias Property Alias_EnemyShipInteriorLocation Auto Const mandatory
Keyword Property SQ_Followers_DisallowTeleportWaitingFollowersToShip Auto Const mandatory
Keyword Property SpaceshipPreventRampOpenOnLanding Auto Const mandatory
ReferenceAlias Property Alias_EnemyShip Auto Const mandatory
Keyword Property BE_CF03_ShuttleShipKeyword Auto Const mandatory
Keyword Property SpaceshipTakeOffPriorityCameraKeyword Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Location enemyShipInteriorLoc = Alias_EnemyShipInteriorLocation.GetLocation() ; #DEBUG_LINE_NO:10
  enemyShipInteriorLoc.AddKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip) ; #DEBUG_LINE_NO:11
  enemyShipInteriorLoc.AddKeyword(SpaceshipTakeOffPriorityCameraKeyword) ; #DEBUG_LINE_NO:14
  enemyShipInteriorLoc.AddKeyword(BE_CF03_ShuttleShipKeyword) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0020_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:23
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:24
  Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SQ_Followers_DisallowTeleportWaitingFollowersToShip) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0030_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:38
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:39
  Self.SetStage(20) ; #DEBUG_LINE_NO:45
  Alias_EnemyShip.GetShipRef().RemoveKeyword(SpaceshipPreventRampOpenOnLanding) ; #DEBUG_LINE_NO:48
  Alias_EnemyShipInteriorLocation.GetLocation().RemoveKeyword(SpaceshipTakeOffPriorityCameraKeyword) ; #DEBUG_LINE_NO:51
  kmyQuest.CleanupAndStop() ; #DEBUG_LINE_NO:54
EndFunction
