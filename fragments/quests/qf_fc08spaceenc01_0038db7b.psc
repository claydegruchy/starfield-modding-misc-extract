ScriptName Fragments:Quests:QF_FC08SpaceEnc01_0038DB7B Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  spaceshipreference ShipREF = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  ShipREF.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:8
  ShipREF.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:9
EndFunction
