ScriptName Fragments:Quests:QF_DialogueWaggonerFarm_002D4C15 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property pPlayerMetAV_MollyWaggoner Auto Const mandatory
ActorValue Property PlayerMetAV_WaylonWaggoner Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:9
  Player.setvalue(pPlayerMetAV_MollyWaggoner, 1.0) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Player = Game.GetPlayer() ; #DEBUG_LINE_NO:21
  Player.setvalue(PlayerMetAV_WaylonWaggoner, 1.0) ; #DEBUG_LINE_NO:23
EndFunction
