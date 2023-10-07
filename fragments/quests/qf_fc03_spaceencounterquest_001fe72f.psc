ScriptName Fragments:Quests:QF_FC03_SpaceEncounterQuest_001FE72F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_OutlawShipRookie01 Auto Const mandatory
ReferenceAlias Property Alias_OutlawShipRookie02 Auto Const mandatory
ActorValue Property Health Auto Const mandatory
RefCollectionAlias Property Alias_OutlawShipsAll Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0200_Item_00()
  Alias_OutlawShipsAll.SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:7
  Alias_OutlawShipsAll.AddToFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:8
  Alias_Ship01.GetShipRef().EnablePartRepair(Health, False) ; #DEBUG_LINE_NO:11
  Alias_OutlawShipRookie01.GetShipRef().EnablePartRepair(Health, False) ; #DEBUG_LINE_NO:12
  Alias_OutlawShipRookie02.GetShipRef().EnablePartRepair(Health, False) ; #DEBUG_LINE_NO:13
  Float fBlastDamage01 = Alias_Ship01.GetShipRef().GetBaseValue(Health) * 0.400000006 ; #DEBUG_LINE_NO:16
  Alias_Ship01.GetShipRef().DamageValue(Health, fBlastDamage01) ; #DEBUG_LINE_NO:17
  Float fBlastDamage02 = Alias_OutlawShipRookie01.GetShipRef().GetBaseValue(Health) * 0.600000024 ; #DEBUG_LINE_NO:19
  Alias_OutlawShipRookie01.GetShipRef().DamageValue(Health, fBlastDamage02) ; #DEBUG_LINE_NO:20
  Float fBlastDamage03 = Alias_OutlawShipRookie02.GetShipRef().GetBaseValue(Health) * 0.5 ; #DEBUG_LINE_NO:22
  Alias_OutlawShipRookie02.GetShipRef().DamageValue(Health, fBlastDamage03) ; #DEBUG_LINE_NO:23
EndFunction
