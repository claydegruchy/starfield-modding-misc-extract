ScriptName Fragments:Quests:QF_MQ304b_0015D399 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_KeeperAquilus Auto Const mandatory
Scene Property MQ304_002c_CompanionReaction_AquilusDead Auto Const mandatory
Scene Property MQ304_002c_CompanionReaction_AquilusLives Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Faction Property MQScorpiusBoardingFaction Auto Const mandatory
Quest Property City_NA_Aquilus01 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:7
  Alias_KeeperAquilus.GetActorRef().SetEssential(False) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().addtoFaction(MQScorpiusBoardingFaction) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0027_Item_00()
  Actor AquilusREF = Alias_KeeperAquilus.GetActorRef() ; #DEBUG_LINE_NO:20
  AquilusREF.SendAssaultAlarm() ; #DEBUG_LINE_NO:22
  AquilusREF.addtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:23
  AquilusREF.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:24
  AquilusREF.StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:33
  MQ304_002c_CompanionReaction_AquilusDead.Start() ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:43
  MQ304_002c_CompanionReaction_AquilusLives.Start() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0037_Item_00()
  Alias_KeeperAquilus.GetActorRef().Disable(False) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Stage_0040_Item_00()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef() ; #DEBUG_LINE_NO:62
  ScorpiusREF.MoveTo(HelixOborumMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:64
  ScorpiusREF.Enable(False) ; #DEBUG_LINE_NO:65
  Alias_Hunter.GetActorRef().MoveTo(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:70
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0100_Item_00()
  If Self.GetStageDone(42) ; #DEBUG_LINE_NO:79
    Self.SetStage(1100) ; #DEBUG_LINE_NO:80
  ElseIf Self.GetStageDone(44) ; #DEBUG_LINE_NO:81
    Self.SetStage(1200) ; #DEBUG_LINE_NO:82
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1000) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:93
  Self.Stop() ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_1100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:103
  Self.Stop() ; #DEBUG_LINE_NO:105
EndFunction

Function Fragment_Stage_1200_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:113
  Self.Stop() ; #DEBUG_LINE_NO:115
EndFunction

Function Fragment_Stage_1300_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:123
  Self.Stop() ; #DEBUG_LINE_NO:125
EndFunction
