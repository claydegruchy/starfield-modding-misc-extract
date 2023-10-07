ScriptName Fragments:Quests:QF_SE_FAB12_00062B49 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property PHailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_SecurityShip Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  PHailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0066_Item_00()
  spaceshipreference HailingShip = Alias_HailingShip.GetShipRef() ; #DEBUG_LINE_NO:16
  spaceshipreference SecurityShip = Alias_SecurityShip.GetShipRef() ; #DEBUG_LINE_NO:17
  HailingShip.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:19
  HailingShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:20
  SecurityShip.AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:21
  SecurityShip.SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(4.0) ; #DEBUG_LINE_NO:32
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:33
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:34
EndFunction
