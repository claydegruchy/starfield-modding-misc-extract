ScriptName Fragments:Quests:QF_PlayerSkills_01000971 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property Health Auto Const mandatory
Int Property FitnessHealthBonus = 10 Auto Const
ActorValue Property CarryWeight Auto Const mandatory
Int Property CarryWeightBonus = 10 Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0101_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0102_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0103_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Stage_0104_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_0105_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0111_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0112_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0113_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0114_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Stage_0115_Item_00()
  Game.GetPlayer().ModValue(Health, FitnessHealthBonus as Float) ; #DEBUG_LINE_NO:79
EndFunction

Function Fragment_Stage_0201_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float) ; #DEBUG_LINE_NO:87
EndFunction

Function Fragment_Stage_0202_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float) ; #DEBUG_LINE_NO:95
EndFunction

Function Fragment_Stage_0203_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float) ; #DEBUG_LINE_NO:103
EndFunction

Function Fragment_Stage_0204_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float) ; #DEBUG_LINE_NO:111
EndFunction

Function Fragment_Stage_0205_Item_00()
  Game.GetPlayer().ModValue(CarryWeight, CarryWeightBonus as Float) ; #DEBUG_LINE_NO:119
EndFunction
