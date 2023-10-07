ScriptName Fragments:Quests:QF_City_NA_FAB_Quest03_00037348 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Alias_Actor01.GetRef().Enable(False) ; #DEBUG_LINE_NO:7
  Alias_Actor02.GetRef().Enable(False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:34
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:35
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:38
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:48
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:49
  Self.Stop() ; #DEBUG_LINE_NO:51
EndFunction
