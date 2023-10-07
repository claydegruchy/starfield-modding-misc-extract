ScriptName City_GG_Mark_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Bonifac Auto Const mandatory
ReferenceAlias Property Maldonado Auto Const mandatory

;-- Functions ---------------------------------------

Function StopCombatOnNPCs()
  Game.GetPlayer().StopCombat() ; #DEBUG_LINE_NO:7
  Actor BonACT = Bonifac.GetActorRef() ; #DEBUG_LINE_NO:8
  BonACT.StopCombatAlarm() ; #DEBUG_LINE_NO:9
  BonACT.StopCombat() ; #DEBUG_LINE_NO:10
  Actor MalACT = Maldonado.GetActorRef() ; #DEBUG_LINE_NO:11
  MalACT.StopCombatAlarm() ; #DEBUG_LINE_NO:12
  MalACT.StopCombat() ; #DEBUG_LINE_NO:13
EndFunction
