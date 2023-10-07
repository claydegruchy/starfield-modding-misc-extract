ScriptName Fragments:Quests:QF_BE_KT05_000179C1 Extends Quest Const hidden

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
GlobalVariable Property BE_KT05_SSNNQuiz Auto Const mandatory
ReferenceAlias Property Alias_Comms Auto Const mandatory
RefCollectionAlias Property Alias_AllCrew Auto Const mandatory
Quest Property SE_KT05 Auto Const mandatory
Scene Property BE_KT05_DialogueCaptain_SceneBusy Auto Const mandatory
Scene Property BE_KT05_DialogueCaptain_Scene Auto Const mandatory
Outfit Property Outfit_Clothes_Business_Any_NoRyujin Auto Const mandatory
ReferenceAlias Property Alias_PilotSeat Auto Const mandatory
ReferenceAlias Property Alias_Clipboard Auto Const mandatory
Faction Property BEKT05_CaptainFaction Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0003_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0004_Item_00()
  BE_KT05_SSNNQuiz.Mod(1.0) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0009_Item_00()
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0010_Item_00()
  BE_KT05_SSNNQuiz.SetValue(0.0) ; #DEBUG_LINE_NO:47
  Actor CaptainRef = Alias_Captain.GetActorRef() ; #DEBUG_LINE_NO:48
  Alias_Clipboard.GetRef().SetFactionOwner(BEKT05_CaptainFaction, False) ; #DEBUG_LINE_NO:50
  Alias_AllCrew.AddRef(Alias_Comms.GetRef()) ; #DEBUG_LINE_NO:51
  Alias_AllCrew.AddRef(CaptainRef as ObjectReference) ; #DEBUG_LINE_NO:52
  CaptainRef.SetOutfit(Outfit_Clothes_Business_Any_NoRyujin, False) ; #DEBUG_LINE_NO:53
  CaptainRef.SetCrimeFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:54
  Cell myCell = Alias_PilotSeat.GetRef().GetParentCell() ; #DEBUG_LINE_NO:55
  myCell.SetPublic(True) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0015_Item_00()
  SE_KT05.SetStage(30) ; #DEBUG_LINE_NO:65
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Stage_0020_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:74
EndFunction

Function Fragment_Stage_0050_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:82
  enemyShipRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:83
  Utility.Wait(6.0) ; #DEBUG_LINE_NO:84
  enemyShipRef.DisableWithGravJump() ; #DEBUG_LINE_NO:85
EndFunction

Function Fragment_Stage_0060_Item_00()
  Alias_AllCrew.RemoveFromFaction(REPlayerFriend) ; #DEBUG_LINE_NO:93
  Alias_AllCrew.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:94
  Alias_AllCrew.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:95
  Alias_AllCrew.StartCombatAll(Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:96
  Self.SetObjectiveSkipped(10) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0065_Item_00()
  spaceshipreference enemyShipRef = Alias_EnemyShip.GetShipRef() ; #DEBUG_LINE_NO:105
  enemyShipRef.SetValue(SpaceshipCrew, 0.0) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0100_Item_04()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:114
  BE_KT05_DialogueCaptain_Scene.Stop() ; #DEBUG_LINE_NO:115
  BE_KT05_DialogueCaptain_SceneBusy.Start() ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:124
  Self.Stop() ; #DEBUG_LINE_NO:125
EndFunction
