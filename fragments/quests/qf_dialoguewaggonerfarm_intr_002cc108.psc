ScriptName Fragments:Quests:QF_DialogueWaggonerFarm_Intr_002CC108 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property DialogueWaggonerFarm_IntroScene_Scene Auto Const mandatory
ReferenceAlias Property WaylonWaggoner Auto Const
ReferenceAlias Property MikaelaWaggoner Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  DialogueWaggonerFarm_IntroScene_Scene.Start() ; #DEBUG_LINE_NO:9
EndFunction

Function Fragment_Stage_0200_Item_00()
  WaylonWaggoner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:17
  MikaelaWaggoner.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:18
EndFunction
