ScriptName Fragments:Quests:QF_SE_EnemyShips_Varuun00_0004B540_1 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Enemy01 Auto Const mandatory
ReferenceAlias Property Alias_Enemy02 Auto Const mandatory
ReferenceAlias Property Alias_Enemy03 Auto Const mandatory
ReferenceAlias Property Alias_Enemy04 Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0005_Item_00()
  Alias_Enemy01.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:7
  Alias_Enemy02.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:8
  Alias_Enemy03.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:9
  Alias_Enemy04.GetShipRef().SetValue(Aggression, 0.0) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0007_Item_00()
  Utility.wait(10.0) ; #DEBUG_LINE_NO:18
  Self.setstage(10) ; #DEBUG_LINE_NO:19
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_Enemy01.GetShipRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:27
  Alias_Enemy02.GetShipRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:28
  Alias_Enemy03.GetShipRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:29
  Alias_Enemy04.GetShipRef().SetValue(Aggression, 1.0) ; #DEBUG_LINE_NO:30
EndFunction
