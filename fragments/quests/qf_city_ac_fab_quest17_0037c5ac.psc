ScriptName Fragments:Quests:QF_City_AC_FAB_Quest17_0037C5AC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Actor01 Auto Const mandatory
ReferenceAlias Property Alias_Actor02 Auto Const mandatory
ActorValue Property CityLife_FAB_State Auto Const mandatory
Scene Property LifeScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  LifeScene.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetStage(300) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:25
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:26
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:29
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:39
  Self.Stop() ; #DEBUG_LINE_NO:42
EndFunction
