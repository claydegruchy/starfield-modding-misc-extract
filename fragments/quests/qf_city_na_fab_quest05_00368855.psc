ScriptName Fragments:Quests:QF_City_NA_FAB_Quest05_00368855 Extends Quest Const hidden

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

Function Fragment_Stage_0300_Item_00()
  Alias_Actor01.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:26
  Alias_Actor02.GetRef().SetValue(CityLife_FAB_State, 1.0) ; #DEBUG_LINE_NO:27
  Alias_Actor01.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:30
  Alias_Actor02.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Stage_9000_Item_00()
  Alias_Actor01.GetRef().Disable(False) ; #DEBUG_LINE_NO:40
  Alias_Actor02.GetRef().Disable(False) ; #DEBUG_LINE_NO:41
  Self.Stop() ; #DEBUG_LINE_NO:43
EndFunction
