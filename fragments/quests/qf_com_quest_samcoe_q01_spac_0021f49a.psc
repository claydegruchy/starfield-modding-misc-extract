ScriptName Fragments:Quests:QF_COM_Quest_SamCoe_Q01_Spac_0021F49A Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  ShipREF.EnableWithGravJump() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:16
  ShipREF.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:17
  ShipREF.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:26
EndFunction
