ScriptName Fragments:Quests:QF_DialogueWaggonerFarm_0100086F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property pPlayerMetAV_MollyWaggoner Auto Const mandatory
ActorValue Property PlayerMetAV_WaylonWaggoner Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:7
  Player.setvalue(pPlayerMetAV_MollyWaggoner, 1.0) ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:17
  Player.setvalue(PlayerMetAV_WaylonWaggoner, 1.0) ; #DEBUG_LINE_NO:19
EndFunction
