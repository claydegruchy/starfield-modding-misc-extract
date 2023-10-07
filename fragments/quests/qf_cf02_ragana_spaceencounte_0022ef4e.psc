ScriptName Fragments:Quests:QF_CF02_Ragana_SpaceEncounte_0022EF4E Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
Quest Property CF02 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
ReferenceAlias Property Alias_EscortShip Auto Const mandatory
ReferenceAlias Property Alias_playerShip Auto Const mandatory
ReferenceAlias Property Alias_RaganaSpeechChallenge Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_RaganaSpeechChallenge.ForceRefTo(Alias_Ship01.GetRef()) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipRaganaRef = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:15
  spaceshipreference ShipEscortRef = Alias_EscortShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:16
  ShipRaganaRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:18
  ShipRaganaRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:19
  ShipRaganaRef.SetValue(DockingPermission, 4.0) ; #DEBUG_LINE_NO:20
  ShipEscortRef.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:22
  ShipEscortRef.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:23
  ShipEscortRef.Startcombat(Alias_playerShip.GetShipRef(), False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0500_Item_00()
  CF02.SetStage(520) ; #DEBUG_LINE_NO:32
EndFunction
